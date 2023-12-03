// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  AuthType get authType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthType authType) initial,
    required TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)
        detail,
    required TResult Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)
        auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthType authType)? initial,
    TResult? Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult? Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)?
        auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthType authType)? initial,
    TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult Function(String login, String pass, double balance, String currency,
            AuthType authType, dynamic Function() onAuthCompleted)?
        auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_DetailEvent value) detail,
    required TResult Function(_AuthEvent value) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_DetailEvent value)? detail,
    TResult? Function(_AuthEvent value)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_DetailEvent value)? detail,
    TResult Function(_AuthEvent value)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthEventCopyWith<AuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
  @useResult
  $Res call({AuthType authType});
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authType = null,
  }) {
    return _then(_value.copyWith(
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as AuthType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialEventImplCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$$InitialEventImplCopyWith(
          _$InitialEventImpl value, $Res Function(_$InitialEventImpl) then) =
      __$$InitialEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthType authType});
}

/// @nodoc
class __$$InitialEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InitialEventImpl>
    implements _$$InitialEventImplCopyWith<$Res> {
  __$$InitialEventImplCopyWithImpl(
      _$InitialEventImpl _value, $Res Function(_$InitialEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authType = null,
  }) {
    return _then(_$InitialEventImpl(
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as AuthType,
    ));
  }
}

/// @nodoc

class _$InitialEventImpl implements _InitialEvent {
  const _$InitialEventImpl({required this.authType});

  @override
  final AuthType authType;

  @override
  String toString() {
    return 'AuthEvent.initial(authType: $authType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialEventImpl &&
            (identical(other.authType, authType) ||
                other.authType == authType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialEventImplCopyWith<_$InitialEventImpl> get copyWith =>
      __$$InitialEventImplCopyWithImpl<_$InitialEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthType authType) initial,
    required TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)
        detail,
    required TResult Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)
        auth,
  }) {
    return initial(authType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthType authType)? initial,
    TResult? Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult? Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)?
        auth,
  }) {
    return initial?.call(authType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthType authType)? initial,
    TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult Function(String login, String pass, double balance, String currency,
            AuthType authType, dynamic Function() onAuthCompleted)?
        auth,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(authType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_DetailEvent value) detail,
    required TResult Function(_AuthEvent value) auth,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_DetailEvent value)? detail,
    TResult? Function(_AuthEvent value)? auth,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_DetailEvent value)? detail,
    TResult Function(_AuthEvent value)? auth,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialEvent implements AuthEvent {
  const factory _InitialEvent({required final AuthType authType}) =
      _$InitialEventImpl;

  @override
  AuthType get authType;
  @override
  @JsonKey(ignore: true)
  _$$InitialEventImplCopyWith<_$InitialEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailEventImplCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$$DetailEventImplCopyWith(
          _$DetailEventImpl value, $Res Function(_$DetailEventImpl) then) =
      __$$DetailEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String login,
      String pass,
      AuthType authType,
      dynamic Function() onAuthCompleted});
}

/// @nodoc
class __$$DetailEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$DetailEventImpl>
    implements _$$DetailEventImplCopyWith<$Res> {
  __$$DetailEventImplCopyWithImpl(
      _$DetailEventImpl _value, $Res Function(_$DetailEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? pass = null,
    Object? authType = null,
    Object? onAuthCompleted = null,
  }) {
    return _then(_$DetailEventImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String,
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as AuthType,
      onAuthCompleted: null == onAuthCompleted
          ? _value.onAuthCompleted
          : onAuthCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
    ));
  }
}

/// @nodoc

class _$DetailEventImpl implements _DetailEvent {
  const _$DetailEventImpl(
      {required this.login,
      required this.pass,
      required this.authType,
      required this.onAuthCompleted});

  @override
  final String login;
  @override
  final String pass;
  @override
  final AuthType authType;
  @override
  final dynamic Function() onAuthCompleted;

