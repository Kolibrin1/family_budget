// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) {
  return _IncomeModel.fromJson(json);
}

/// @nodoc
mixin _$IncomeModel {
  int? get id => throw _privateConstructorUsedError;
  double? get totalCount => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  /// Serializes this IncomeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncomeModelCopyWith<IncomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeModelCopyWith<$Res> {
  factory $IncomeModelCopyWith(
          IncomeModel value, $Res Function(IncomeModel) then) =
      _$IncomeModelCopyWithImpl<$Res, IncomeModel>;
  @useResult
  $Res call(
      {int? id,
      double? totalCount,
      String? title,
      DateTime? date,
      int? userId});
}

/// @nodoc
class _$IncomeModelCopyWithImpl<$Res, $Val extends IncomeModel>
    implements $IncomeModelCopyWith<$Res> {
  _$IncomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalCount = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as double?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeModelImplCopyWith<$Res>
    implements $IncomeModelCopyWith<$Res> {
  factory _$$IncomeModelImplCopyWith(
          _$IncomeModelImpl value, $Res Function(_$IncomeModelImpl) then) =
      __$$IncomeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      double? totalCount,
      String? title,
      DateTime? date,
      int? userId});
}

/// @nodoc
class __$$IncomeModelImplCopyWithImpl<$Res>
    extends _$IncomeModelCopyWithImpl<$Res, _$IncomeModelImpl>
    implements _$$IncomeModelImplCopyWith<$Res> {
  __$$IncomeModelImplCopyWithImpl(
      _$IncomeModelImpl _value, $Res Function(_$IncomeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalCount = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$IncomeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as double?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeModelImpl implements _IncomeModel {
  const _$IncomeModelImpl(
      {this.id, this.totalCount, this.title, this.date, this.userId});

  factory _$IncomeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeModelImplFromJson(json);

  @override
  final int? id;
  @override
  final double? totalCount;
  @override
  final String? title;
  @override
  final DateTime? date;
  @override
  final int? userId;

  @override
  String toString() {
    return 'IncomeModel(id: $id, totalCount: $totalCount, title: $title, date: $date, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, totalCount, title, date, userId);

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeModelImplCopyWith<_$IncomeModelImpl> get copyWith =>
      __$$IncomeModelImplCopyWithImpl<_$IncomeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeModelImplToJson(
      this,
    );
  }
}

abstract class _IncomeModel implements IncomeModel {
  const factory _IncomeModel(
      {final int? id,
      final double? totalCount,
      final String? title,
      final DateTime? date,
      final int? userId}) = _$IncomeModelImpl;

  factory _IncomeModel.fromJson(Map<String, dynamic> json) =
      _$IncomeModelImpl.fromJson;

  @override
  int? get id;
  @override
  double? get totalCount;
  @override
  String? get title;
  @override
  DateTime? get date;
  @override
  int? get userId;

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomeModelImplCopyWith<_$IncomeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
