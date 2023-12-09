// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversionModel _$ConversionModelFromJson(Map<String, dynamic> json) {
  return _ConversionModel.fromJson(json);
}

/// @nodoc
mixin _$ConversionModel {
  double get ammount => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  double get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversionModelCopyWith<ConversionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionModelCopyWith<$Res> {
  factory $ConversionModelCopyWith(
          ConversionModel value, $Res Function(ConversionModel) then) =
      _$ConversionModelCopyWithImpl<$Res, ConversionModel>;
  @useResult
  $Res call({double ammount, String from, String to, double result});
}

/// @nodoc
class _$ConversionModelCopyWithImpl<$Res, $Val extends ConversionModel>
    implements $ConversionModelCopyWith<$Res> {
  _$ConversionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ammount = null,
    Object? from = null,
    Object? to = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      ammount: null == ammount
          ? _value.ammount
          : ammount // ignore: cast_nullable_to_non_nullable
              as double,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversionModelImplCopyWith<$Res>
    implements $ConversionModelCopyWith<$Res> {
  factory _$$ConversionModelImplCopyWith(_$ConversionModelImpl value,
          $Res Function(_$ConversionModelImpl) then) =
      __$$ConversionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double ammount, String from, String to, double result});
}

/// @nodoc
class __$$ConversionModelImplCopyWithImpl<$Res>
    extends _$ConversionModelCopyWithImpl<$Res, _$ConversionModelImpl>
    implements _$$ConversionModelImplCopyWith<$Res> {
  __$$ConversionModelImplCopyWithImpl(
      _$ConversionModelImpl _value, $Res Function(_$ConversionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ammount = null,
    Object? from = null,
    Object? to = null,
    Object? result = null,
  }) {
    return _then(_$ConversionModelImpl(
      ammount: null == ammount
          ? _value.ammount
          : ammount // ignore: cast_nullable_to_non_nullable
              as double,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversionModelImpl implements _ConversionModel {
  const _$ConversionModelImpl(
      {required this.ammount,
      required this.from,
      required this.to,
      required this.result});

  factory _$ConversionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversionModelImplFromJson(json);

  @override
  final double ammount;
  @override
  final String from;
  @override
  final String to;
  @override
  final double result;

  @override
  String toString() {
    return 'ConversionModel(ammount: $ammount, from: $from, to: $to, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionModelImpl &&
            (identical(other.ammount, ammount) || other.ammount == ammount) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ammount, from, to, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionModelImplCopyWith<_$ConversionModelImpl> get copyWith =>
      __$$ConversionModelImplCopyWithImpl<_$ConversionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversionModelImplToJson(
      this,
    );
  }
}

abstract class _ConversionModel implements ConversionModel {
  const factory _ConversionModel(
      {required final double ammount,
      required final String from,
      required final String to,
      required final double result}) = _$ConversionModelImpl;

  factory _ConversionModel.fromJson(Map<String, dynamic> json) =
      _$ConversionModelImpl.fromJson;

  @override
  double get ammount;
  @override
  String get from;
  @override
  String get to;
  @override
  double get result;
  @override
  @JsonKey(ignore: true)
  _$$ConversionModelImplCopyWith<_$ConversionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
