import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_calculator/data/types.dart';
import 'package:hive/hive.dart';

typedef Rates = Map<String, Map<String, dynamic>>;

class CurrencyCalculatorRepository {
  static const String _cacheCurrenciesTimeStampKey = "ctimestamp";
  static const String _cacheRatesTimeStampKey = "rtimestamp";
  static const String _cacheCurrenciesDataKey = "cdata";
  static const String _cacheRatesDataKey = "rdata";

  final Box _cache;

  CurrencyCalculatorRepository(this._cache);

  void close() {
    _cache.close();
  }

  bool _itsNDaysAfter(int days, DateTime date) =>
      DateTime.now().isAfter(date.add(Duration(days: days)));

  bool _its30DaysAfter(DateTime date) => _itsNDaysAfter(30, date);

  bool _itsNextDayAfter3(DateTime date) {
    DateTime now = DateTime.now();

    if (now.isBefore(date)) return false;
    if (now.day == date.day && now.month == date.month && now.year == date.year)
      return false;
    if (now.hour >= 3 && now.minute >= 15) return true;
    return false;
  }

  // cache management
  DateTime? _getCacheDate(String key) {
    int timestamp = _cache.get(key, defaultValue: -1);
    if (timestamp == -1) return null;

    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  DateTime? _getCurrenciesCacheDate() =>
      _getCacheDate(_cacheCurrenciesTimeStampKey);

  DateTime? _getRatesCacheDate() => _getCacheDate(_cacheRatesTimeStampKey);

  Future<void> _setCacheTime(String key, DateTime date) {
    return _cache.put(key, date.microsecondsSinceEpoch);
  }

  Future<Iterable<Currency>> getCurrencies() async {
    DateTime? date = _getCurrenciesCacheDate();

    // no cache yet or new data might be available
    if (date == null || _its30DaysAfter(date)) {
      Iterable<Currency> currencies = await _getCurrenciesFromFirebase();
      return currencies;
    }
    // get from cache
    else {
      try {
        Iterable<Currency> currencies = await _getCurrenciesFromCache();
      return currencies;
      } on Exception {
        Iterable<Currency> currencies = await _getCurrenciesFromFirebase();
      return currencies;
      }
      
    }
  }

  Future<Iterable<Currency>> _getCurrenciesFromCache() async {
    
      QuerySnapshot<Currency> query = await FirebaseFirestore.instance
          .collection("currencies")
          .withConverter<Currency>(
              fromFirestore: (snapshot, options) =>
                  Currency.fromJson(snapshot.data()!),
              toFirestore: (_, __) =>
                  throw Exception("Not allowed to write currency to firestore"))
          .get(const GetOptions(source: Source.cache));

      if (query.docs.isEmpty) throw Exception("No currencies in cache");

      return query.docs.where((element) => element.data().countryIds.isNotEmpty && element.data().id.isNotEmpty,).map((e) => e.data());
   
  }

  Future<Iterable<Currency>> _getCurrenciesFromFirebase() async {
    try {
      QuerySnapshot<Currency> query = await FirebaseFirestore.instance
          .collection("currencies")
          .withConverter<Currency>(
              fromFirestore: (snapshot, options) =>
                  Currency.fromJson(snapshot.data()!),
              toFirestore: (_, __) =>
                  throw Exception("Not allowed to write currency to firestore"))
          .get(const GetOptions(source: Source.server));

      _setCacheTime(_cacheCurrenciesTimeStampKey, DateTime.now());
      return query.docs.map((e) => e.data());
    } catch (_) {
      throw Exception();
    }
  }

  Future<Rates> getRates() async {
    DateTime? date = _getRatesCacheDate();

    // no cache data or new rates available
    if (date == null || _itsNextDayAfter3(date)) {
      Rates rates = await _getRatesFromFirebase();
      return rates;
    }
    // get from cache
    else {
      try {
        return await _getRatesFromCache();
      } catch (_) {
        return _getRatesFromFirebase();
      }
      
    }
  }

  Future<Rates> _getRatesFromCache() async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection("rates")
        .get(const GetOptions(source: Source.cache));
    
    Rates rates = {};
    for (var rate in query.docs) {
      rates[rate.id] = rate.data();
    }
    if (rates.isEmpty) throw Exception("No rates in cache");
    return rates;
  }

  Future<Rates> _getRatesFromFirebase() async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection("rates")
        .get(const GetOptions(source: Source.server));
    
    _setCacheTime(_cacheRatesTimeStampKey, DateTime.now());
    
    Rates rates = {};
    for (var rate in query.docs) {
      rates[rate.id] = rate.data();
    }
    return rates;
  }
}

class FirebaseRatesException extends Error {}