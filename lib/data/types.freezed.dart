// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String get id => throw _privateConstructorUsedError;
  String get flagCode => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  List<String> get countryIds => throw _privateConstructorUsedError;
  List<double> get bills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {String id,
      String flagCode,
      String symbol,
      List<String> countryIds,
      List<double> bills});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? flagCode = null,
    Object? symbol = null,
    Object? countryIds = null,
    Object? bills = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      flagCode: null == flagCode
          ? _value.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      countryIds: null == countryIds
          ? _value.countryIds
          : countryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$$_CurrencyCopyWith(
          _$_Currency value, $Res Function(_$_Currency) then) =
      __$$_CurrencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String flagCode,
      String symbol,
      List<String> countryIds,
      List<double> bills});
}

/// @nodoc
class __$$_CurrencyCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$_Currency>
    implements _$$_CurrencyCopyWith<$Res> {
  __$$_CurrencyCopyWithImpl(
      _$_Currency _value, $Res Function(_$_Currency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? flagCode = null,
    Object? symbol = null,
    Object? countryIds = null,
    Object? bills = null,
  }) {
    return _then(_$_Currency(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      flagCode: null == flagCode
          ? _value.flagCode
          : flagCode // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      countryIds: null == countryIds
          ? _value._countryIds
          : countryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Currency implements _Currency {
  const _$_Currency(
      {required this.id,
      required this.flagCode,
      required this.symbol,
      required final List<String> countryIds,
      required final List<double> bills})
      : _countryIds = countryIds,
        _bills = bills;

  factory _$_Currency.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyFromJson(json);

  @override
  final String id;
  @override
  final String flagCode;
  @override
  final String symbol;
  final List<String> _countryIds;
  @override
  List<String> get countryIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryIds);
  }

  final List<double> _bills;
  @override
  List<double> get bills {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  @override
  String toString() {
    return 'Currency(id: $id, flagCode: $flagCode, symbol: $symbol, countryIds: $countryIds, bills: $bills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Currency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.flagCode, flagCode) ||
                other.flagCode == flagCode) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            const DeepCollectionEquality()
                .equals(other._countryIds, _countryIds) &&
            const DeepCollectionEquality().equals(other._bills, _bills));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      flagCode,
      symbol,
      const DeepCollectionEquality().hash(_countryIds),
      const DeepCollectionEquality().hash(_bills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      __$$_CurrencyCopyWithImpl<_$_Currency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {required final String id,
      required final String flagCode,
      required final String symbol,
      required final List<String> countryIds,
      required final List<double> bills}) = _$_Currency;

  factory _Currency.fromJson(Map<String, dynamic> json) = _$_Currency.fromJson;

  @override
  String get id;
  @override
  String get flagCode;
  @override
  String get symbol;
  @override
  List<String> get countryIds;
  @override
  List<double> get bills;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrencySelectionState {
  bool get initialized => throw _privateConstructorUsedError;
  bool? get showClear => throw _privateConstructorUsedError;
  List<Currency>? get currencies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencySelectionStateCopyWith<CurrencySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencySelectionStateCopyWith<$Res> {
  factory $CurrencySelectionStateCopyWith(CurrencySelectionState value,
          $Res Function(CurrencySelectionState) then) =
      _$CurrencySelectionStateCopyWithImpl<$Res, CurrencySelectionState>;
  @useResult
  $Res call({bool initialized, bool? showClear, List<Currency>? currencies});
}

/// @nodoc
class _$CurrencySelectionStateCopyWithImpl<$Res,
        $Val extends CurrencySelectionState>
    implements $CurrencySelectionStateCopyWith<$Res> {
  _$CurrencySelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? showClear = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_value.copyWith(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      showClear: freezed == showClear
          ? _value.showClear
          : showClear // ignore: cast_nullable_to_non_nullable
              as bool?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencySelectionStateCopyWith<$Res>
    implements $CurrencySelectionStateCopyWith<$Res> {
  factory _$$_CurrencySelectionStateCopyWith(_$_CurrencySelectionState value,
          $Res Function(_$_CurrencySelectionState) then) =
      __$$_CurrencySelectionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool initialized, bool? showClear, List<Currency>? currencies});
}

/// @nodoc
class __$$_CurrencySelectionStateCopyWithImpl<$Res>
    extends _$CurrencySelectionStateCopyWithImpl<$Res,
        _$_CurrencySelectionState>
    implements _$$_CurrencySelectionStateCopyWith<$Res> {
  __$$_CurrencySelectionStateCopyWithImpl(_$_CurrencySelectionState _value,
      $Res Function(_$_CurrencySelectionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? showClear = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_$_CurrencySelectionState(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      showClear: freezed == showClear
          ? _value.showClear
          : showClear // ignore: cast_nullable_to_non_nullable
              as bool?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>?,
    ));
  }
}

/// @nodoc

class _$_CurrencySelectionState implements _CurrencySelectionState {
  const _$_CurrencySelectionState(
      {required this.initialized,
      this.showClear,
      final List<Currency>? currencies})
      : _currencies = currencies;

  @override
  final bool initialized;
  @override
  final bool? showClear;
  final List<Currency>? _currencies;
  @override
  List<Currency>? get currencies {
    final value = _currencies;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurrencySelectionState(initialized: $initialized, showClear: $showClear, currencies: $currencies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencySelectionState &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.showClear, showClear) ||
                other.showClear == showClear) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialized, showClear,
      const DeepCollectionEquality().hash(_currencies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencySelectionStateCopyWith<_$_CurrencySelectionState> get copyWith =>
      __$$_CurrencySelectionStateCopyWithImpl<_$_CurrencySelectionState>(
          this, _$identity);
}

abstract class _CurrencySelectionState implements CurrencySelectionState {
  const factory _CurrencySelectionState(
      {required final bool initialized,
      final bool? showClear,
      final List<Currency>? currencies}) = _$_CurrencySelectionState;

  @override
  bool get initialized;
  @override
  bool? get showClear;
  @override
  List<Currency>? get currencies;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencySelectionStateCopyWith<_$_CurrencySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  bool get initialized => throw _privateConstructorUsedError;
  Currency? get from => throw _privateConstructorUsedError;
  Currency? get to => throw _privateConstructorUsedError;
  double? get conversionRate => throw _privateConstructorUsedError;
  DateTime? get refreshDate => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {bool initialized,
      Currency? from,
      Currency? to,
      double? conversionRate,
      DateTime? refreshDate,
      String? error});

  $CurrencyCopyWith<$Res>? get from;
  $CurrencyCopyWith<$Res>? get to;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? from = freezed,
    Object? to = freezed,
    Object? conversionRate = freezed,
    Object? refreshDate = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency?,
      conversionRate: freezed == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      refreshDate: freezed == refreshDate
          ? _value.refreshDate
          : refreshDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool initialized,
      Currency? from,
      Currency? to,
      double? conversionRate,
      DateTime? refreshDate,
      String? error});

  @override
  $CurrencyCopyWith<$Res>? get from;
  @override
  $CurrencyCopyWith<$Res>? get to;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? from = freezed,
    Object? to = freezed,
    Object? conversionRate = freezed,
    Object? refreshDate = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_AppState(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency?,
      conversionRate: freezed == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      refreshDate: freezed == refreshDate
          ? _value.refreshDate
          : refreshDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  const _$_AppState(
      {required this.initialized,
      this.from,
      this.to,
      this.conversionRate,
      this.refreshDate,
      this.error});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$$_AppStateFromJson(json);

  @override
  final bool initialized;
  @override
  final Currency? from;
  @override
  final Currency? to;
  @override
  final double? conversionRate;
  @override
  final DateTime? refreshDate;
  @override
  final String? error;

  @override
  String toString() {
    return 'AppState(initialized: $initialized, from: $from, to: $to, conversionRate: $conversionRate, refreshDate: $refreshDate, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate) &&
            (identical(other.refreshDate, refreshDate) ||
                other.refreshDate == refreshDate) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, initialized, from, to, conversionRate, refreshDate, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppStateToJson(
      this,
    );
  }
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final bool initialized,
      final Currency? from,
      final Currency? to,
      final double? conversionRate,
      final DateTime? refreshDate,
      final String? error}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  bool get initialized;
  @override
  Currency? get from;
  @override
  Currency? get to;
  @override
  double? get conversionRate;
  @override
  DateTime? get refreshDate;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
