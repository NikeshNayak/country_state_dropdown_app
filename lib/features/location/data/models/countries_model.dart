// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries_model.freezed.dart';
part 'countries_model.g.dart';

@freezed
abstract class CountriesModel with _$CountriesModel {
  const factory CountriesModel({required int id, required String value}) = _CountriesModel;

  factory CountriesModel.fromJson(Map<String, dynamic> json) => _$CountriesModelFromJson(json);
}
