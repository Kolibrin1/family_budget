// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RateModelImpl _$$RateModelImplFromJson(Map<String, dynamic> json) =>
    _$RateModelImpl(
      valid: json['valid'] as bool,
      updated: (json['updated'] as num).toInt(),
      base: json['base'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$RateModelImplToJson(_$RateModelImpl instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'updated': instance.updated,
      'base': instance.base,
      'rates': instance.rates,
    };
