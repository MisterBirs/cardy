// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserItemModel _$UserItemModelFromJson(Map<String, dynamic> json) =>
    _UserItemModel(
      id: json['id'] as String,
      paymentMethod:
          $enumDecode(_$PaymentMethodsEnumEnumMap, json['paymentMethod']),
      brandId: json['brandId'] as String,
      code: json['code'] as String,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      notes: json['notes'] as String?,
      cvv: json['cvv'] as String?,
      history: (json['history'] as List<dynamic>?)
              ?.map(
                  (e) => HistoryRecordModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      balance: (json['balance'] as num?)?.toDouble(),
      initialBalance: (json['initialBalance'] as num?)?.toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserItemModelToJson(_UserItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': _$PaymentMethodsEnumEnumMap[instance.paymentMethod]!,
      'brandId': instance.brandId,
      'code': instance.code,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'notes': instance.notes,
      'cvv': instance.cvv,
      'history': instance.history,
      'balance': instance.balance,
      'initialBalance': instance.initialBalance,
      'description': instance.description,
    };

const _$PaymentMethodsEnumEnumMap = {
  PaymentMethodsEnum.giftCard: 'gift_card',
  PaymentMethodsEnum.reloadableCard: 'reloadable_card',
  PaymentMethodsEnum.voucher: 'voucher',
  PaymentMethodsEnum.credit: 'credit',
};
