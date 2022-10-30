// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) => _$_Currency(
      id: json['id'] as String,
      flagCode: json['flagCode'] as String,
      symbol: json['symbol'] as String,
      countryIds: (json['countryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bills: (json['bills'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flagCode': instance.flagCode,
      'symbol': instance.symbol,
      'countryIds': instance.countryIds,
      'bills': instance.bills,
    };

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      initialized: json['initialized'] as bool,
      from: json['from'] == null
          ? null
          : Currency.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : Currency.fromJson(json['to'] as Map<String, dynamic>),
      conversionRate: (json['conversionRate'] as num?)?.toDouble(),
      refreshDate: json['refreshDate'] == null
          ? null
          : DateTime.parse(json['refreshDate'] as String),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'initialized': instance.initialized,
      'from': instance.from,
      'to': instance.to,
      'conversionRate': instance.conversionRate,
      'refreshDate': instance.refreshDate?.toIso8601String(),
      'error': instance.error,
    };
