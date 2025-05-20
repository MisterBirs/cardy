// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      key: $enumDecode(_$CategoryKeyEnumMap, json['key']),
      name: json['name'] as String,
      isPrimary: json['isPrimary'] as bool,
      allies:
          (json['allies'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) =>
              CategoriesRelationshipModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      parents: (json['parents'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CategoryKeyEnumMap, e))
          .toList(),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'key': _$CategoryKeyEnumMap[instance.key]!,
      'name': instance.name,
      'isPrimary': instance.isPrimary,
      'allies': instance.allies,
      'subCategories': instance.subCategories,
      'parents':
          instance.parents?.map((e) => _$CategoryKeyEnumMap[e]!).toList(),
      'imagePath': instance.imagePath,
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
