// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
BrandModel _$BrandModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'store':
      return StoreModel.fromJson(json);
    case 'multiStoresBrand':
      return MultiStoresBrandModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'BrandModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$BrandModel {
  String get id;
  String get name;
  List<String> get aliases;
  String get imagePath;
  List<CategoryKey> get categoriesKeys;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BrandModelCopyWith<BrandModel> get copyWith =>
      _$BrandModelCopyWithImpl<BrandModel>(this as BrandModel, _$identity);

  /// Serializes this BrandModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BrandModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.aliases, aliases) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other.categoriesKeys, categoriesKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(aliases),
      imagePath,
      const DeepCollectionEquality().hash(categoriesKeys));

  @override
  String toString() {
    return 'BrandModel(id: $id, name: $name, aliases: $aliases, imagePath: $imagePath, categoriesKeys: $categoriesKeys)';
  }
}

/// @nodoc
abstract mixin class $BrandModelCopyWith<$Res> {
  factory $BrandModelCopyWith(
          BrandModel value, $Res Function(BrandModel) _then) =
      _$BrandModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> aliases,
      String imagePath,
      List<CategoryKey> categoriesKeys});
}

/// @nodoc
class _$BrandModelCopyWithImpl<$Res> implements $BrandModelCopyWith<$Res> {
  _$BrandModelCopyWithImpl(this._self, this._then);

  final BrandModel _self;
  final $Res Function(BrandModel) _then;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? aliases = null,
    Object? imagePath = null,
    Object? categoriesKeys = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      aliases: null == aliases
          ? _self.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      categoriesKeys: null == categoriesKeys
          ? _self.categoriesKeys
          : categoriesKeys // ignore: cast_nullable_to_non_nullable
              as List<CategoryKey>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class StoreModel extends BrandModel {
  const StoreModel(
      {required this.id,
      required this.name,
      required final List<String> aliases,
      required this.imagePath,
      required final List<CategoryKey> categoriesKeys,
      final String? $type})
      : _aliases = aliases,
        _categoriesKeys = categoriesKeys,
        $type = $type ?? 'store',
        super._();
  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _aliases;
  @override
  List<String> get aliases {
    if (_aliases is EqualUnmodifiableListView) return _aliases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aliases);
  }

  @override
  final String imagePath;
  final List<CategoryKey> _categoriesKeys;
  @override
  List<CategoryKey> get categoriesKeys {
    if (_categoriesKeys is EqualUnmodifiableListView) return _categoriesKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesKeys);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoreModelCopyWith<StoreModel> get copyWith =>
      _$StoreModelCopyWithImpl<StoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other._categoriesKeys, _categoriesKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_aliases),
      imagePath,
      const DeepCollectionEquality().hash(_categoriesKeys));

  @override
  String toString() {
    return 'BrandModel.store(id: $id, name: $name, aliases: $aliases, imagePath: $imagePath, categoriesKeys: $categoriesKeys)';
  }
}

/// @nodoc
abstract mixin class $StoreModelCopyWith<$Res>
    implements $BrandModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) _then) =
      _$StoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> aliases,
      String imagePath,
      List<CategoryKey> categoriesKeys});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res> implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._self, this._then);

  final StoreModel _self;
  final $Res Function(StoreModel) _then;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? aliases = null,
    Object? imagePath = null,
    Object? categoriesKeys = null,
  }) {
    return _then(StoreModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      aliases: null == aliases
          ? _self._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      categoriesKeys: null == categoriesKeys
          ? _self._categoriesKeys
          : categoriesKeys // ignore: cast_nullable_to_non_nullable
              as List<CategoryKey>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class MultiStoresBrandModel extends BrandModel {
  const MultiStoresBrandModel(
      {required this.id,
      required this.type,
      required this.name,
      required final List<String> aliases,
      required this.imagePath,
      required final List<CategoryKey> categoriesKeys,
      required final List<String> redeemableStoresIds,
      required this.hasCvv,
      final String? $type})
      : _aliases = aliases,
        _categoriesKeys = categoriesKeys,
        _redeemableStoresIds = redeemableStoresIds,
        $type = $type ?? 'multiStoresBrand',
        super._();
  factory MultiStoresBrandModel.fromJson(Map<String, dynamic> json) =>
      _$MultiStoresBrandModelFromJson(json);

  @override
  final String id;
  final BrandTypesEnum type;
  @override
  final String name;
  final List<String> _aliases;
  @override
  List<String> get aliases {
    if (_aliases is EqualUnmodifiableListView) return _aliases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aliases);
  }

  @override
  final String imagePath;
  final List<CategoryKey> _categoriesKeys;
  @override
  List<CategoryKey> get categoriesKeys {
    if (_categoriesKeys is EqualUnmodifiableListView) return _categoriesKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesKeys);
  }

  final List<String> _redeemableStoresIds;
  List<String> get redeemableStoresIds {
    if (_redeemableStoresIds is EqualUnmodifiableListView)
      return _redeemableStoresIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_redeemableStoresIds);
  }

  final bool hasCvv;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultiStoresBrandModelCopyWith<MultiStoresBrandModel> get copyWith =>
      _$MultiStoresBrandModelCopyWithImpl<MultiStoresBrandModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MultiStoresBrandModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultiStoresBrandModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality()
                .equals(other._categoriesKeys, _categoriesKeys) &&
            const DeepCollectionEquality()
                .equals(other._redeemableStoresIds, _redeemableStoresIds) &&
            (identical(other.hasCvv, hasCvv) || other.hasCvv == hasCvv));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      const DeepCollectionEquality().hash(_aliases),
      imagePath,
      const DeepCollectionEquality().hash(_categoriesKeys),
      const DeepCollectionEquality().hash(_redeemableStoresIds),
      hasCvv);

  @override
  String toString() {
    return 'BrandModel.multiStoresBrand(id: $id, type: $type, name: $name, aliases: $aliases, imagePath: $imagePath, categoriesKeys: $categoriesKeys, redeemableStoresIds: $redeemableStoresIds, hasCvv: $hasCvv)';
  }
}

/// @nodoc
abstract mixin class $MultiStoresBrandModelCopyWith<$Res>
    implements $BrandModelCopyWith<$Res> {
  factory $MultiStoresBrandModelCopyWith(MultiStoresBrandModel value,
          $Res Function(MultiStoresBrandModel) _then) =
      _$MultiStoresBrandModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      BrandTypesEnum type,
      String name,
      List<String> aliases,
      String imagePath,
      List<CategoryKey> categoriesKeys,
      List<String> redeemableStoresIds,
      bool hasCvv});
}

/// @nodoc
class _$MultiStoresBrandModelCopyWithImpl<$Res>
    implements $MultiStoresBrandModelCopyWith<$Res> {
  _$MultiStoresBrandModelCopyWithImpl(this._self, this._then);

  final MultiStoresBrandModel _self;
  final $Res Function(MultiStoresBrandModel) _then;

  /// Create a copy of BrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? aliases = null,
    Object? imagePath = null,
    Object? categoriesKeys = null,
    Object? redeemableStoresIds = null,
    Object? hasCvv = null,
  }) {
    return _then(MultiStoresBrandModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as BrandTypesEnum,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      aliases: null == aliases
          ? _self._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagePath: null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      categoriesKeys: null == categoriesKeys
          ? _self._categoriesKeys
          : categoriesKeys // ignore: cast_nullable_to_non_nullable
              as List<CategoryKey>,
      redeemableStoresIds: null == redeemableStoresIds
          ? _self._redeemableStoresIds
          : redeemableStoresIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasCvv: null == hasCvv
          ? _self.hasCvv
          : hasCvv // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
