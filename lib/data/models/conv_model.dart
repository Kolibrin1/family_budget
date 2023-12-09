import 'package:family_budget/data/models/conversion_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conv_model.freezed.dart';

part 'conv_model.g.dart';

@Freezed()
class ConvModel with _$ConvModel {
  const factory ConvModel({
    required bool success,
    required double result,
  }) = _ConvModel;

  factory ConvModel.fromJson(Map<String, Object?> json) =>
      _$ConvModelFromJson(json);
}
