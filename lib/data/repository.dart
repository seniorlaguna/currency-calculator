import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_calculator/data/types.dart';

class CurrencyCalculatorRepository {

  final List<Currency> _currencies = [];
  final Map<String, Map<String, double>> _rates = {};
  DateTime? _ratesRefreshDate;

  Future<List<Currency>> getAllCurrencies() async {
    // return [
    //   Currency(id: "eur", flagCode: "eu", symbol: "€", countryIds: ["de", "fr"], bills: [1,2,5,10,20,50,100,200,500]),
    //   Currency(id: "usd", flagCode: "us", symbol: "\$", countryIds: ["us"], bills: [1,5,10,20,50,100,200]),
    // ];

    if (_currencies.isNotEmpty) return _currencies;
    var query = await FirebaseFirestore.instance.collection("currencies").get();
    _currencies.addAll(query.docs.map((currencyJson) => Currency.fromJson(currencyJson.data())));
    return _currencies;
  }

  Future<double> getConversionRate(Currency from, Currency to) async {
    if (from == to) return 1;
    return _rates[from.id]![to.id]!;
  }

  Future<DateTime?> getRatesDate() async {
    return _ratesRefreshDate;
  }

  Future<void> fetchConversionRates() async {
    if (_currencies.isEmpty) {
      await getAllCurrencies();
    }

    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance.collection("rates").get();
    for (Currency c in _currencies) {
      _rates[c.id] = query.docs.firstWhere((element) => element.id == c.id).data().map((key, value) {
        return MapEntry(key, value.runtimeType == int ? (value as int).toDouble() : value as double);
      });
    }

    _ratesRefreshDate = (query.docs.firstWhere((element) => element.id == "update").data()["value"] as Timestamp).toDate();

    print(_currencies);
    print(_ratesRefreshDate);
  }
}