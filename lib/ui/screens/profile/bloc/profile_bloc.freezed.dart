// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String title, double totalCount, DateTime date)
        addExpense,
    required TResult Function(String title, double totalCount, DateTime date)
        addIncome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult? Function(String title, double totalCount, DateTime date)?
        addIncome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult Function(String title, double totalCount, DateTime date)? addIncome,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_AddExpense value) addExpense,
    required TResult Function(AddIncome value) addIncome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_AddExpense value)? addExpense,
    TResult? Function(AddIncome value)? addIncome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_AddExpense value)? addExpense,
    TResult Function(AddIncome value)? addIncome,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

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
    extends _$ProfileEventCopyWithImpl<$Res, _$InitialEventImpl>
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
    return 'ProfileEvent.initial()';
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
    required TResult Function(String title, double totalCount, DateTime date)
        addExpense,
    required TResult Function(String title, double totalCount, DateTime date)
        addIncome,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult? Function(String title, double totalCount, DateTime date)?
        addIncome,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult Function(String title, double totalCount, DateTime date)? addIncome,
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
    required TResult Function(_AddExpense value) addExpense,
    required TResult Function(AddIncome value) addIncome,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_AddExpense value)? addExpense,
    TResult? Function(AddIncome value)? addIncome,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_AddExpense value)? addExpense,
    TResult Function(AddIncome value)? addIncome,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialEvent implements ProfileEvent {
  const factory _InitialEvent() = _$InitialEventImpl;
}

/// @nodoc
abstract class _$$AddExpenseImplCopyWith<$Res> {
  factory _$$AddExpenseImplCopyWith(
          _$AddExpenseImpl value, $Res Function(_$AddExpenseImpl) then) =
      __$$AddExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, double totalCount, DateTime date});
}

/// @nodoc
class __$$AddExpenseImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$AddExpenseImpl>
    implements _$$AddExpenseImplCopyWith<$Res> {
  __$$AddExpenseImplCopyWithImpl(
      _$AddExpenseImpl _value, $Res Function(_$AddExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalCount = null,
    Object? date = null,
  }) {
    return _then(_$AddExpenseImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddExpenseImpl implements _AddExpense {
  const _$AddExpenseImpl(
      {required this.title, required this.totalCount, required this.date});

  @override
  final String title;
  @override
  final double totalCount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ProfileEvent.addExpense(title: $title, totalCount: $totalCount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddExpenseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, totalCount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddExpenseImplCopyWith<_$AddExpenseImpl> get copyWith =>
      __$$AddExpenseImplCopyWithImpl<_$AddExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String title, double totalCount, DateTime date)
        addExpense,
    required TResult Function(String title, double totalCount, DateTime date)
        addIncome,
  }) {
    return addExpense(title, totalCount, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult? Function(String title, double totalCount, DateTime date)?
        addIncome,
  }) {
    return addExpense?.call(title, totalCount, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult Function(String title, double totalCount, DateTime date)? addIncome,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense(title, totalCount, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_AddExpense value) addExpense,
    required TResult Function(AddIncome value) addIncome,
  }) {
    return addExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_AddExpense value)? addExpense,
    TResult? Function(AddIncome value)? addIncome,
  }) {
    return addExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_AddExpense value)? addExpense,
    TResult Function(AddIncome value)? addIncome,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense(this);
    }
    return orElse();
  }
}

abstract class _AddExpense implements ProfileEvent {
  const factory _AddExpense(
      {required final String title,
      required final double totalCount,
      required final DateTime date}) = _$AddExpenseImpl;

  String get title;
  double get totalCount;
  DateTime get date;
  @JsonKey(ignore: true)
  _$$AddExpenseImplCopyWith<_$AddExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddIncomeImplCopyWith<$Res> {
  factory _$$AddIncomeImplCopyWith(
          _$AddIncomeImpl value, $Res Function(_$AddIncomeImpl) then) =
      __$$AddIncomeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, double totalCount, DateTime date});
}

