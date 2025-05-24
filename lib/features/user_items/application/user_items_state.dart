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
  final double totalBalance;
  final Map<String,UserItemEntity> items;

  const UserItemsLoaded(this.items, this.totalBalance);

  @override
  List<Object?> get props => [totalBalance, items];
}

class UserItemsError extends UserItemsState {
  final String message;

  const UserItemsError(this.message);

  @override
  List<Object?> get props => [message];
}
