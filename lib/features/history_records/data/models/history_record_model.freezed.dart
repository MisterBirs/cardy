// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
HistoryRecordModel _$HistoryRecordModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'add':
      return AddHistoryRecordModel.fromJson(json);
    case 'edit':
      return EditHistoryRecordModel.fromJson(json);
    case 'expired':
      return ExpiredHistoryRecordModel.fromJson(json);
    case 'payment':
      return PaymentHistoryRecordModel.fromJson(json);
    case 'reload':
      return ReloadHistoryRecordModel.fromJson(json);
    case 'remove':
      return RemoveHistoryRecordModel.fromJson(json);
    case 'usedUp':
      return UsedUpHistoryRecordModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'HistoryRecordModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$HistoryRecordModel {
  DateTime get date;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryRecordModelCopyWith<HistoryRecordModel> get copyWith =>
      _$HistoryRecordModelCopyWithImpl<HistoryRecordModel>(
          this as HistoryRecordModel, _$identity);

  /// Serializes this HistoryRecordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryRecordModel &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'HistoryRecordModel(date: $date)';
  }
}

/// @nodoc
abstract mixin class $HistoryRecordModelCopyWith<$Res> {
  factory $HistoryRecordModelCopyWith(
          HistoryRecordModel value, $Res Function(HistoryRecordModel) _then) =
      _$HistoryRecordModelCopyWithImpl;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$HistoryRecordModelCopyWithImpl<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  _$HistoryRecordModelCopyWithImpl(this._self, this._then);

  final HistoryRecordModel _self;
  final $Res Function(HistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class AddHistoryRecordModel extends HistoryRecordModel {
  const AddHistoryRecordModel({required this.date, final String? $type})
      : $type = $type ?? 'add',
        super._();
  factory AddHistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$AddHistoryRecordModelFromJson(json);

  @override
  final DateTime date;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddHistoryRecordModelCopyWith<AddHistoryRecordModel> get copyWith =>
      _$AddHistoryRecordModelCopyWithImpl<AddHistoryRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddHistoryRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddHistoryRecordModel &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'HistoryRecordModel.add(date: $date)';
  }
}

/// @nodoc
abstract mixin class $AddHistoryRecordModelCopyWith<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  factory $AddHistoryRecordModelCopyWith(AddHistoryRecordModel value,
          $Res Function(AddHistoryRecordModel) _then) =
      _$AddHistoryRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$AddHistoryRecordModelCopyWithImpl<$Res>
    implements $AddHistoryRecordModelCopyWith<$Res> {
  _$AddHistoryRecordModelCopyWithImpl(this._self, this._then);

  final AddHistoryRecordModel _self;
  final $Res Function(AddHistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
  }) {
    return _then(AddHistoryRecordModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class EditHistoryRecordModel extends HistoryRecordModel {
  const EditHistoryRecordModel({required this.date, final String? $type})
      : $type = $type ?? 'edit',
        super._();
  factory EditHistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$EditHistoryRecordModelFromJson(json);

  @override
  final DateTime date;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EditHistoryRecordModelCopyWith<EditHistoryRecordModel> get copyWith =>
      _$EditHistoryRecordModelCopyWithImpl<EditHistoryRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EditHistoryRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditHistoryRecordModel &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'HistoryRecordModel.edit(date: $date)';
  }
}

/// @nodoc
abstract mixin class $EditHistoryRecordModelCopyWith<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  factory $EditHistoryRecordModelCopyWith(EditHistoryRecordModel value,
          $Res Function(EditHistoryRecordModel) _then) =
      _$EditHistoryRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$EditHistoryRecordModelCopyWithImpl<$Res>
    implements $EditHistoryRecordModelCopyWith<$Res> {
  _$EditHistoryRecordModelCopyWithImpl(this._self, this._then);

  final EditHistoryRecordModel _self;
  final $Res Function(EditHistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
  }) {
    return _then(EditHistoryRecordModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ExpiredHistoryRecordModel extends HistoryRecordModel {
  const ExpiredHistoryRecordModel(
      {required this.date, required this.expiredAt, final String? $type})
      : $type = $type ?? 'expired',
        super._();
  factory ExpiredHistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ExpiredHistoryRecordModelFromJson(json);

  @override
  final DateTime date;
  final DateTime expiredAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpiredHistoryRecordModelCopyWith<ExpiredHistoryRecordModel> get copyWith =>
      _$ExpiredHistoryRecordModelCopyWithImpl<ExpiredHistoryRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExpiredHistoryRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpiredHistoryRecordModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, expiredAt);

  @override
  String toString() {
    return 'HistoryRecordModel.expired(date: $date, expiredAt: $expiredAt)';
  }
}

/// @nodoc
abstract mixin class $ExpiredHistoryRecordModelCopyWith<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  factory $ExpiredHistoryRecordModelCopyWith(ExpiredHistoryRecordModel value,
          $Res Function(ExpiredHistoryRecordModel) _then) =
      _$ExpiredHistoryRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, DateTime expiredAt});
}