  @override
  String toString() {
    return 'AuthEvent.detail(login: $login, pass: $pass, authType: $authType, onAuthCompleted: $onAuthCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailEventImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            (identical(other.authType, authType) ||
                other.authType == authType) &&
            (identical(other.onAuthCompleted, onAuthCompleted) ||
                other.onAuthCompleted == onAuthCompleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, login, pass, authType, onAuthCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailEventImplCopyWith<_$DetailEventImpl> get copyWith =>
      __$$DetailEventImplCopyWithImpl<_$DetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthType authType) initial,
    required TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)
        detail,
    required TResult Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)
        auth,
  }) {
    return detail(login, pass, authType, onAuthCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthType authType)? initial,
    TResult? Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult? Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)?
        auth,
  }) {
    return detail?.call(login, pass, authType, onAuthCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthType authType)? initial,
    TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult Function(String login, String pass, double balance, String currency,
            AuthType authType, dynamic Function() onAuthCompleted)?
        auth,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(login, pass, authType, onAuthCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_DetailEvent value) detail,
    required TResult Function(_AuthEvent value) auth,
  }) {
    return detail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_DetailEvent value)? detail,
    TResult? Function(_AuthEvent value)? auth,
  }) {
    return detail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_DetailEvent value)? detail,
    TResult Function(_AuthEvent value)? auth,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(this);
    }
    return orElse();
  }
}

abstract class _DetailEvent implements AuthEvent {
  const factory _DetailEvent(
      {required final String login,
      required final String pass,
      required final AuthType authType,
      required final dynamic Function() onAuthCompleted}) = _$DetailEventImpl;

  String get login;
  String get pass;
  @override
  AuthType get authType;
  dynamic Function() get onAuthCompleted;
  @override
  @JsonKey(ignore: true)
  _$$DetailEventImplCopyWith<_$DetailEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventImplCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$$AuthEventImplCopyWith(
          _$AuthEventImpl value, $Res Function(_$AuthEventImpl) then) =
      __$$AuthEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String login,
      String pass,
      double balance,
      String currency,
      AuthType authType,
      dynamic Function() onAuthCompleted});
}

/// @nodoc
class __$$AuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventImpl>
    implements _$$AuthEventImplCopyWith<$Res> {
  __$$AuthEventImplCopyWithImpl(
      _$AuthEventImpl _value, $Res Function(_$AuthEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? pass = null,
    Object? balance = null,
    Object? currency = null,
    Object? authType = null,
    Object? onAuthCompleted = null,
  }) {
    return _then(_$AuthEventImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      authType: null == authType
          ? _value.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as AuthType,
      onAuthCompleted: null == onAuthCompleted
          ? _value.onAuthCompleted
          : onAuthCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic Function(),
    ));
  }
}

/// @nodoc

class _$AuthEventImpl implements _AuthEvent {
  const _$AuthEventImpl(
      {required this.login,
      required this.pass,
      required this.balance,
      required this.currency,
      required this.authType,
      required this.onAuthCompleted});

  @override
  final String login;
  @override
  final String pass;
  @override
  final double balance;
  @override
  final String currency;
  @override
  final AuthType authType;
  @override
  final dynamic Function() onAuthCompleted;

