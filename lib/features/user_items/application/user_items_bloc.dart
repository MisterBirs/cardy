import 'package:cardy/features/user_items/domain/use_cases/add_user_item_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/calculate_total_balance_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/delete_user_item_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/fetch_user_items_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/payment_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/reload_item_use_case.dart';
import 'package:cardy/features/user_items/domain/use_cases/update_user_item_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'user_items_event.dart';
import 'user_items_state.dart';

@injectable
class UserItemsBloc extends Bloc<UserItemsEvent, UserItemsState> {
  final AddUserItemUseCase addUserItemUseCase;
  final DeleteUserItemUseCase deleteUserItemUseCase;
  final PaymentUseCase paymentUseCase;
  final ReloadItemUseCase reloadUseCase;
  final FetchUserItemsUseCase fetchUserItemsUseCase;
  final UpdateUserItemUseCase updateUserItemUseCase;
  final CalculateTotalBalanceUseCase calculateTotalBalanceUseCase;

  UserItemsBloc({
    required this.addUserItemUseCase,
    required this.deleteUserItemUseCase,
    required this.fetchUserItemsUseCase,
    required this.updateUserItemUseCase,
    required this.paymentUseCase,
    required this.reloadUseCase,
    required this.calculateTotalBalanceUseCase,
  }) : super(UserItemsInitial()) {
    on<UserItemsLoadRequested>(_onLoadUserItems);
    on<AddUserItemRequested>(_onAddUserItem);
    on<UpdateUserItemRequested>(_onUpdateUserItem);
    on<DeleteUserItemRequested>(_onDeleteUserItem);
    on<ReloadItemRequested>(_onReloadItem);
    on<PaymentRequested>(_onPayment);
  }

  Future<void> _onReloadItem(
    ReloadItemRequested event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await reloadUseCase.call(event.itemId, event.amount);
      add(UserItemsLoadRequested());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onPayment(
    PaymentRequested event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await paymentUseCase.call(event.itemId, event.amount, event.reedemAtId);  
      add(UserItemsLoadRequested());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onLoadUserItems(
    UserItemsLoadRequested event,
    Emitter<UserItemsState> emit,
  ) async {
    emit(UserItemsLoading());
    try {
      final items = await fetchUserItemsUseCase();
      final totalBalance = calculateTotalBalanceUseCase.call(items.values.toList());
      emit(UserItemsLoaded(items, totalBalance));
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onAddUserItem(
    AddUserItemRequested event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await addUserItemUseCase(event.item);
      add(UserItemsLoadRequested());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onUpdateUserItem(
    UpdateUserItemRequested event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await updateUserItemUseCase(event.item);
      add(UserItemsLoadRequested());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }

  Future<void> _onDeleteUserItem(
    DeleteUserItemRequested event,
    Emitter<UserItemsState> emit,
  ) async {
    try {
      emit(UserItemsLoading());
      await deleteUserItemUseCase(event.itemId);
      add(UserItemsLoadRequested());
    } catch (e) {
      emit(UserItemsError(e.toString()));
    }
  }
}
