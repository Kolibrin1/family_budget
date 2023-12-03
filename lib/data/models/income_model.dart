import 'package:freezed_annotation/freezed_annotation.dart';


part 'income_model.freezed.dart';
part 'income_model.g.dart';

@Freezed()
class IncomeModel with _$IncomeModel {
  const factory IncomeModel({

    int? id,
    double? totalCount,
    String? title,
    DateTime? date,
    int? userId,

  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, Object?> json) => _$IncomeModelFromJson(json);
}