  @override
  String toString() {
    return 'AuthEvent.auth(login: $login, pass: $pass, balance: $balance, currency: $currency, authType: $authType, onAuthCompleted: $onAuthCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.authType, authType) ||
                other.authType == authType) &&
            (identical(other.onAuthCompleted, onAuthCompleted) ||
                other.onAuthCompleted == onAuthCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, login, pass, balance, currency, authType, onAuthCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventImplCopyWith<_$AuthEventImpl> get copyWith =>
      __$$AuthEventImplCopyWithImpl<_$AuthEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthType authType) initial,
    required TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)
        detail,
    required TResult Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)
        auth,
  }) {
    return auth(login, pass, balance, currency, authType, onAuthCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthType authType)? initial,
    TResult? Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult? Function(
            String login,
            String pass,
            double balance,
            String currency,
            AuthType authType,
            dynamic Function() onAuthCompleted)?
        auth,
  }) {
    return auth?.call(
        login, pass, balance, currency, authType, onAuthCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthType authType)? initial,
    TResult Function(String login, String pass, AuthType authType,
            dynamic Function() onAuthCompleted)?
        detail,
    TResult Function(String login, String pass, double balance, String currency,
            AuthType authType, dynamic Function() onAuthCompleted)?
        auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(login, pass, balance, currency, authType, onAuthCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_DetailEvent value) detail,
    required TResult Function(_AuthEvent value) auth,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_DetailEvent value)? detail,
    TResult? Function(_AuthEvent value)? auth,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_DetailEvent value)? detail,
    TResult Function(_AuthEvent value)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _AuthEvent implements AuthEvent {
  const factory _AuthEvent(
      {required final String login,
      required final String pass,
      required final double balance,
      required final String currency,
      required final AuthType authType,
      required final dynamic Function() onAuthCompleted}) = _$AuthEventImpl;

  String get login;
  String get pass;
  double get balance;
  String get currency;
  @override
  AuthType get authType;
  dynamic Function() get onAuthCompleted;
  @override
  @JsonKey(ignore: true)
  _$$AuthEventImplCopyWith<_$AuthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? login, String? pass, bool? isError) auth,
    required TResult Function(String login, String pass) detail,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? login, String? pass, bool? isError)? auth,
    TResult? Function(String login, String pass)? detail,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? login, String? pass, bool? isError)? auth,
    TResult Function(String login, String pass)? detail,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneState value) auth,
    required TResult Function(_DetailState value) detail,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? auth,
    TResult? Function(_DetailState value)? detail,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? auth,
    TResult Function(_DetailState value)? detail,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PhoneStateImplCopyWith<$Res> {
  factory _$$PhoneStateImplCopyWith(
          _$PhoneStateImpl value, $Res Function(_$PhoneStateImpl) then) =
      __$$PhoneStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? login, String? pass, bool? isError});
}

