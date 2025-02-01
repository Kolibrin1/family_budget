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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiagramEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExpenseModel? expense) initEditExpense,
    required TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)
        editExpense,
    required TResult Function(int expenseId) deleteExpense,
    required TResult Function(int type) selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExpenseModel? expense)? initEditExpense,
    TResult? Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult? Function(int expenseId)? deleteExpense,
    TResult? Function(int type)? selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExpenseModel? expense)? initEditExpense,
    TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult Function(int expenseId)? deleteExpense,
    TResult Function(int type)? selectTypeView,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_InitEditExpenseEvent value) initEditExpense,
    required TResult Function(_EditExpense value) editExpense,
    required TResult Function(_DeleteExpense value) deleteExpense,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult? Function(_EditExpense value)? editExpense,
    TResult? Function(_DeleteExpense value)? deleteExpense,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult Function(_EditExpense value)? editExpense,
    TResult Function(_DeleteExpense value)? deleteExpense,
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

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialEventImpl implements _InitialEvent {
  const _$InitialEventImpl();

  @override
  String toString() {
    return 'DiagramEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExpenseModel? expense) initEditExpense,
    required TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)
        editExpense,
    required TResult Function(int expenseId) deleteExpense,
    required TResult Function(int type) selectTypeView,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExpenseModel? expense)? initEditExpense,
    TResult? Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult? Function(int expenseId)? deleteExpense,
    TResult? Function(int type)? selectTypeView,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExpenseModel? expense)? initEditExpense,
    TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult Function(int expenseId)? deleteExpense,
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
    required TResult Function(_InitEditExpenseEvent value) initEditExpense,
    required TResult Function(_EditExpense value) editExpense,
    required TResult Function(_DeleteExpense value) deleteExpense,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult? Function(_EditExpense value)? editExpense,
    TResult? Function(_DeleteExpense value)? deleteExpense,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult Function(_EditExpense value)? editExpense,
    TResult Function(_DeleteExpense value)? deleteExpense,
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
abstract class _$$InitEditExpenseEventImplCopyWith<$Res> {
  factory _$$InitEditExpenseEventImplCopyWith(_$InitEditExpenseEventImpl value,
          $Res Function(_$InitEditExpenseEventImpl) then) =
      __$$InitEditExpenseEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ExpenseModel? expense});

  $ExpenseModelCopyWith<$Res>? get expense;
}

/// @nodoc
class __$$InitEditExpenseEventImplCopyWithImpl<$Res>
    extends _$DiagramEventCopyWithImpl<$Res, _$InitEditExpenseEventImpl>
    implements _$$InitEditExpenseEventImplCopyWith<$Res> {
  __$$InitEditExpenseEventImplCopyWithImpl(_$InitEditExpenseEventImpl _value,
      $Res Function(_$InitEditExpenseEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expense = freezed,
  }) {
    return _then(_$InitEditExpenseEventImpl(
      expense: freezed == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as ExpenseModel?,
    ));
  }

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseModelCopyWith<$Res>? get expense {
    if (_value.expense == null) {
      return null;
    }

    return $ExpenseModelCopyWith<$Res>(_value.expense!, (value) {
      return _then(_value.copyWith(expense: value));
    });
  }
}

/// @nodoc

class _$InitEditExpenseEventImpl implements _InitEditExpenseEvent {
  const _$InitEditExpenseEventImpl({this.expense});

  @override
  final ExpenseModel? expense;

