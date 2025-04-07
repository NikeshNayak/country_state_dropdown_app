// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'states_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatesModel {

  int get id;

  String get value;

  /// Create a copy of StatesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatesModelCopyWith<StatesModel> get copyWith =>
      _$StatesModelCopyWithImpl<StatesModel>(this as StatesModel, _$identity);

  /// Serializes this StatesModel to a JSON map.
  Map<String, dynamic> toJson();


  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is StatesModel &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, value);

  @override
  String toString() {
    return 'StatesModel(id: $id, value: $value)';
  }


}

/// @nodoc
abstract mixin class $StatesModelCopyWith<$Res> {
  factory $StatesModelCopyWith(StatesModel value,
      $Res Function(StatesModel) _then) = _$StatesModelCopyWithImpl;

  @useResult
  $Res call({
    int id, String value
  });


}

/// @nodoc
class _$StatesModelCopyWithImpl<$Res>
    implements $StatesModelCopyWith<$Res> {
  _$StatesModelCopyWithImpl(this._self, this._then);

  final StatesModel _self;
  final $Res Function(StatesModel) _then;

  /// Create a copy of StatesModel
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
class _StatesModel implements StatesModel {
  const _StatesModel({required this.id, required this.value});

  factory _StatesModel.fromJson(Map<String, dynamic> json) => _$StatesModelFromJson(json);

  @override final int id;
  @override final String value;

  /// Create a copy of StatesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatesModelCopyWith<_StatesModel> get copyWith =>
      __$StatesModelCopyWithImpl<_StatesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatesModelToJson(this,);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _StatesModel &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, value);

  @override
  String toString() {
    return 'StatesModel(id: $id, value: $value)';
  }


}

/// @nodoc
abstract mixin class _$StatesModelCopyWith<$Res> implements $StatesModelCopyWith<$Res> {
  factory _$StatesModelCopyWith(_StatesModel value,
      $Res Function(_StatesModel) _then) = __$StatesModelCopyWithImpl;

  @override
  @useResult
  $Res call({
    int id, String value
  });


}

/// @nodoc
class __$StatesModelCopyWithImpl<$Res>
    implements _$StatesModelCopyWith<$Res> {
  __$StatesModelCopyWithImpl(this._self, this._then);

  final _StatesModel _self;
  final $Res Function(_StatesModel) _then;

  /// Create a copy of StatesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? id = null, Object? value = null,}) {
    return _then(_StatesModel(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as int, value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
    as String,
    ));
  }


}

// dart format on
