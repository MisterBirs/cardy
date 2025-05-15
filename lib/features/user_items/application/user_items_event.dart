import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserItemsEvent extends Equatable {
  const UserItemsEvent();

  @override
  List<Object?> get props => [];
}

class LoadUserItems extends UserItemsEvent {}

class AddUserItem extends UserItemsEvent {
  final UserItemEntity item;

  const AddUserItem(this.item);

  @override
  List<Object?> get props => [item];
}

class UpdateUserItem extends UserItemsEvent {
  final UserItemEntity item;

  const UpdateUserItem(this.item);

  @override
  List<Object?> get props => [item];
}

class DeleteUserItem extends UserItemsEvent {
  final String itemId;

  const DeleteUserItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
}