  @override
  String toString() {
    return 'DiagramEvent.initEditExpense(expense: $expense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitEditExpenseEventImpl &&
            (identical(other.expense, expense) || other.expense == expense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expense);

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitEditExpenseEventImplCopyWith<_$InitEditExpenseEventImpl>
      get copyWith =>
          __$$InitEditExpenseEventImplCopyWithImpl<_$InitEditExpenseEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExpenseModel? expense) initEditExpense,
    required TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)
        editExpense,
    required TResult Function(int expenseId) deleteExpense,
    required TResult Function(int type) selectTypeView,
  }) {
    return initEditExpense(expense);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExpenseModel? expense)? initEditExpense,
    TResult? Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult? Function(int expenseId)? deleteExpense,
    TResult? Function(int type)? selectTypeView,
  }) {
    return initEditExpense?.call(expense);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExpenseModel? expense)? initEditExpense,
    TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult Function(int expenseId)? deleteExpense,
    TResult Function(int type)? selectTypeView,
    required TResult orElse(),
  }) {
    if (initEditExpense != null) {
      return initEditExpense(expense);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_InitEditExpenseEvent value) initEditExpense,
    required TResult Function(_EditExpense value) editExpense,
    required TResult Function(_DeleteExpense value) deleteExpense,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) {
    return initEditExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult? Function(_EditExpense value)? editExpense,
    TResult? Function(_DeleteExpense value)? deleteExpense,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) {
    return initEditExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult Function(_EditExpense value)? editExpense,
    TResult Function(_DeleteExpense value)? deleteExpense,
    TResult Function(_SelectTypeView value)? selectTypeView,
    required TResult orElse(),
  }) {
    if (initEditExpense != null) {
      return initEditExpense(this);
    }
    return orElse();
  }
}

abstract class _InitEditExpenseEvent implements DiagramEvent {
  const factory _InitEditExpenseEvent({final ExpenseModel? expense}) =
      _$InitEditExpenseEventImpl;

  ExpenseModel? get expense;

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitEditExpenseEventImplCopyWith<_$InitEditExpenseEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditExpenseImplCopyWith<$Res> {
  factory _$$EditExpenseImplCopyWith(
          _$EditExpenseImpl value, $Res Function(_$EditExpenseImpl) then) =
      __$$EditExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int expenseId, int categoryId, double totalCount, DateTime date});
}

/// @nodoc
class __$$EditExpenseImplCopyWithImpl<$Res>
    extends _$DiagramEventCopyWithImpl<$Res, _$EditExpenseImpl>
    implements _$$EditExpenseImplCopyWith<$Res> {
  __$$EditExpenseImplCopyWithImpl(
      _$EditExpenseImpl _value, $Res Function(_$EditExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseId = null,
    Object? categoryId = null,
    Object? totalCount = null,
    Object? date = null,
  }) {
    return _then(_$EditExpenseImpl(
      expenseId: null == expenseId
          ? _value.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$EditExpenseImpl implements _EditExpense {
  const _$EditExpenseImpl(
      {required this.expenseId,
      required this.categoryId,
      required this.totalCount,
      required this.date});

  @override
  final int expenseId;
  @override
  final int categoryId;
  @override
  final double totalCount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'DiagramEvent.editExpense(expenseId: $expenseId, categoryId: $categoryId, totalCount: $totalCount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditExpenseImpl &&
            (identical(other.expenseId, expenseId) ||
                other.expenseId == expenseId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, expenseId, categoryId, totalCount, date);

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditExpenseImplCopyWith<_$EditExpenseImpl> get copyWith =>
      __$$EditExpenseImplCopyWithImpl<_$EditExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExpenseModel? expense) initEditExpense,
    required TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)
        editExpense,
    required TResult Function(int expenseId) deleteExpense,
    required TResult Function(int type) selectTypeView,
  }) {
    return editExpense(expenseId, categoryId, totalCount, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExpenseModel? expense)? initEditExpense,
    TResult? Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult? Function(int expenseId)? deleteExpense,
    TResult? Function(int type)? selectTypeView,
  }) {
    return editExpense?.call(expenseId, categoryId, totalCount, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExpenseModel? expense)? initEditExpense,
    TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult Function(int expenseId)? deleteExpense,
    TResult Function(int type)? selectTypeView,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense(expenseId, categoryId, totalCount, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_InitEditExpenseEvent value) initEditExpense,
    required TResult Function(_EditExpense value) editExpense,
    required TResult Function(_DeleteExpense value) deleteExpense,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) {
    return editExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult? Function(_EditExpense value)? editExpense,
    TResult? Function(_DeleteExpense value)? deleteExpense,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) {
    return editExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult Function(_EditExpense value)? editExpense,
    TResult Function(_DeleteExpense value)? deleteExpense,
    TResult Function(_SelectTypeView value)? selectTypeView,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense(this);
    }
    return orElse();
  }
}

