import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_calculator/data/repository.dart';
import 'package:currency_calculator/data/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppCubit extends HydratedCubit<AppState> {
  final CurrencyCalculatorRepository repository;
  final TextEditingController fromController;
  final TextEditingController toController;
  

  static AppCubit of(BuildContext context) => BlocProvider.of<AppCubit>(context);

  List<Currency> _currencies = [];
  Rates _rates = {};

  AppCubit(this.repository, super.initialState) : fromController = TextEditingController(), toController = TextEditingController();

  Future<void> init() async {
    try {
      emit(state.copyWith(loading: true, error: false));

      _currencies = (await repository.getCurrencies()).toList();
      _rates = await repository.getRates();
    
      // default
      if (state.from == state.to) {
        var eur = _currencies.firstWhere((element) => element.id == "eur");
        var usd = _currencies.firstWhere((element) => element.id == "usd");
        emit(state.copyWith(loading: false, error: false, from: eur, to: usd, conversionRate: _getConversionRate(eur, usd), refreshDate: _getRatesDate(eur, usd)));
      }
    
      emit(state.copyWith(loading: false, error: false, refreshDate: _getRatesDate(state.from!, state.to!), conversionRate: _getConversionRate(state.from!, state.to!)));
    
    } catch (_) {
      emit(state.copyWith(error: true));
    }

  }

  @override
  Future<void> close() {
    fromController.dispose();
    toController.dispose();
    repository.close();
    return super.close();
  }

  DateTime _getRatesDate(Currency from, Currency to) {
    return Timestamp.fromMillisecondsSinceEpoch(_rates[from.id]!["date"]).toDate();
  }

  double _getConversionRate(Currency from, Currency to) {
    dynamic value = _rates[from.id]![to.id];
    if (value.runtimeType == int) return (value as int).toDouble();
    return value as double;
  }

  void onFromValueChanged() {
    double? from = double.tryParse(fromController.text);
    if (fromController.value.text.isEmpty) {
      toController.clear();
    }
    if (from == null) return;

    toController.value = TextEditingValue(text: (from * state.conversionRate!).toStringAsFixed(2));

  }

  void onToValueChanged() {
    double? to = double.tryParse(toController.text);
    if (toController.value.text.isEmpty) {
      fromController.clear();
    }
    if (to == null) return;

    fromController.value = TextEditingValue(text: (to / state.conversionRate!).toStringAsFixed(2));
  }

  Future<void> setFromCurrency(Currency currency) async {
    double rate = _getConversionRate(currency, state.to!);
    emit(state.copyWith(from: currency, conversionRate: rate));
    onFromValueChanged();
  }

  Future<void> setToCurrency(Currency currency) async {
    double rate = _getConversionRate(state.from!, currency);
    emit(state.copyWith(to: currency, conversionRate: rate));
    onFromValueChanged();
  }

  Future<void> switchCurrencies() async {
    emit(state.copyWith(from: state.to, to: state.from, conversionRate: _getConversionRate(state.to!, state.from!)));
    onFromValueChanged();
  }

  Future<void> refresh() async {
    try {
      if (state.error) {
        init();
        return;
      }
      
      _rates = await repository.getRates();
      DateTime? date = _getRatesDate(state.from!, state.to!);
      double rate = _getConversionRate(state.from!, state.to!);
      emit(state.copyWith(conversionRate: rate, refreshDate: date));
      onFromValueChanged();
    } catch (_) {
      emit(state.copyWith(message: "refresh"));
      emit(AppState(loading: state.loading, error: state.error, conversionRate: state.conversionRate, from: state.from, to: state.to, refreshDate: state.refreshDate, message: null));

    }
    
  }



  @override
  AppState? fromJson(Map<String, dynamic> json) => AppState.fromJson(json);
   
  @override
  Map<String, dynamic>? toJson(AppState state) => state.toJson();
}