import 'package:cardy/features/history_records/data/models/history_record_model.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cardy/features/user_items/domain/entites/payment_methods_enum.dart';

part 'user_item_model.freezed.dart';
part 'user_item_model.g.dart';

@freezed
abstract class UserItemModel with _$UserItemModel {
  const UserItemModel._(); 

  const factory UserItemModel({
    required String id,
    required PaymentMethodsEnum paymentMethod,
    required String brandId,
    required String code,
    required DateTime expirationDate,
    String? notes,
    String? cvv,
    @Default([]) List<HistoryRecordModel> history,
    double? balance,
    double? initialBalance,
    String? description,
  }) = _UserItemModel;

  factory UserItemModel.fromJson(Map<String, dynamic> json) =>
      _$UserItemModelFromJson(json);


    static UserItemModel fromEntity(UserItemEntity entity) {
    return UserItemModel(
      id: entity.id,
      paymentMethod: entity.paymentMethod,
      brandId: entity.brand.id,
      code: entity.code,
      expirationDate: entity.expirationDate,
      notes: entity.notes,
      cvv: entity.cvv,
      history: entity.history.map((record) => HistoryRecordModel.fromEntity(record)).toList(),
      balance: entity.balance,
      initialBalance: entity.initialBalance,
      description: entity.description,
    );
  }
}