abstract class _EditExpense implements DiagramEvent {
  const factory _EditExpense(
      {required final int expenseId,
      required final int categoryId,
      required final double totalCount,
      required final DateTime date}) = _$EditExpenseImpl;

  int get expenseId;
  int get categoryId;
  double get totalCount;
  DateTime get date;

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditExpenseImplCopyWith<_$EditExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteExpenseImplCopyWith<$Res> {
  factory _$$DeleteExpenseImplCopyWith(
          _$DeleteExpenseImpl value, $Res Function(_$DeleteExpenseImpl) then) =
      __$$DeleteExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int expenseId});
}

/// @nodoc
class __$$DeleteExpenseImplCopyWithImpl<$Res>
    extends _$DiagramEventCopyWithImpl<$Res, _$DeleteExpenseImpl>
    implements _$$DeleteExpenseImplCopyWith<$Res> {
  __$$DeleteExpenseImplCopyWithImpl(
      _$DeleteExpenseImpl _value, $Res Function(_$DeleteExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseId = null,
  }) {
    return _then(_$DeleteExpenseImpl(
      expenseId: null == expenseId
          ? _value.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteExpenseImpl implements _DeleteExpense {
  const _$DeleteExpenseImpl({required this.expenseId});

  @override
  final int expenseId;

  @override
  String toString() {
    return 'DiagramEvent.deleteExpense(expenseId: $expenseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteExpenseImpl &&
            (identical(other.expenseId, expenseId) ||
                other.expenseId == expenseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expenseId);

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteExpenseImplCopyWith<_$DeleteExpenseImpl> get copyWith =>
      __$$DeleteExpenseImplCopyWithImpl<_$DeleteExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExpenseModel? expense) initEditExpense,
    required TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)
        editExpense,
    required TResult Function(int expenseId) deleteExpense,
    required TResult Function(int type) selectTypeView,
  }) {
    return deleteExpense(expenseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExpenseModel? expense)? initEditExpense,
    TResult? Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult? Function(int expenseId)? deleteExpense,
    TResult? Function(int type)? selectTypeView,
  }) {
    return deleteExpense?.call(expenseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExpenseModel? expense)? initEditExpense,
    TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult Function(int expenseId)? deleteExpense,
    TResult Function(int type)? selectTypeView,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense(expenseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_InitEditExpenseEvent value) initEditExpense,
    required TResult Function(_EditExpense value) editExpense,
    required TResult Function(_DeleteExpense value) deleteExpense,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) {
    return deleteExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult? Function(_EditExpense value)? editExpense,
    TResult? Function(_DeleteExpense value)? deleteExpense,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) {
    return deleteExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult Function(_EditExpense value)? editExpense,
    TResult Function(_DeleteExpense value)? deleteExpense,
    TResult Function(_SelectTypeView value)? selectTypeView,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense(this);
    }
    return orElse();
  }
}

abstract class _DeleteExpense implements DiagramEvent {
  const factory _DeleteExpense({required final int expenseId}) =
      _$DeleteExpenseImpl;

