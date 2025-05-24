import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserItemsEvent extends Equatable {
  const UserItemsEvent();

  @override
  List<Object?> get props => [];
}

class UserItemsLoadRequested extends UserItemsEvent {}

class AddUserItemRequested extends UserItemsEvent {
  final UserItemEntity item;

  const AddUserItemRequested(this.item);

  @override
  List<Object?> get props => [item];
}

class ReloadItemRequested extends UserItemsEvent {
  final String itemId;
  final double amount;

  const ReloadItemRequested(this.itemId, this.amount);

  @override
  List<Object?> get props => [itemId, amount];
}

class PaymentRequested extends UserItemsEvent {
  final String itemId;
  final String reedemAtId;
  final double amount;


  const PaymentRequested(this.itemId, this.reedemAtId , this.amount);

  @override
  List<Object?> get props => [itemId, reedemAtId,  amount];
}

class UpdateUserItemRequested extends UserItemsEvent {
  final UserItemEntity item;

  const UpdateUserItemRequested(this.item);

  @override
  List<Object?> get props => [item];
}

class DeleteUserItemRequested extends UserItemsEvent {
  final String itemId;

  const DeleteUserItemRequested(this.itemId);

  @override
  List<Object?> get props => [itemId];
}
