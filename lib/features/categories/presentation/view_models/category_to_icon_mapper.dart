import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryToIconMapper {
  final IconData defaultIcon = Icons.circle;

  //#region Singleton instance
  static final CategoryToIconMapper _instance =
      CategoryToIconMapper._internal();

  factory CategoryToIconMapper() {
    return _instance;
  }

  CategoryToIconMapper._internal();
  //#endregion

  IconData getIcon(
      {required CategoryKey categoryKey, CategoryEntity? categoryParent}) {
    if (_isRelationshipIconValid(categoryKey, categoryParent)) {
      return _relationshipIconMap[categoryParent!.key]![categoryKey]!;
    }

    return _categoryIconMap[categoryKey] ?? defaultIcon;
  }

  final Map<CategoryKey, IconData> _categoryIconMap = {
    CategoryKey.all: Icons.category,
    CategoryKey.vacation: Icons.beach_access,
    CategoryKey.hotels: FontAwesomeIcons.hotel,
    CategoryKey.zimmer: FontAwesomeIcons.house,
    CategoryKey.flights: FontAwesomeIcons.plane,
    CategoryKey.food: Icons.restaurant,
    CategoryKey.meat: FontAwesomeIcons.drumstickBite,
    CategoryKey.hamburger: FontAwesomeIcons.burger,
    CategoryKey.dairy: FontAwesomeIcons.cheese,
    CategoryKey.pizza: FontAwesomeIcons.pizzaSlice,
    CategoryKey.sweets: FontAwesomeIcons.candyCane,
    CategoryKey.iceCream: FontAwesomeIcons.iceCream,
    CategoryKey.fish: FontAwesomeIcons.fish,
    CategoryKey.cafe: FontAwesomeIcons.mugSaucer,
    CategoryKey.asin: FontAwesomeIcons.utensils,
    CategoryKey.entertainment: Icons.movie,
    CategoryKey.cinema: FontAwesomeIcons.film,
    CategoryKey.escapeRooms: FontAwesomeIcons.doorClosed,
    CategoryKey.theater: FontAwesomeIcons.masksTheater,
    CategoryKey.museum: FontAwesomeIcons.buildingColumns,
    CategoryKey.shows: FontAwesomeIcons.microphone,
    CategoryKey.fitness: Icons.fitness_center,
    CategoryKey.gym: FontAwesomeIcons.dumbbell,
    CategoryKey.fitnessClothing: FontAwesomeIcons.shirt,
    CategoryKey.fitnessEquipment: FontAwesomeIcons.personBiking,
    CategoryKey.fashion: Icons.shopping_bag,
    CategoryKey.mensFashion: FontAwesomeIcons.person,
    CategoryKey.womensFashion: FontAwesomeIcons.personDress,
    CategoryKey.kidsFashion: FontAwesomeIcons.child,
    CategoryKey.shoes: FontAwesomeIcons.shoePrints,
    CategoryKey.jewelry: FontAwesomeIcons.gem,
    CategoryKey.electronics: Icons.electrical_services,
    CategoryKey.supermarket: Icons.shopping_cart,
    CategoryKey.home: Icons.home,
    CategoryKey.babies: FontAwesomeIcons.baby,
    CategoryKey.beauty: FontAwesomeIcons.spa,
  };

  final Map<CategoryKey, Map<CategoryKey, IconData>> _relationshipIconMap = {
    CategoryKey.fitness: {
      CategoryKey.fitnessClothing: FontAwesomeIcons.shirt,
    },
  };

  bool _isRelationshipIconValid(
      CategoryKey categoryKey, CategoryEntity? categoryParent) {
    return categoryParent != null &&
        _relationshipIconMap[categoryParent.key] != null &&
        _relationshipIconMap[categoryParent.key]![categoryKey] != null;
  }
}
