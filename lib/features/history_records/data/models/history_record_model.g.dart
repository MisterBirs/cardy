// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddHistoryRecordModel _$AddHistoryRecordModelFromJson(
        Map<String, dynamic> json) =>
    AddHistoryRecordModel(
      date: DateTime.parse(json['date'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AddHistoryRecordModelToJson(
        AddHistoryRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'runtimeType': instance.$type,
    };

EditHistoryRecordModel _$EditHistoryRecordModelFromJson(
        Map<String, dynamic> json) =>
    EditHistoryRecordModel(
      date: DateTime.parse(json['date'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EditHistoryRecordModelToJson(
        EditHistoryRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'runtimeType': instance.$type,
    };

ExpiredHistoryRecordModel _$ExpiredHistoryRecordModelFromJson(
        Map<String, dynamic> json) =>
    ExpiredHistoryRecordModel(
      date: DateTime.parse(json['date'] as String),
      expiredAt: DateTime.parse(json['expiredAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ExpiredHistoryRecordModelToJson(
        ExpiredHistoryRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'expiredAt': instance.expiredAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

PaymentHistoryRecordModel _$PaymentHistoryRecordModelFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoryRecordModel(
      date: DateTime.parse(json['date'] as String),
      paymentAmount: (json['paymentAmount'] as num).toDouble(),
      redeemedAtId: json['redeemedAtId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PaymentHistoryRecordModelToJson(
        PaymentHistoryRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'paymentAmount': instance.paymentAmount,
      'redeemedAtId': instance.redeemedAtId,
      'runtimeType': instance.$type,
    };

ReloadHistoryRecordModel _$ReloadHistoryRecordModelFromJson(
        Map<String, dynamic> json) =>
    ReloadHistoryRecordModel(
      date: DateTime.parse(json['date'] as String),
      reloadedAmount: (json['reloadedAmount'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ReloadHistoryRecordModelToJson(
        ReloadHistoryRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'reloadedAmount': instance.reloadedAmount,
      'runtimeType': instance.$type,
    };

RemoveHistoryRecordModel _$RemoveHistoryRecordModelFromJson(
        Map<String, dynamic> json) =>
    RemoveHistoryRecordModel(
      date: DateTime.parse(json['date'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RemoveHistoryRecordModelToJson(
        RemoveHistoryRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'runtimeType': instance.$type,
    };

UsedUpHistoryRecordModel _$UsedUpHistoryRecordModelFromJson(
        Map<String, dynamic> json) =>
    UsedUpHistoryRecordModel(
      date: DateTime.parse(json['date'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UsedUpHistoryRecordModelToJson(
        UsedUpHistoryRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'runtimeType': instance.$type,
    };
