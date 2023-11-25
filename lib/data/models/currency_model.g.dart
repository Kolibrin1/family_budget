// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyModelImpl _$$CurrencyModelImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyModelImpl(
      valid: json['valid'] as bool,
      currencies: Map<String, String>.from(json['currencies'] as Map),
    );

Map<String, dynamic> _$$CurrencyModelImplToJson(_$CurrencyModelImpl instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'currencies': instance.currencies,
    };
