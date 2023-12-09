// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversionModelImpl _$$ConversionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversionModelImpl(
      ammount: (json['ammount'] as num).toDouble(),
      from: json['from'] as String,
      to: json['to'] as String,
      result: (json['result'] as num).toDouble(),
    );

Map<String, dynamic> _$$ConversionModelImplToJson(
        _$ConversionModelImpl instance) =>
    <String, dynamic>{
      'ammount': instance.ammount,
      'from': instance.from,
      'to': instance.to,
      'result': instance.result,
    };
