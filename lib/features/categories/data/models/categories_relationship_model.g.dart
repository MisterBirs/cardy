// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_relationship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesRelationshipModel _$CategoriesRelationshipModelFromJson(
        Map<String, dynamic> json) =>
    _CategoriesRelationshipModel(
      childKey: $enumDecode(_$CategoryKeyEnumMap, json['childKey']),
      showName: json['showName'] as String?,
    );

Map<String, dynamic> _$CategoriesRelationshipModelToJson(
        _CategoriesRelationshipModel instance) =>
    <String, dynamic>{
      'childKey': _$CategoryKeyEnumMap[instance.childKey]!,
      'showName': instance.showName,
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
