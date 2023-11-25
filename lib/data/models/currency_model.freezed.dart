// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return _CurrencyModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyModel {
  bool get valid => throw _privateConstructorUsedError;
  Map<String, String> get currencies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyModelCopyWith<CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyModelCopyWith<$Res> {
  factory $CurrencyModelCopyWith(
          CurrencyModel value, $Res Function(CurrencyModel) then) =
      _$CurrencyModelCopyWithImpl<$Res, CurrencyModel>;
  @useResult
  $Res call({bool valid, Map<String, String> currencies});
}

/// @nodoc
class _$CurrencyModelCopyWithImpl<$Res, $Val extends CurrencyModel>
    implements $CurrencyModelCopyWith<$Res> {
  _$CurrencyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? currencies = null,
  }) {
    return _then(_value.copyWith(
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyModelImplCopyWith<$Res>
    implements $CurrencyModelCopyWith<$Res> {
  factory _$$CurrencyModelImplCopyWith(
          _$CurrencyModelImpl value, $Res Function(_$CurrencyModelImpl) then) =
      __$$CurrencyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool valid, Map<String, String> currencies});
}

/// @nodoc
class __$$CurrencyModelImplCopyWithImpl<$Res>
    extends _$CurrencyModelCopyWithImpl<$Res, _$CurrencyModelImpl>
    implements _$$CurrencyModelImplCopyWith<$Res> {
  __$$CurrencyModelImplCopyWithImpl(
      _$CurrencyModelImpl _value, $Res Function(_$CurrencyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? currencies = null,
  }) {
    return _then(_$CurrencyModelImpl(
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyModelImpl implements _CurrencyModel {
  const _$CurrencyModelImpl(
      {required this.valid, required final Map<String, String> currencies})
      : _currencies = currencies;

  factory _$CurrencyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyModelImplFromJson(json);

  @override
  final bool valid;
  final Map<String, String> _currencies;
  @override
  Map<String, String> get currencies {
    if (_currencies is EqualUnmodifiableMapView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_currencies);
  }

  @override
  String toString() {
    return 'CurrencyModel(valid: $valid, currencies: $currencies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyModelImpl &&
            (identical(other.valid, valid) || other.valid == valid) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, valid, const DeepCollectionEquality().hash(_currencies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyModelImplCopyWith<_$CurrencyModelImpl> get copyWith =>
      __$$CurrencyModelImplCopyWithImpl<_$CurrencyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyModelImplToJson(
      this,
    );
  }
}

abstract class _CurrencyModel implements CurrencyModel {
  const factory _CurrencyModel(
      {required final bool valid,
      required final Map<String, String> currencies}) = _$CurrencyModelImpl;

  factory _CurrencyModel.fromJson(Map<String, dynamic> json) =
      _$CurrencyModelImpl.fromJson;

  @override
  bool get valid;
  @override
  Map<String, String> get currencies;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyModelImplCopyWith<_$CurrencyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
