import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserItemsState extends Equatable {
  const UserItemsState();

  @override
  List<Object?> get props => [];
}

class UserItemsInitial extends UserItemsState {}

class UserItemsLoading extends UserItemsState {}

class UserItemsLoaded extends UserItemsState {
  final List<UserItemEntity> items;

  const UserItemsLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class UserItemsError extends UserItemsState {
  final String message;

  const UserItemsError(this.message);

  @override
  List<Object?> get props => [message];
}