  int get expenseId;

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteExpenseImplCopyWith<_$DeleteExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
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

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTypeViewImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTypeViewImplCopyWith<_$SelectTypeViewImpl> get copyWith =>
      __$$SelectTypeViewImplCopyWithImpl<_$SelectTypeViewImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ExpenseModel? expense) initEditExpense,
    required TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)
        editExpense,
    required TResult Function(int expenseId) deleteExpense,
    required TResult Function(int type) selectTypeView,
  }) {
    return selectTypeView(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ExpenseModel? expense)? initEditExpense,
    TResult? Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult? Function(int expenseId)? deleteExpense,
    TResult? Function(int type)? selectTypeView,
  }) {
    return selectTypeView?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ExpenseModel? expense)? initEditExpense,
    TResult Function(
            int expenseId, int categoryId, double totalCount, DateTime date)?
        editExpense,
    TResult Function(int expenseId)? deleteExpense,
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
    required TResult Function(_InitEditExpenseEvent value) initEditExpense,
    required TResult Function(_EditExpense value) editExpense,
    required TResult Function(_DeleteExpense value) deleteExpense,
    required TResult Function(_SelectTypeView value) selectTypeView,
  }) {
    return selectTypeView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult? Function(_EditExpense value)? editExpense,
    TResult? Function(_DeleteExpense value)? deleteExpense,
    TResult? Function(_SelectTypeView value)? selectTypeView,
  }) {
    return selectTypeView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_InitEditExpenseEvent value)? initEditExpense,
    TResult Function(_EditExpense value)? editExpense,
    TResult Function(_DeleteExpense value)? deleteExpense,
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

  /// Create a copy of DiagramEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectTypeViewImplCopyWith<_$SelectTypeViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)
        initial,
    required TResult Function(ExpenseModel? expense) editExpense,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult? Function(ExpenseModel? expense)? editExpense,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult Function(ExpenseModel? expense)? editExpense,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_EditExpenseState value) editExpense,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_EditExpenseState value)? editExpense,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_EditExpenseState value)? editExpense,
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

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String currency,
      List<ExpenseModel> expensesList,
      int type,
      List<Color> colors,
      List<String> titles,
      List<double> totalCounts,
      double allCount});
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$DiagramStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? expensesList = null,
    Object? type = null,
    Object? colors = null,
    Object? titles = null,
    Object? totalCounts = null,
    Object? allCount = null,
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
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      titles: null == titles
          ? _value._titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalCounts: null == totalCounts
          ? _value._totalCounts
          : totalCounts // ignore: cast_nullable_to_non_nullable
              as List<double>,
      allCount: null == allCount
          ? _value.allCount
          : allCount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$InitialStateImpl implements _InitialState {
  const _$InitialStateImpl(
      {required this.currency,
      required final List<ExpenseModel> expensesList,
      required this.type,
      required final List<Color> colors,
      required final List<String> titles,
      required final List<double> totalCounts,
      required this.allCount})
      : _expensesList = expensesList,
        _colors = colors,
        _titles = titles,
        _totalCounts = totalCounts;

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
  final List<Color> _colors;
  @override
  List<Color> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  final List<String> _titles;
  @override
  List<String> get titles {
    if (_titles is EqualUnmodifiableListView) return _titles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titles);
  }

  final List<double> _totalCounts;
  @override
  List<double> get totalCounts {
    if (_totalCounts is EqualUnmodifiableListView) return _totalCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalCounts);
  }

  @override
  final double allCount;

  @override
  String toString() {
    return 'DiagramState.initial(currency: $currency, expensesList: $expensesList, type: $type, colors: $colors, titles: $titles, totalCounts: $totalCounts, allCount: $allCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialStateImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._expensesList, _expensesList) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            const DeepCollectionEquality().equals(other._titles, _titles) &&
            const DeepCollectionEquality()
                .equals(other._totalCounts, _totalCounts) &&
            (identical(other.allCount, allCount) ||
                other.allCount == allCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currency,
      const DeepCollectionEquality().hash(_expensesList),
      type,
      const DeepCollectionEquality().hash(_colors),
      const DeepCollectionEquality().hash(_titles),
      const DeepCollectionEquality().hash(_totalCounts),
      allCount);

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      __$$InitialStateImplCopyWithImpl<_$InitialStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)
        initial,
    required TResult Function(ExpenseModel? expense) editExpense,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return initial(
        currency, expensesList, type, colors, titles, totalCounts, allCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult? Function(ExpenseModel? expense)? editExpense,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return initial?.call(
        currency, expensesList, type, colors, titles, totalCounts, allCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult Function(ExpenseModel? expense)? editExpense,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          currency, expensesList, type, colors, titles, totalCounts, allCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_EditExpenseState value) editExpense,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_EditExpenseState value)? editExpense,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_EditExpenseState value)? editExpense,
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
      required final int type,
      required final List<Color> colors,
      required final List<String> titles,
      required final List<double> totalCounts,
      required final double allCount}) = _$InitialStateImpl;

  String get currency;
  List<ExpenseModel> get expensesList;
  int get type;
  List<Color> get colors;
  List<String> get titles;
  List<double> get totalCounts;
  double get allCount;

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditExpenseStateImplCopyWith<$Res> {
  factory _$$EditExpenseStateImplCopyWith(_$EditExpenseStateImpl value,
          $Res Function(_$EditExpenseStateImpl) then) =
      __$$EditExpenseStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ExpenseModel? expense});

  $ExpenseModelCopyWith<$Res>? get expense;
}