/// @nodoc
class __$$AddIncomeImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$AddIncomeImpl>
    implements _$$AddIncomeImplCopyWith<$Res> {
  __$$AddIncomeImplCopyWithImpl(
      _$AddIncomeImpl _value, $Res Function(_$AddIncomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalCount = null,
    Object? date = null,
  }) {
    return _then(_$AddIncomeImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddIncomeImpl implements AddIncome {
  const _$AddIncomeImpl(
      {required this.title, required this.totalCount, required this.date});

  @override
  final String title;
  @override
  final double totalCount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ProfileEvent.addIncome(title: $title, totalCount: $totalCount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddIncomeImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, totalCount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddIncomeImplCopyWith<_$AddIncomeImpl> get copyWith =>
      __$$AddIncomeImplCopyWithImpl<_$AddIncomeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String title, double totalCount, DateTime date)
        addExpense,
    required TResult Function(String title, double totalCount, DateTime date)
        addIncome,
  }) {
    return addIncome(title, totalCount, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult? Function(String title, double totalCount, DateTime date)?
        addIncome,
  }) {
    return addIncome?.call(title, totalCount, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String title, double totalCount, DateTime date)?
        addExpense,
    TResult Function(String title, double totalCount, DateTime date)? addIncome,
    required TResult orElse(),
  }) {
    if (addIncome != null) {
      return addIncome(title, totalCount, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_AddExpense value) addExpense,
    required TResult Function(AddIncome value) addIncome,
  }) {
    return addIncome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_AddExpense value)? addExpense,
    TResult? Function(AddIncome value)? addIncome,
  }) {
    return addIncome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_AddExpense value)? addExpense,
    TResult Function(AddIncome value)? addIncome,
    required TResult orElse(),
  }) {
    if (addIncome != null) {
      return addIncome(this);
    }
    return orElse();
  }
}

abstract class AddIncome implements ProfileEvent {
  const factory AddIncome(
      {required final String title,
      required final double totalCount,
      required final DateTime date}) = _$AddIncomeImpl;

  String get title;
  double get totalCount;
  DateTime get date;
  @JsonKey(ignore: true)
  _$$AddIncomeImplCopyWith<_$AddIncomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user, List<IncomeModel> incomesList)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user, List<IncomeModel> incomesList)? initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user, List<IncomeModel> incomesList)? initial,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

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
  $Res call({UserModel user, List<IncomeModel> incomesList});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$PhoneStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$PhoneStateImpl>
    implements _$$PhoneStateImplCopyWith<$Res> {
  __$$PhoneStateImplCopyWithImpl(
      _$PhoneStateImpl _value, $Res Function(_$PhoneStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? incomesList = null,
  }) {
    return _then(_$PhoneStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      incomesList: null == incomesList
          ? _value._incomesList
          : incomesList // ignore: cast_nullable_to_non_nullable
              as List<IncomeModel>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$PhoneStateImpl implements _PhoneState {
  const _$PhoneStateImpl(
      {required this.user, required final List<IncomeModel> incomesList})
      : _incomesList = incomesList;

  @override
  final UserModel user;
  final List<IncomeModel> _incomesList;
  @override
  List<IncomeModel> get incomesList {
    if (_incomesList is EqualUnmodifiableListView) return _incomesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomesList);
  }

  @override
  String toString() {
    return 'ProfileState.initial(user: $user, incomesList: $incomesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._incomesList, _incomesList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, const DeepCollectionEquality().hash(_incomesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneStateImplCopyWith<_$PhoneStateImpl> get copyWith =>
      __$$PhoneStateImplCopyWithImpl<_$PhoneStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user, List<IncomeModel> incomesList)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return initial(user, incomesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user, List<IncomeModel> incomesList)? initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return initial?.call(user, incomesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user, List<IncomeModel> incomesList)? initial,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(user, incomesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PhoneState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? initial,
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

abstract class _PhoneState implements ProfileState {
  const factory _PhoneState(
      {required final UserModel user,
      required final List<IncomeModel> incomesList}) = _$PhoneStateImpl;

  UserModel get user;
  List<IncomeModel> get incomesList;
  @JsonKey(ignore: true)
  _$$PhoneStateImplCopyWith<_$PhoneStateImpl> get copyWith =>
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
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingStateImpl>
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
    return 'ProfileState.loading()';
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
    required TResult Function(UserModel user, List<IncomeModel> incomesList)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user, List<IncomeModel> incomesList)? initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user, List<IncomeModel> incomesList)? initial,
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
    required TResult Function(_PhoneState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? initial,
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

abstract class _LoadingState implements ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res, _$InfoStateImpl>
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
    return 'ProfileState.info(message: $message, pageState: $pageState)';
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
    required TResult Function(UserModel user, List<IncomeModel> incomesList)
        initial,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return info(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user, List<IncomeModel> incomesList)? initial,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return info?.call(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user, List<IncomeModel> incomesList)? initial,
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
    required TResult Function(_PhoneState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PhoneState value)? initial,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PhoneState value)? initial,
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

abstract class _InfoState implements ProfileState {
  const factory _InfoState(
      {required final String message,
      required final PageState pageState}) = _$InfoStateImpl;

  String get message;
  PageState get pageState;
  @JsonKey(ignore: true)
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
