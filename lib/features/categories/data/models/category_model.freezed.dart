// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {
  CategoryKey get key;
  String get name;
  bool get isPrimary;
  List<String>? get allies;
  List<CategoriesRelationshipModel>? get subCategories;
  List<CategoryKey>? get parents;
  String? get imagePath;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      _$CategoryModelCopyWithImpl<CategoryModel>(
          this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryModel &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            const DeepCollectionEquality().equals(other.allies, allies) &&
            const DeepCollectionEquality()
                .equals(other.subCategories, subCategories) &&
            const DeepCollectionEquality().equals(other.parents, parents) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      isPrimary,
      const DeepCollectionEquality().hash(allies),
      const DeepCollectionEquality().hash(subCategories),
      const DeepCollectionEquality().hash(parents),
      imagePath);

  @override
  String toString() {
    return 'CategoryModel(key: $key, name: $name, isPrimary: $isPrimary, allies: $allies, subCategories: $subCategories, parents: $parents, imagePath: $imagePath)';
  }
}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) _then) =
      _$CategoryModelCopyWithImpl;
  @useResult
  $Res call(
      {CategoryKey key,
      String name,
      bool isPrimary,
      List<String>? allies,
      List<CategoriesRelationshipModel>? subCategories,
      List<CategoryKey>? parents,
      String? imagePath});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? isPrimary = null,
    Object? allies = freezed,
    Object? subCategories = freezed,
    Object? parents = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as CategoryKey,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      allies: freezed == allies
          ? _self.allies
          : allies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subCategories: freezed == subCategories
          ? _self.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesRelationshipModel>?,
      parents: freezed == parents
          ? _self.parents
          : parents // ignore: cast_nullable_to_non_nullable
              as List<CategoryKey>?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryModel implements CategoryModel {
  const _CategoryModel(
      {required this.key,
      required this.name,
      required this.isPrimary,
      final List<String>? allies,
      final List<CategoriesRelationshipModel>? subCategories,
      final List<CategoryKey>? parents,
      this.imagePath})
      : _allies = allies,
        _subCategories = subCategories,
        _parents = parents;
  factory _CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  final CategoryKey key;
  @override
  final String name;
  @override
  final bool isPrimary;
  final List<String>? _allies;
  @override
  List<String>? get allies {
    final value = _allies;
    if (value == null) return null;
    if (_allies is EqualUnmodifiableListView) return _allies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CategoriesRelationshipModel>? _subCategories;
  @override
  List<CategoriesRelationshipModel>? get subCategories {
    final value = _subCategories;
    if (value == null) return null;
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CategoryKey>? _parents;
  @override
  List<CategoryKey>? get parents {
    final value = _parents;
    if (value == null) return null;
    if (_parents is EqualUnmodifiableListView) return _parents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? imagePath;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryModel &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            const DeepCollectionEquality().equals(other._allies, _allies) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories) &&
            const DeepCollectionEquality().equals(other._parents, _parents) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      isPrimary,
      const DeepCollectionEquality().hash(_allies),
      const DeepCollectionEquality().hash(_subCategories),
      const DeepCollectionEquality().hash(_parents),
      imagePath);

  @override
  String toString() {
    return 'CategoryModel(key: $key, name: $name, isPrimary: $isPrimary, allies: $allies, subCategories: $subCategories, parents: $parents, imagePath: $imagePath)';
  }
}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
          _CategoryModel value, $Res Function(_CategoryModel) _then) =
      __$CategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CategoryKey key,
      String name,
      bool isPrimary,
      List<String>? allies,
      List<CategoriesRelationshipModel>? subCategories,
      List<CategoryKey>? parents,
      String? imagePath});
}

/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? isPrimary = null,
    Object? allies = freezed,
    Object? subCategories = freezed,
    Object? parents = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_CategoryModel(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as CategoryKey,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      allies: freezed == allies
          ? _self._allies
          : allies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subCategories: freezed == subCategories
          ? _self._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesRelationshipModel>?,
      parents: freezed == parents
          ? _self._parents
          : parents // ignore: cast_nullable_to_non_nullable
              as List<CategoryKey>?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