/// @nodoc
class _$ExpiredHistoryRecordModelCopyWithImpl<$Res>
    implements $ExpiredHistoryRecordModelCopyWith<$Res> {
  _$ExpiredHistoryRecordModelCopyWithImpl(this._self, this._then);

  final ExpiredHistoryRecordModel _self;
  final $Res Function(ExpiredHistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? expiredAt = null,
  }) {
    return _then(ExpiredHistoryRecordModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiredAt: null == expiredAt
          ? _self.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class PaymentHistoryRecordModel extends HistoryRecordModel {
  const PaymentHistoryRecordModel(
      {required this.date,
      required this.paymentAmount,
      required this.redeemedAtId,
      final String? $type})
      : $type = $type ?? 'payment',
        super._();
  factory PaymentHistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryRecordModelFromJson(json);

  @override
  final DateTime date;
  final double paymentAmount;
  final String redeemedAtId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentHistoryRecordModelCopyWith<PaymentHistoryRecordModel> get copyWith =>
      _$PaymentHistoryRecordModelCopyWithImpl<PaymentHistoryRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentHistoryRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentHistoryRecordModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.redeemedAtId, redeemedAtId) ||
                other.redeemedAtId == redeemedAtId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, paymentAmount, redeemedAtId);

  @override
  String toString() {
    return 'HistoryRecordModel.payment(date: $date, paymentAmount: $paymentAmount, redeemedAtId: $redeemedAtId)';
  }
}

/// @nodoc
abstract mixin class $PaymentHistoryRecordModelCopyWith<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  factory $PaymentHistoryRecordModelCopyWith(PaymentHistoryRecordModel value,
          $Res Function(PaymentHistoryRecordModel) _then) =
      _$PaymentHistoryRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, double paymentAmount, String redeemedAtId});
}

/// @nodoc
class _$PaymentHistoryRecordModelCopyWithImpl<$Res>
    implements $PaymentHistoryRecordModelCopyWith<$Res> {
  _$PaymentHistoryRecordModelCopyWithImpl(this._self, this._then);

  final PaymentHistoryRecordModel _self;
  final $Res Function(PaymentHistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? paymentAmount = null,
    Object? redeemedAtId = null,
  }) {
    return _then(PaymentHistoryRecordModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentAmount: null == paymentAmount
          ? _self.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      redeemedAtId: null == redeemedAtId
          ? _self.redeemedAtId
          : redeemedAtId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ReloadHistoryRecordModel extends HistoryRecordModel {
  const ReloadHistoryRecordModel(
      {required this.date, required this.reloadedAmount, final String? $type})
      : $type = $type ?? 'reload',
        super._();
  factory ReloadHistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ReloadHistoryRecordModelFromJson(json);

  @override
  final DateTime date;
  final double reloadedAmount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReloadHistoryRecordModelCopyWith<ReloadHistoryRecordModel> get copyWith =>
      _$ReloadHistoryRecordModelCopyWithImpl<ReloadHistoryRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReloadHistoryRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReloadHistoryRecordModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reloadedAmount, reloadedAmount) ||
                other.reloadedAmount == reloadedAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, reloadedAmount);

  @override
  String toString() {
    return 'HistoryRecordModel.reload(date: $date, reloadedAmount: $reloadedAmount)';
  }
}

