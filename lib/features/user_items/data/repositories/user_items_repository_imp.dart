import 'package:cardy/features/brands/data/models/brand_model.dart';
import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:cardy/features/history_records/data/models/history_record_model.dart';
import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:cardy/features/user_items/data/data_sources/user_items_data_source.dart';
import 'package:cardy/features/user_items/data/models/user_item_model.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/domain/user_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserItemsRepositoryImp extends UserItemsRepository {
  UserItemsDataSource userItemsDataSource;
  BrandsRepository brandsRepo; 

  UserItemsRepositoryImp({
    required this.userItemsDataSource,
    required this.brandsRepo,
  });

  @override
  Future<void> addUserItem(UserItemEntity item) {
    final model = UserItemModel.fromEntity(item);
    return userItemsDataSource.addUserItem(model);
  }

  @override
  Future<void> deleteUserItem(String itemId) {
    return userItemsDataSource.deleteUserItem(itemId);
  }

  @override
  Future<Map<String, UserItemEntity>> fetchUserItems() async {
    final userItemsModelsMap = await userItemsDataSource.fetchUserItems();

    final itemBrandsIds = userItemsModelsMap.values
        .map((userItemModel) => userItemModel.brandId)
        .toSet()
        .toList();

    final itemBrandsEntitesMap =
        await brandsRepo.getBrandByIds(itemBrandsIds);

    return Map.fromEntries(userItemsModelsMap.entries.map((entry) {
      final userItemModel = entry.value;
      //Convert the brand model to entity
      BrandEntity? brandEntity = itemBrandsEntitesMap[userItemModel.brandId];
    
      if (brandEntity == null) {
        throw Exception(
            'Brand[id:${userItemModel.brandId}] not found for user item: ${userItemModel.id}');
      }

    
      //Convert the history records models to entities
      final historyRecordsEntities = _convertToHistoryRecordsEntities(
          userItemModel.history, itemBrandsEntitesMap);
    
      //Convert the user item model to entity
      final userItemEntity = UserItemEntity(
        id: userItemModel.id,
        brand: brandEntity,
        initialBalance: userItemModel.initialBalance,
        balance: userItemModel.balance,
        cvv: userItemModel.cvv,
        history: historyRecordsEntities,
        paymentMethod: userItemModel.paymentMethod,
        code: userItemModel.code,
        expirationDate: userItemModel.expirationDate,
        notes: userItemModel.notes,
        description: userItemModel.description,
      );
    
      return MapEntry(userItemModel.id, userItemEntity);
    }));
  }

  @override
  Future<void> updateUserItem(UserItemEntity item) {
    final model = UserItemModel.fromEntity(item);
    return userItemsDataSource.updateUserItem(model);
  }

  List<HistoryRecordEntity> _convertToHistoryRecordsEntities(
      List<HistoryRecordModel> historyRecordsModels,
      Map<String, BrandEntity> brandsEntitesMap) {
    return historyRecordsModels.map((recordModel) {
      switch (recordModel) {
        case AddHistoryRecordModel():
          return AddHistoryRecordEntity();
        case EditHistoryRecordModel():
          return EditHistoryRecordEntity();
        case ExpiredHistoryRecordModel():
          return ExpiredHistoryRecordEntity(expiredAt: recordModel.expiredAt);
        case PaymentHistoryRecordModel():
          BrandEntity? brandModel = brandsEntitesMap[recordModel.redeemedAtId];
          if (brandModel == null || brandModel is! StoreModel) {
            throw Exception('Brand[id:${recordModel.redeemedAtId}] not found.');
          }
          final storeEntity = StoreEntity(
              id: brandModel.id,
              name: brandModel.name,
              imagePath: brandModel.imagePath,
              aliases: brandModel.aliases,
              categoriesKeys: brandModel.categoriesKeys);

          return PaymentHistoryRecordEntity(
              paymentAmount: recordModel.paymentAmount,
              redeemedAt: storeEntity);
        case ReloadHistoryRecordModel():
          return ReloadHistoryRecordEntity(
              reloadedAmount: recordModel.reloadedAmount);
        case RemoveHistoryRecordModel():
          return RemoveHistoryRecordEntity();
        case UsedUpHistoryRecordModel():
          return UsedUpHistoryRecordEntity();
      }
    }).toList();
  }
}
