// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomeModelImpl _$$IncomeModelImplFromJson(Map<String, dynamic> json) =>
    _$IncomeModelImpl(
      id: (json['id'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toDouble(),
      title: json['title'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$IncomeModelImplToJson(_$IncomeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalCount': instance.totalCount,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'userId': instance.userId,
    };
