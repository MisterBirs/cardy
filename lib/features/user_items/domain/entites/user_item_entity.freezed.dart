// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserItemEntity {
  String get id;
  PaymentMethodsEnum get paymentMethod;
  BrandEntity get brand;
  String get code;
  DateTime get expirationDate;
  String? get notes;
  String? get cvv;
  List<HistoryRecordEntity> get history;
  double? get balance;
  double? get initialBalance;
  String? get description;

  /// Create a copy of UserItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserItemEntityCopyWith<UserItemEntity> get copyWith =>
      _$UserItemEntityCopyWithImpl<UserItemEntity>(
          this as UserItemEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.initialBalance, initialBalance) ||
                other.initialBalance == initialBalance) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentMethod,
      brand,
      code,
      expirationDate,
      notes,
      cvv,
      const DeepCollectionEquality().hash(history),
      balance,
      initialBalance,
      description);

  @override
  String toString() {
    return 'UserItemEntity(id: $id, paymentMethod: $paymentMethod, brand: $brand, code: $code, expirationDate: $expirationDate, notes: $notes, cvv: $cvv, history: $history, balance: $balance, initialBalance: $initialBalance, description: $description)';
  }
}

/// @nodoc
abstract mixin class $UserItemEntityCopyWith<$Res> {
  factory $UserItemEntityCopyWith(
          UserItemEntity value, $Res Function(UserItemEntity) _then) =
      _$UserItemEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      PaymentMethodsEnum paymentMethod,
      BrandEntity brand,
      String code,
      DateTime expirationDate,
      String? notes,
      String? cvv,
      List<HistoryRecordEntity> history,
      double? balance,
      double? initialBalance,
      String? description});
}

/// @nodoc
class _$UserItemEntityCopyWithImpl<$Res>
    implements $UserItemEntityCopyWith<$Res> {
  _$UserItemEntityCopyWithImpl(this._self, this._then);

  final UserItemEntity _self;
  final $Res Function(UserItemEntity) _then;

  /// Create a copy of UserItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? brand = null,
    Object? code = null,
    Object? expirationDate = null,
    Object? notes = freezed,
    Object? cvv = freezed,
    Object? history = null,
    Object? balance = freezed,
    Object? initialBalance = freezed,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodsEnum,
      brand: null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandEntity,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _self.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cvv: freezed == cvv
          ? _self.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String?,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryRecordEntity>,
      balance: freezed == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      initialBalance: freezed == initialBalance
          ? _self.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _UserItemEntity implements UserItemEntity {
  const _UserItemEntity(
      {required this.id,
      required this.paymentMethod,
      required this.brand,
      required this.code,
      required this.expirationDate,
      this.notes,
      this.cvv,
      final List<HistoryRecordEntity> history = const [],
      this.balance,
      this.initialBalance,
      this.description})
      : _history = history;

  @override
  final String id;
  @override
  final PaymentMethodsEnum paymentMethod;
  @override
  final BrandEntity brand;
  @override
  final String code;
  @override
  final DateTime expirationDate;
  @override
  final String? notes;
  @override
  final String? cvv;
  final List<HistoryRecordEntity> _history;
  @override
  @JsonKey()
  List<HistoryRecordEntity> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final double? balance;
  @override
  final double? initialBalance;
  @override
  final String? description;

  /// Create a copy of UserItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserItemEntityCopyWith<_UserItemEntity> get copyWith =>
      __$UserItemEntityCopyWithImpl<_UserItemEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.initialBalance, initialBalance) ||
                other.initialBalance == initialBalance) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentMethod,
      brand,
      code,
      expirationDate,
      notes,
      cvv,
      const DeepCollectionEquality().hash(_history),
      balance,
      initialBalance,
      description);

  @override
  String toString() {
    return 'UserItemEntity(id: $id, paymentMethod: $paymentMethod, brand: $brand, code: $code, expirationDate: $expirationDate, notes: $notes, cvv: $cvv, history: $history, balance: $balance, initialBalance: $initialBalance, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$UserItemEntityCopyWith<$Res>
    implements $UserItemEntityCopyWith<$Res> {
  factory _$UserItemEntityCopyWith(
          _UserItemEntity value, $Res Function(_UserItemEntity) _then) =
      __$UserItemEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      PaymentMethodsEnum paymentMethod,
      BrandEntity brand,
      String code,
      DateTime expirationDate,
      String? notes,
      String? cvv,
      List<HistoryRecordEntity> history,
      double? balance,
      double? initialBalance,
      String? description});
}

/// @nodoc
class __$UserItemEntityCopyWithImpl<$Res>
    implements _$UserItemEntityCopyWith<$Res> {
  __$UserItemEntityCopyWithImpl(this._self, this._then);

  final _UserItemEntity _self;
  final $Res Function(_UserItemEntity) _then;

  /// Create a copy of UserItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? brand = null,
    Object? code = null,
    Object? expirationDate = null,
    Object? notes = freezed,
    Object? cvv = freezed,
    Object? history = null,
    Object? balance = freezed,
    Object? initialBalance = freezed,
    Object? description = freezed,
  }) {
    return _then(_UserItemEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodsEnum,
      brand: null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandEntity,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _self.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      cvv: freezed == cvv
          ? _self.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String?,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryRecordEntity>,
      balance: freezed == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      initialBalance: freezed == initialBalance
          ? _self.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
