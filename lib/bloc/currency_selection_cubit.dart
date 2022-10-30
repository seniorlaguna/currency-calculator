import 'package:bloc/bloc.dart';
import 'package:currency_calculator/data/repository.dart';
import 'package:currency_calculator/data/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CurrencySelectionCubit extends Cubit<CurrencySelectionState> {
  final CurrencyCalculatorRepository repository;
  List<Currency> _currencies = [];
  final Map<Currency, List<String>> _searchMap = {};
  final TextEditingController controller = TextEditingController();

  static CurrencySelectionCubit of(BuildContext context) => RepositoryProvider.of<CurrencySelectionCubit>(context);

  CurrencySelectionCubit(this.repository, super.initialState);

  Future<void> init(BuildContext context) async {
    if (state.initialized) return;
    
    _currencies = await repository.getAllCurrencies();
    
    for (Currency c in _currencies) {
      List<String> tags = [];
      tags.add(c.id.toLowerCase());
      tags.add(FlutterI18n.translate(context, "currency.${c.id}").toLowerCase());
      tags.add(c.flagCode.toLowerCase());
      tags.add(c.symbol.toLowerCase());
      tags.addAll(c.countryIds.map((id) => FlutterI18n.translate(context, "country.$id").toLowerCase()));
      _searchMap[c] = tags;
    }

    emit(state.copyWith(initialized: true, currencies: _currencies, showClear: false));
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      emit(state.copyWith(currencies: _currencies, showClear: false));
    }
    List<Currency> result = _currencies.where((c) => _searchMap[c]!.any((tag) => tag.contains(query.toLowerCase()))).toList();
    emit(state.copyWith(currencies: result, showClear: true));
  }

  Future<void> clearSearch() async {
    controller.clear();
    emit(state.copyWith(currencies: _currencies, showClear: false));
  }

}