/// @nodoc
class __$$PhoneStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PhoneStateImpl>
    implements _$$PhoneStateImplCopyWith<$Res> {
  __$$PhoneStateImplCopyWithImpl(
      _$PhoneStateImpl _value, $Res Function(_$PhoneStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = freezed,
    Object? pass = freezed,
    Object? isError = freezed,
  }) {
    return _then(_$PhoneStateImpl(
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      pass: freezed == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String?,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$PhoneStateImpl implements _PhoneState {
  const _$PhoneStateImpl({this.login, this.pass, this.isError});

  @override
  final String? login;
  @override
  final String? pass;
  @override
  final bool? isError;

  @override
  String toString() {
    return 'AuthState.auth(login: $login, pass: $pass, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneStateImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, pass, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneStateImplCopyWith<_$PhoneStateImpl> get copyWith =>
      __$$PhoneStateImplCopyWithImpl<_$PhoneStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? login, String? pass, bool? isError) auth,
    required TResult Function(String login, String pass) detail,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return auth(login, pass, isError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? login, String? pass, bool? isError)? auth,
    TResult? Function(String login, String pass)? detail,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return auth?.call(login, pass, isError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? login, String? pass, bool? isError)? auth,
    TResult Function(String login, String pass)? detail,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(login, pass, isError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneState value) auth,
    required TResult Function(_DetailState value) detail,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? auth,
    TResult? Function(_DetailState value)? detail,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? auth,
    TResult Function(_DetailState value)? detail,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _PhoneState implements AuthState {
  const factory _PhoneState(
      {final String? login,
      final String? pass,
      final bool? isError}) = _$PhoneStateImpl;

  String? get login;
  String? get pass;
  bool? get isError;
  @JsonKey(ignore: true)
  _$$PhoneStateImplCopyWith<_$PhoneStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailStateImplCopyWith<$Res> {
  factory _$$DetailStateImplCopyWith(
          _$DetailStateImpl value, $Res Function(_$DetailStateImpl) then) =
      __$$DetailStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String login, String pass});
}

/// @nodoc
class __$$DetailStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$DetailStateImpl>
    implements _$$DetailStateImplCopyWith<$Res> {
  __$$DetailStateImplCopyWithImpl(
      _$DetailStateImpl _value, $Res Function(_$DetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? pass = null,
  }) {
    return _then(_$DetailStateImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailStateImpl implements _DetailState {
  const _$DetailStateImpl({required this.login, required this.pass});

  @override
  final String login;
  @override
  final String pass;

  @override
  String toString() {
    return 'AuthState.detail(login: $login, pass: $pass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStateImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.pass, pass) || other.pass == pass));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, pass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      __$$DetailStateImplCopyWithImpl<_$DetailStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? login, String? pass, bool? isError) auth,
    required TResult Function(String login, String pass) detail,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return detail(login, pass);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? login, String? pass, bool? isError)? auth,
    TResult? Function(String login, String pass)? detail,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return detail?.call(login, pass);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? login, String? pass, bool? isError)? auth,
    TResult Function(String login, String pass)? detail,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(login, pass);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneState value) auth,
    required TResult Function(_DetailState value) detail,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return detail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? auth,
    TResult? Function(_DetailState value)? detail,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return detail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? auth,
    TResult Function(_DetailState value)? detail,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(this);
    }
    return orElse();
  }
}

abstract class _DetailState implements AuthState {
  const factory _DetailState(
      {required final String login,
      required final String pass}) = _$DetailStateImpl;

  String get login;
  String get pass;
  @JsonKey(ignore: true)
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? login, String? pass, bool? isError) auth,
    required TResult Function(String login, String pass) detail,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? login, String? pass, bool? isError)? auth,
    TResult? Function(String login, String pass)? detail,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? login, String? pass, bool? isError)? auth,
    TResult Function(String login, String pass)? detail,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneState value) auth,
    required TResult Function(_DetailState value) detail,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? auth,
    TResult? Function(_DetailState value)? detail,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? auth,
    TResult Function(_DetailState value)? detail,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements AuthState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$InfoStateImplCopyWith<$Res> {
  factory _$$InfoStateImplCopyWith(
          _$InfoStateImpl value, $Res Function(_$InfoStateImpl) then) =
      __$$InfoStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, PageState pageState});
}

/// @nodoc
class __$$InfoStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InfoStateImpl>
    implements _$$InfoStateImplCopyWith<$Res> {
  __$$InfoStateImplCopyWithImpl(
      _$InfoStateImpl _value, $Res Function(_$InfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? pageState = null,
  }) {
    return _then(_$InfoStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as PageState,
    ));
  }
}

/// @nodoc

class _$InfoStateImpl implements _InfoState {
  const _$InfoStateImpl({required this.message, required this.pageState});

  @override
  final String message;
  @override
  final PageState pageState;

  @override
  String toString() {
    return 'AuthState.info(message: $message, pageState: $pageState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, pageState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      __$$InfoStateImplCopyWithImpl<_$InfoStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? login, String? pass, bool? isError) auth,
    required TResult Function(String login, String pass) detail,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return info(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? login, String? pass, bool? isError)? auth,
    TResult? Function(String login, String pass)? detail,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return info?.call(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? login, String? pass, bool? isError)? auth,
    TResult Function(String login, String pass)? detail,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(message, pageState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneState value) auth,
    required TResult Function(_DetailState value) detail,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? auth,
    TResult? Function(_DetailState value)? detail,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? auth,
    TResult Function(_DetailState value)? detail,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(this);
    }
    return orElse();
  }
}

abstract class _InfoState implements AuthState {
  const factory _InfoState(
      {required final String message,
      required final PageState pageState}) = _$InfoStateImpl;

  String get message;
  PageState get pageState;
  @JsonKey(ignore: true)
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
