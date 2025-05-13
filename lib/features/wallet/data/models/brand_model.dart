import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';

abstract class BrandModel {
  String get id;

  String get name;

  List<String> get aliases;

  String get imagePath;

  List<String> get categoriesIds;

  bool get hasMultiStores;

  bool get hasCvv;

  BrandTypesEnum get type;
}
