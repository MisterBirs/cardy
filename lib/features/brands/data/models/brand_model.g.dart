// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'] as String,
      name: json['name'] as String,
      aliases:
          (json['aliases'] as List<dynamic>).map((e) => e as String).toList(),
      imagePath: json['imagePath'] as String,
      categoriesKeys: (json['categoriesKeys'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryKeyEnumMap, e))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'aliases': instance.aliases,
      'imagePath': instance.imagePath,
      'categoriesKeys':
          instance.categoriesKeys.map((e) => _$CategoryKeyEnumMap[e]!).toList(),
      'runtimeType': instance.$type,
    };

const _$CategoryKeyEnumMap = {
  CategoryKey.all: 'all',
  CategoryKey.vacation: 'vacation',
  CategoryKey.hotels: 'hotels',
  CategoryKey.zimmer: 'zimmer',
  CategoryKey.flights: 'flights',
  CategoryKey.food: 'food',
  CategoryKey.meat: 'meat',
  CategoryKey.hamburger: 'hamburger',
  CategoryKey.dairy: 'dairy',
  CategoryKey.pizza: 'pizza',
  CategoryKey.sweets: 'sweets',
  CategoryKey.iceCream: 'iceCream',
  CategoryKey.fish: 'fish',
  CategoryKey.cafe: 'cafe',
  CategoryKey.asin: 'asin',
  CategoryKey.entertainment: 'entertainment',
  CategoryKey.cinema: 'cinema',
  CategoryKey.escapeRooms: 'escapeRooms',
  CategoryKey.theater: 'theater',
  CategoryKey.museum: 'museum',
  CategoryKey.shows: 'shows',
  CategoryKey.fitness: 'fitness',
  CategoryKey.gym: 'gym',
  CategoryKey.fitnessClothing: 'fitnessClothing',
  CategoryKey.fitnessEquipment: 'fitnessEquipment',
  CategoryKey.fashion: 'fashion',
  CategoryKey.mensFashion: 'mensFashion',
  CategoryKey.womensFashion: 'womensFashion',
  CategoryKey.kidsFashion: 'kidsFashion',
  CategoryKey.shoes: 'shoes',
  CategoryKey.jewelry: 'jewelry',
  CategoryKey.electronics: 'electronics',
  CategoryKey.supermarket: 'supermarket',
  CategoryKey.home: 'home',
  CategoryKey.babies: 'babies',
  CategoryKey.beauty: 'beauty',
};

MultiStoresBrandModel _$MultiStoresBrandModelFromJson(
        Map<String, dynamic> json) =>
    MultiStoresBrandModel(
      id: json['id'] as String,
      type: $enumDecode(_$BrandTypesEnumEnumMap, json['type']),
      name: json['name'] as String,
      aliases:
          (json['aliases'] as List<dynamic>).map((e) => e as String).toList(),
      imagePath: json['imagePath'] as String,
      categoriesKeys: (json['categoriesKeys'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryKeyEnumMap, e))
          .toList(),
      redeemableStoresIds: (json['redeemableStoresIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hasCvv: json['hasCvv'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MultiStoresBrandModelToJson(
        MultiStoresBrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$BrandTypesEnumEnumMap[instance.type]!,
      'name': instance.name,
      'aliases': instance.aliases,
      'imagePath': instance.imagePath,
      'categoriesKeys':
          instance.categoriesKeys.map((e) => _$CategoryKeyEnumMap[e]!).toList(),
      'redeemableStoresIds': instance.redeemableStoresIds,
      'hasCvv': instance.hasCvv,
      'runtimeType': instance.$type,
    };

const _$BrandTypesEnumEnumMap = {
  BrandTypesEnum.giftCard: 'giftCard',
  BrandTypesEnum.reloadableCard: 'reloadableCard',
  BrandTypesEnum.store: 'store',
};
