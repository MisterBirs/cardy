// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserItemModel {
  String get id;
  PaymentMethodsEnum get paymentMethod;
  String get brandId;
  String get code;
  DateTime get expirationDate;
  String? get notes;
  String? get cvv;
  List<HistoryRecordModel> get history;
  double? get balance;
  double? get initialBalance;
  String? get description;

  /// Create a copy of UserItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserItemModelCopyWith<UserItemModel> get copyWith =>
      _$UserItemModelCopyWithImpl<UserItemModel>(
          this as UserItemModel, _$identity);

  /// Serializes this UserItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentMethod,
      brandId,
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
    return 'UserItemModel(id: $id, paymentMethod: $paymentMethod, brandId: $brandId, code: $code, expirationDate: $expirationDate, notes: $notes, cvv: $cvv, history: $history, balance: $balance, initialBalance: $initialBalance, description: $description)';
  }
}

/// @nodoc
abstract mixin class $UserItemModelCopyWith<$Res> {
  factory $UserItemModelCopyWith(
          UserItemModel value, $Res Function(UserItemModel) _then) =
      _$UserItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      PaymentMethodsEnum paymentMethod,
      String brandId,
      String code,
      DateTime expirationDate,
      String? notes,
      String? cvv,
      List<HistoryRecordModel> history,
      double? balance,
      double? initialBalance,
      String? description});
}

/// @nodoc
class _$UserItemModelCopyWithImpl<$Res>
    implements $UserItemModelCopyWith<$Res> {
  _$UserItemModelCopyWithImpl(this._self, this._then);

  final UserItemModel _self;
  final $Res Function(UserItemModel) _then;

  /// Create a copy of UserItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? brandId = null,
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
      brandId: null == brandId
          ? _self.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<HistoryRecordModel>,
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
@JsonSerializable()
class _UserItemModel extends UserItemModel {
  const _UserItemModel(
      {required this.id,
      required this.paymentMethod,
      required this.brandId,
      required this.code,
      required this.expirationDate,
      this.notes,
      this.cvv,
      final List<HistoryRecordModel> history = const [],
      this.balance,
      this.initialBalance,
      this.description})
      : _history = history,
        super._();
  factory _UserItemModel.fromJson(Map<String, dynamic> json) =>
      _$UserItemModelFromJson(json);

  @override
  final String id;
  @override
  final PaymentMethodsEnum paymentMethod;
  @override
  final String brandId;
  @override
  final String code;
  @override
  final DateTime expirationDate;
  @override
  final String? notes;
  @override
  final String? cvv;
  final List<HistoryRecordModel> _history;
  @override
  @JsonKey()
  List<HistoryRecordModel> get history {
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

  /// Create a copy of UserItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserItemModelCopyWith<_UserItemModel> get copyWith =>
      __$UserItemModelCopyWithImpl<_UserItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentMethod,
      brandId,
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
    return 'UserItemModel(id: $id, paymentMethod: $paymentMethod, brandId: $brandId, code: $code, expirationDate: $expirationDate, notes: $notes, cvv: $cvv, history: $history, balance: $balance, initialBalance: $initialBalance, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$UserItemModelCopyWith<$Res>
    implements $UserItemModelCopyWith<$Res> {
  factory _$UserItemModelCopyWith(
          _UserItemModel value, $Res Function(_UserItemModel) _then) =
      __$UserItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      PaymentMethodsEnum paymentMethod,
      String brandId,
      String code,
      DateTime expirationDate,
      String? notes,
      String? cvv,
      List<HistoryRecordModel> history,
      double? balance,
      double? initialBalance,
      String? description});
}

/// @nodoc
class __$UserItemModelCopyWithImpl<$Res>
    implements _$UserItemModelCopyWith<$Res> {
  __$UserItemModelCopyWithImpl(this._self, this._then);

  final _UserItemModel _self;
  final $Res Function(_UserItemModel) _then;

  /// Create a copy of UserItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? brandId = null,
    Object? code = null,
    Object? expirationDate = null,
    Object? notes = freezed,
    Object? cvv = freezed,
    Object? history = null,
    Object? balance = freezed,
    Object? initialBalance = freezed,
    Object? description = freezed,
  }) {
    return _then(_UserItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodsEnum,
      brandId: null == brandId
          ? _self.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<HistoryRecordModel>,
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
