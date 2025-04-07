// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountriesModel {

  int get id;

  String get value;

  /// Create a copy of CountriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountriesModelCopyWith<CountriesModel> get copyWith =>
      _$CountriesModelCopyWithImpl<CountriesModel>(this as CountriesModel, _$identity);

  /// Serializes this CountriesModel to a JSON map.
  Map<String, dynamic> toJson();


  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is CountriesModel &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, value);

  @override
  String toString() {
    return 'CountriesModel(id: $id, value: $value)';
  }


}

/// @nodoc
abstract mixin class $CountriesModelCopyWith<$Res> {
  factory $CountriesModelCopyWith(CountriesModel value,
      $Res Function(CountriesModel) _then) = _$CountriesModelCopyWithImpl;

  @useResult
  $Res call({
    int id, String value
  });


}

/// @nodoc
class _$CountriesModelCopyWithImpl<$Res>
    implements $CountriesModelCopyWith<$Res> {
  _$CountriesModelCopyWithImpl(this._self, this._then);

  final CountriesModel _self;
  final $Res Function(CountriesModel) _then;

  /// Create a copy of CountriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? value = null,}) {
    return _then(_self.copyWith(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as int, value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
    as String,
    ));
  }

}


/// @nodoc
@JsonSerializable()
class _CountriesModel implements CountriesModel {
  const _CountriesModel({required this.id, required this.value});

  factory _CountriesModel.fromJson(Map<String, dynamic> json) => _$CountriesModelFromJson(json);

  @override final int id;
  @override final String value;

  /// Create a copy of CountriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountriesModelCopyWith<_CountriesModel> get copyWith =>
      __$CountriesModelCopyWithImpl<_CountriesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountriesModelToJson(this,);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CountriesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, value);

  @override
  String toString() {
    return 'CountriesModel(id: $id, value: $value)';
  }


}

/// @nodoc
abstract mixin class _$CountriesModelCopyWith<$Res> implements $CountriesModelCopyWith<$Res> {
  factory _$CountriesModelCopyWith(_CountriesModel value,
      $Res Function(_CountriesModel) _then) = __$CountriesModelCopyWithImpl;

  @override
  @useResult
  $Res call({
    int id, String value
  });


}

/// @nodoc
class __$CountriesModelCopyWithImpl<$Res>
    implements _$CountriesModelCopyWith<$Res> {
  __$CountriesModelCopyWithImpl(this._self, this._then);

  final _CountriesModel _self;
  final $Res Function(_CountriesModel) _then;

  /// Create a copy of CountriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? id = null, Object? value = null,}) {
    return _then(_CountriesModel(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as int, value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
    as String,
    ));
  }


}

// dart format on