/// @nodoc
abstract mixin class $ReloadHistoryRecordModelCopyWith<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  factory $ReloadHistoryRecordModelCopyWith(ReloadHistoryRecordModel value,
          $Res Function(ReloadHistoryRecordModel) _then) =
      _$ReloadHistoryRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, double reloadedAmount});
}

/// @nodoc
class _$ReloadHistoryRecordModelCopyWithImpl<$Res>
    implements $ReloadHistoryRecordModelCopyWith<$Res> {
  _$ReloadHistoryRecordModelCopyWithImpl(this._self, this._then);

  final ReloadHistoryRecordModel _self;
  final $Res Function(ReloadHistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? reloadedAmount = null,
  }) {
    return _then(ReloadHistoryRecordModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reloadedAmount: null == reloadedAmount
          ? _self.reloadedAmount
          : reloadedAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class RemoveHistoryRecordModel extends HistoryRecordModel {
  const RemoveHistoryRecordModel({required this.date, final String? $type})
      : $type = $type ?? 'remove',
        super._();
  factory RemoveHistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$RemoveHistoryRecordModelFromJson(json);

  @override
  final DateTime date;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoveHistoryRecordModelCopyWith<RemoveHistoryRecordModel> get copyWith =>
      _$RemoveHistoryRecordModelCopyWithImpl<RemoveHistoryRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoveHistoryRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveHistoryRecordModel &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'HistoryRecordModel.remove(date: $date)';
  }
}

/// @nodoc
abstract mixin class $RemoveHistoryRecordModelCopyWith<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  factory $RemoveHistoryRecordModelCopyWith(RemoveHistoryRecordModel value,
          $Res Function(RemoveHistoryRecordModel) _then) =
      _$RemoveHistoryRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$RemoveHistoryRecordModelCopyWithImpl<$Res>
    implements $RemoveHistoryRecordModelCopyWith<$Res> {
  _$RemoveHistoryRecordModelCopyWithImpl(this._self, this._then);

  final RemoveHistoryRecordModel _self;
  final $Res Function(RemoveHistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
  }) {
    return _then(RemoveHistoryRecordModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class UsedUpHistoryRecordModel extends HistoryRecordModel {
  const UsedUpHistoryRecordModel({required this.date, final String? $type})
      : $type = $type ?? 'usedUp',
        super._();
  factory UsedUpHistoryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$UsedUpHistoryRecordModelFromJson(json);

  @override
  final DateTime date;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsedUpHistoryRecordModelCopyWith<UsedUpHistoryRecordModel> get copyWith =>
      _$UsedUpHistoryRecordModelCopyWithImpl<UsedUpHistoryRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsedUpHistoryRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsedUpHistoryRecordModel &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'HistoryRecordModel.usedUp(date: $date)';
  }
}

/// @nodoc
abstract mixin class $UsedUpHistoryRecordModelCopyWith<$Res>
    implements $HistoryRecordModelCopyWith<$Res> {
  factory $UsedUpHistoryRecordModelCopyWith(UsedUpHistoryRecordModel value,
          $Res Function(UsedUpHistoryRecordModel) _then) =
      _$UsedUpHistoryRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$UsedUpHistoryRecordModelCopyWithImpl<$Res>
    implements $UsedUpHistoryRecordModelCopyWith<$Res> {
  _$UsedUpHistoryRecordModelCopyWithImpl(this._self, this._then);

  final UsedUpHistoryRecordModel _self;
  final $Res Function(UsedUpHistoryRecordModel) _then;

  /// Create a copy of HistoryRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
  }) {
    return _then(UsedUpHistoryRecordModel(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
