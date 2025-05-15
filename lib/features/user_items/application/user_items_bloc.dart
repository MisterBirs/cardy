import 'package:cardy/features/user_items/domain/use_cases/add_user_item_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/delete_user_item_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/fetch_user_items_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/update_user_item_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'user_items_event.dart';
import 'user_items_state.dart';

@injectable
class UserItemsBloc extends Bloc<UserItemsEvent, UserItemsState> {
  final AddUserItemUseCase addUserItemUseCase;
  final DeleteUserItemUseCase deleteUserItemUseCase;
  final FetchUserItemsUseCase fetchUserItemsUseCase;
  final UpdateUserItemUseCase updateUserItemUseCase;

  UserItemsBloc({
    required this.addUserItemUseCase,
    required this.deleteUserItemUseCase,
    required this.fetchUserItemsUseCase,
    required this.updateUserItemUseCase,
  }) : super(UserItemsInitial()) {
    on<LoadUserItems>(_onLoadUserItems);
    on<AddUserItem>(_onAddUserItem);
    on<UpdateUserItem>(_onUpdateUserItem);
    on<DeleteUserItem>(_onDeleteUserItem);
  }

  Future<void> _onLoadUserItems(
    LoadUserItems event,
    Emitter<UserItemsState> emit,
  ) async {
    emit(UserItemsLoading());
    try {
      final items = await fetchUserItemsUseCase();
      emit(UserItemsLoaded(items));
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onAddUserItem(
    AddUserItem event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await addUserItemUseCase(event.item);
      add(LoadUserItems());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onUpdateUserItem(
    UpdateUserItem event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await updateUserItemUseCase(event.item);
      add(LoadUserItems());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onDeleteUserItem(
    DeleteUserItem event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await deleteUserItemUseCase(event.itemId);
      add(LoadUserItems());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }
}