/// @nodoc
class __$$EditExpenseStateImplCopyWithImpl<$Res>
    extends _$DiagramStateCopyWithImpl<$Res, _$EditExpenseStateImpl>
    implements _$$EditExpenseStateImplCopyWith<$Res> {
  __$$EditExpenseStateImplCopyWithImpl(_$EditExpenseStateImpl _value,
      $Res Function(_$EditExpenseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expense = freezed,
  }) {
    return _then(_$EditExpenseStateImpl(
      expense: freezed == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as ExpenseModel?,
    ));
  }

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseModelCopyWith<$Res>? get expense {
    if (_value.expense == null) {
      return null;
    }

    return $ExpenseModelCopyWith<$Res>(_value.expense!, (value) {
      return _then(_value.copyWith(expense: value));
    });
  }
}

/// @nodoc

class _$EditExpenseStateImpl implements _EditExpenseState {
  const _$EditExpenseStateImpl({this.expense});

  @override
  final ExpenseModel? expense;

  @override
  String toString() {
    return 'DiagramState.editExpense(expense: $expense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditExpenseStateImpl &&
            (identical(other.expense, expense) || other.expense == expense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expense);

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditExpenseStateImplCopyWith<_$EditExpenseStateImpl> get copyWith =>
      __$$EditExpenseStateImplCopyWithImpl<_$EditExpenseStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)
        initial,
    required TResult Function(ExpenseModel? expense) editExpense,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return editExpense(expense);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult? Function(ExpenseModel? expense)? editExpense,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return editExpense?.call(expense);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult Function(ExpenseModel? expense)? editExpense,
    TResult Function()? loading,
    TResult Function(String message, PageState pageState)? info,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense(expense);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_EditExpenseState value) editExpense,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return editExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_EditExpenseState value)? editExpense,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return editExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_EditExpenseState value)? editExpense,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_InfoState value)? info,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense(this);
    }
    return orElse();
  }
}

abstract class _EditExpenseState implements DiagramState {
  const factory _EditExpenseState({final ExpenseModel? expense}) =
      _$EditExpenseStateImpl;

  ExpenseModel? get expense;

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditExpenseStateImplCopyWith<_$EditExpenseStateImpl> get copyWith =>
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

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'DiagramState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)
        initial,
    required TResult Function(ExpenseModel? expense) editExpense,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult? Function(ExpenseModel? expense)? editExpense,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult Function(ExpenseModel? expense)? editExpense,
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
    required TResult Function(_EditExpenseState value) editExpense,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_EditExpenseState value)? editExpense,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_EditExpenseState value)? editExpense,
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

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, pageState);

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      __$$InfoStateImplCopyWithImpl<_$InfoStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)
        initial,
    required TResult Function(ExpenseModel? expense) editExpense,
    required TResult Function() loading,
    required TResult Function(String message, PageState pageState) info,
  }) {
    return info(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult? Function(ExpenseModel? expense)? editExpense,
    TResult? Function()? loading,
    TResult? Function(String message, PageState pageState)? info,
  }) {
    return info?.call(message, pageState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String currency,
            List<ExpenseModel> expensesList,
            int type,
            List<Color> colors,
            List<String> titles,
            List<double> totalCounts,
            double allCount)?
        initial,
    TResult Function(ExpenseModel? expense)? editExpense,
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
    required TResult Function(_EditExpenseState value) editExpense,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_InfoState value) info,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_EditExpenseState value)? editExpense,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_InfoState value)? info,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_EditExpenseState value)? editExpense,
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

  /// Create a copy of DiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
