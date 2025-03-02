// import 'package:cardy/entities/categories/category_entity.dart';
// import 'package:cardy/entities/payment_methods/brand_entity.dart';
// import 'package:cardy/entities/payment_methods/store_entity.dart';
// import 'package:cardy/entities/payment_methods/payment_method_type.dart';

// class SingleStoreBrandEntity extends BrandEntity {

//   //#region Attributes
//   final String _id;
//   final PaymentMethodType _type;
//   final StoreEntity _store;
//   final bool _hasBalance;
//   final bool _hasCvv;
//   final bool _hasDescription;
//   //#endregion

//   //#region Constructor
//   const SingleStoreBrandEntity({
//     required String id,
//     required PaymentMethodType type,
//     required StoreEntity store,
//     required bool hasBalance,
//     required bool hasCvv,
//     required bool hasDescription,
//   })  : _id = id,
//         _type = type,
//         _store = store,
//         _hasBalance = hasBalance,
//         _hasCvv = hasCvv,
//         _hasDescription = hasDescription;
//   //#endregion

//   //#region Getters
//   @override
//   String get id => _id;

//   StoreEntity get store => _store;

//   @override
//   String get name => _store.name;

//   @override
//   String get imagePath => _store.imagePath;

//   @override
//   List<String> get aliases => _store.aliases;

//   @override
//   List<CategoryEntity> get categories => _store.categories;

//   @override
//   bool get hasMultiStores => false;

//   @override
//   bool get hasBalance => _hasBalance;

//   @override
//   bool get hasCvv => _hasCvv;

//   @override
//   bool get hasDescription => _hasDescription;

//   @override
//   PaymentMethodType get type => _type;
//   //#endregion

// }
