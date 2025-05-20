// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_relationship_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesRelationshipModel {
  CategoryKey get childKey;
  String? get showName;

  /// Create a copy of CategoriesRelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesRelationshipModelCopyWith<CategoriesRelationshipModel>
      get copyWith => _$CategoriesRelationshipModelCopyWithImpl<
              CategoriesRelationshipModel>(
          this as CategoriesRelationshipModel, _$identity);

  /// Serializes this CategoriesRelationshipModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesRelationshipModel &&
            (identical(other.childKey, childKey) ||
                other.childKey == childKey) &&
            (identical(other.showName, showName) ||
                other.showName == showName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, childKey, showName);

  @override
  String toString() {
    return 'CategoriesRelationshipModel(childKey: $childKey, showName: $showName)';
  }
}

/// @nodoc
abstract mixin class $CategoriesRelationshipModelCopyWith<$Res> {
  factory $CategoriesRelationshipModelCopyWith(
          CategoriesRelationshipModel value,
          $Res Function(CategoriesRelationshipModel) _then) =
      _$CategoriesRelationshipModelCopyWithImpl;
  @useResult
  $Res call({CategoryKey childKey, String? showName});
}

/// @nodoc
class _$CategoriesRelationshipModelCopyWithImpl<$Res>
    implements $CategoriesRelationshipModelCopyWith<$Res> {
  _$CategoriesRelationshipModelCopyWithImpl(this._self, this._then);

  final CategoriesRelationshipModel _self;
  final $Res Function(CategoriesRelationshipModel) _then;

  /// Create a copy of CategoriesRelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? childKey = null,
    Object? showName = freezed,
  }) {
    return _then(_self.copyWith(
      childKey: null == childKey
          ? _self.childKey
          : childKey // ignore: cast_nullable_to_non_nullable
              as CategoryKey,
      showName: freezed == showName
          ? _self.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CategoriesRelationshipModel implements CategoriesRelationshipModel {
  const _CategoriesRelationshipModel({required this.childKey, this.showName});
  factory _CategoriesRelationshipModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesRelationshipModelFromJson(json);

  @override
  final CategoryKey childKey;
  @override
  final String? showName;

  /// Create a copy of CategoriesRelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoriesRelationshipModelCopyWith<_CategoriesRelationshipModel>
      get copyWith => __$CategoriesRelationshipModelCopyWithImpl<
          _CategoriesRelationshipModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoriesRelationshipModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesRelationshipModel &&
            (identical(other.childKey, childKey) ||
                other.childKey == childKey) &&
            (identical(other.showName, showName) ||
                other.showName == showName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, childKey, showName);

  @override
  String toString() {
    return 'CategoriesRelationshipModel(childKey: $childKey, showName: $showName)';
  }
}

/// @nodoc
abstract mixin class _$CategoriesRelationshipModelCopyWith<$Res>
    implements $CategoriesRelationshipModelCopyWith<$Res> {
  factory _$CategoriesRelationshipModelCopyWith(
          _CategoriesRelationshipModel value,
          $Res Function(_CategoriesRelationshipModel) _then) =
      __$CategoriesRelationshipModelCopyWithImpl;
  @override
  @useResult
  $Res call({CategoryKey childKey, String? showName});
}

/// @nodoc
class __$CategoriesRelationshipModelCopyWithImpl<$Res>
    implements _$CategoriesRelationshipModelCopyWith<$Res> {
  __$CategoriesRelationshipModelCopyWithImpl(this._self, this._then);

  final _CategoriesRelationshipModel _self;
  final $Res Function(_CategoriesRelationshipModel) _then;

  /// Create a copy of CategoriesRelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? childKey = null,
    Object? showName = freezed,
  }) {
    return _then(_CategoriesRelationshipModel(
      childKey: null == childKey
          ? _self.childKey
          : childKey // ignore: cast_nullable_to_non_nullable
              as CategoryKey,
      showName: freezed == showName
          ? _self.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
