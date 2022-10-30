import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';


@freezed
class Currency with _$Currency {
  const factory Currency({
    required String id,
    required String flagCode,
    required String symbol,
    required List<String> countryIds,
    required List<double> bills
  }) = _Currency;

  factory Currency.fromJson(Map<String, Object?> json) => _$CurrencyFromJson(json);
}

@freezed
class CurrencySelectionState with _$CurrencySelectionState {
  const factory CurrencySelectionState({
    required bool initialized,
    bool? showClear,
    List<Currency>? currencies
  }) = _CurrencySelectionState;
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    required bool initialized,
    Currency? from,
    Currency? to,
    double? conversionRate,
    DateTime? refreshDate,
    String? error
  }) = _AppState;

  factory AppState.fromJson(Map<String, Object?> json)
      => _$AppStateFromJson(json);
}
