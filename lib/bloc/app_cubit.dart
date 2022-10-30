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

  AppCubit(this.repository, super.initialState) : fromController = TextEditingController(), toController = TextEditingController();

  Future<void> init() async {
    List<Currency> currencies = await repository.getAllCurrencies();
    await repository.fetchConversionRates();
    
    // default
    if (state.from == state.to) {
      var eur = currencies.firstWhere((element) => element.id == "eur");
      var usd = currencies.firstWhere((element) => element.id == "usd");
      emit(state.copyWith(initialized: true, from: eur, to: usd, conversionRate: await repository.getConversionRate(eur, usd), refreshDate: await repository.getRatesDate()));
    }
    
    emit(state.copyWith(refreshDate: await repository.getRatesDate(), conversionRate: await repository.getConversionRate(state.from!, state.to!)));
  }

  @override
  Future<void> close() {
    fromController.dispose();
    toController.dispose();
    return super.close();
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
    double rate = await repository.getConversionRate(currency, state.to!);
    emit(state.copyWith(from: currency, conversionRate: rate));
    onFromValueChanged();
  }

  Future<void> setToCurrency(Currency currency) async {
    double rate = await repository.getConversionRate(state.from!, currency);
    emit(state.copyWith(to: currency, conversionRate: rate));
    onFromValueChanged();
  }

  void switchCurrencies() {
    emit(state.copyWith(from: state.to, to: state.from, conversionRate: 1/state.conversionRate!));
    onFromValueChanged();
  }

  Future<void> refresh() async {
    try {
      await repository.fetchConversionRates();
      DateTime? date = await repository.getRatesDate();
      double rate = await repository.getConversionRate(state.from!, state.to!);
      emit(state.copyWith(conversionRate: rate, refreshDate: date));
      onFromValueChanged();
    } catch (_) {
      emit(state.copyWith(error: "refresh"));
    }
    
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) => AppState.fromJson(json);
   
  @override
  Map<String, dynamic>? toJson(AppState state) => state.toJson();
}