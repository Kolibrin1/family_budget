// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagram_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiagramEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int type) selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int type)? selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int type)? selectTypeView,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SelectTypeView value)? selectTypeView,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramEventCopyWith<$Res> {
  factory $DiagramEventCopyWith(
          DiagramEvent value, $Res Function(DiagramEvent) then) =
      _$DiagramEventCopyWithImpl<$Res, DiagramEvent>;
}

/// @nodoc
class _$DiagramEventCopyWithImpl<$Res, $Val extends DiagramEvent>
    implements $DiagramEventCopyWith<$Res> {
  _$DiagramEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialEventImplCopyWith<$Res> {
  factory _$$InitialEventImplCopyWith(
          _$InitialEventImpl value, $Res Function(_$InitialEventImpl) then) =
      __$$InitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialEventImplCopyWithImpl<$Res>
    extends _$DiagramEventCopyWithImpl<$Res, _$InitialEventImpl>
    implements _$$InitialEventImplCopyWith<$Res> {
  __$$InitialEventImplCopyWithImpl(
      _$InitialEventImpl _value, $Res Function(_$InitialEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialEventImpl implements _InitialEvent {
  const _$InitialEventImpl();

  @override
  String toString() {
    return 'DiagramEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int type) selectTypeView,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int type)? selectTypeView,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int type)? selectTypeView,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SelectTypeView value)? selectTypeView,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialEvent implements DiagramEvent {
  const factory _InitialEvent() = _$InitialEventImpl;
}

/// @nodoc
abstract class _$$SelectTypeViewImplCopyWith<$Res> {
  factory _$$SelectTypeViewImplCopyWith(_$SelectTypeViewImpl value,
          $Res Function(_$SelectTypeViewImpl) then) =
      __$$SelectTypeViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int type});
}

/// @nodoc
class __$$SelectTypeViewImplCopyWithImpl<$Res>
    extends _$DiagramEventCopyWithImpl<$Res, _$SelectTypeViewImpl>
    implements _$$SelectTypeViewImplCopyWith<$Res> {
  __$$SelectTypeViewImplCopyWithImpl(
      _$SelectTypeViewImpl _value, $Res Function(_$SelectTypeViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$SelectTypeViewImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectTypeViewImpl implements _SelectTypeView {
  const _$SelectTypeViewImpl({required this.type});

  @override
  final int type;

  @override
  String toString() {
    return 'DiagramEvent.selectTypeView(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTypeViewImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTypeViewImplCopyWith<_$SelectTypeViewImpl> get copyWith =>
      __$$SelectTypeViewImplCopyWithImpl<_$SelectTypeViewImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int type) selectTypeView,
  }) {
    return selectTypeView(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int type)? selectTypeView,
  }) {
    return selectTypeView?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int type)? selectTypeView,
    required TResult orElse(),
  }) {
    if (selectTypeView != null) {
      return selectTypeView(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) {
    return selectTypeView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) {
    return selectTypeView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_SelectTypeView value)? selectTypeView,
    required TResult orElse(),
  }) {
    if (selectTypeView != null) {
      return selectTypeView(this);
    }
    return orElse();
  }
}

abstract class _SelectTypeView implements DiagramEvent {
  const factory _SelectTypeView({required final int type}) =
      _$SelectTypeViewImpl;

  int get type;
  @JsonKey(ignore: true)
  _$$SelectTypeViewImplCopyWith<_$SelectTypeViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramStateCopyWith<$Res> {
  factory $DiagramStateCopyWith(
          DiagramState value, $Res Function(DiagramState) then) =
      _$DiagramStateCopyWithImpl<$Res, DiagramState>;
}

/// @nodoc
class _$DiagramStateCopyWithImpl<$Res, $Val extends DiagramState>
    implements $DiagramStateCopyWith<$Res> {
  _$DiagramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currency, List<ExpenseModel> expensesList, int type});
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$DiagramStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? expensesList = null,
    Object? type = null,
  }) {
    return _then(_$InitialStateImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      expensesList: null == expensesList
          ? _value._expensesList
          : expensesList // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialStateImpl implements _InitialState {
  const _$InitialStateImpl(
      {required this.currency,
      required final List<ExpenseModel> expensesList,
      required this.type})
      : _expensesList = expensesList;

  @override
  final String currency;
  final List<ExpenseModel> _expensesList;
  @override
  List<ExpenseModel> get expensesList {
    if (_expensesList is EqualUnmodifiableListView) return _expensesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expensesList);
  }

  @override
  final int type;

  @override
  String toString() {
    return 'DiagramState.initial(currency: $currency, expensesList: $expensesList, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialStateImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._expensesList, _expensesList) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency,
      const DeepCollectionEquality().hash(_expensesList), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      __$$InitialStateImplCopyWithImpl<_$InitialStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return initial(currency, expensesList, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return initial?.call(currency, expensesList, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(currency, expensesList, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements DiagramState {
  const factory _InitialState(
      {required final String currency,
      required final List<ExpenseModel> expensesList,
      required final int type}) = _$InitialStateImpl;

  String get currency;
  List<ExpenseModel> get expensesList;
  int get type;
  @JsonKey(ignore: true)
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
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
    extends _$DiagramStateCopyWithImpl<$Res, _$LoadingStateImpl>
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
    return 'DiagramState.loading()';
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
    required TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
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
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
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

abstract class _LoadingState implements DiagramState {
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
    extends _$DiagramStateCopyWithImpl<$Res, _$InfoStateImpl>
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
    return 'DiagramState.info(message: $message, pageState: $pageState)';
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
    required TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return info(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return info?.call(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency, List<ExpenseModel> expensesList, int type)?
        initial,
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
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
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

abstract class _InfoState implements DiagramState {
  const factory _InfoState(
      {required final String message,
      required final PageState pageState}) = _$InfoStateImpl;

  String get message;
  PageState get pageState;
  @JsonKey(ignore: true)
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
