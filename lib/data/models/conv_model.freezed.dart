// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conv_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConvModel _$ConvModelFromJson(Map<String, dynamic> json) {
  return _ConvModel.fromJson(json);
}

/// @nodoc
mixin _$ConvModel {
  bool get success => throw _privateConstructorUsedError;
  double get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConvModelCopyWith<ConvModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConvModelCopyWith<$Res> {
  factory $ConvModelCopyWith(ConvModel value, $Res Function(ConvModel) then) =
      _$ConvModelCopyWithImpl<$Res, ConvModel>;
  @useResult
  $Res call({bool success, double result});
}

/// @nodoc
class _$ConvModelCopyWithImpl<$Res, $Val extends ConvModel>
    implements $ConvModelCopyWith<$Res> {
  _$ConvModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConvModelImplCopyWith<$Res>
    implements $ConvModelCopyWith<$Res> {
  factory _$$ConvModelImplCopyWith(
          _$ConvModelImpl value, $Res Function(_$ConvModelImpl) then) =
      __$$ConvModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, double result});
}

/// @nodoc
class __$$ConvModelImplCopyWithImpl<$Res>
    extends _$ConvModelCopyWithImpl<$Res, _$ConvModelImpl>
    implements _$$ConvModelImplCopyWith<$Res> {
  __$$ConvModelImplCopyWithImpl(
      _$ConvModelImpl _value, $Res Function(_$ConvModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_$ConvModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConvModelImpl implements _ConvModel {
  const _$ConvModelImpl({required this.success, required this.result});

  factory _$ConvModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConvModelImplFromJson(json);

  @override
  final bool success;
  @override
  final double result;

  @override
  String toString() {
    return 'ConvModel(success: $success, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvModelImplCopyWith<_$ConvModelImpl> get copyWith =>
      __$$ConvModelImplCopyWithImpl<_$ConvModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConvModelImplToJson(
      this,
    );
  }
}

abstract class _ConvModel implements ConvModel {
  const factory _ConvModel(
      {required final bool success,
      required final double result}) = _$ConvModelImpl;

  factory _ConvModel.fromJson(Map<String, dynamic> json) =
      _$ConvModelImpl.fromJson;

  @override
  bool get success;
  @override
  double get result;
  @override
  @JsonKey(ignore: true)
  _$$ConvModelImplCopyWith<_$ConvModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
