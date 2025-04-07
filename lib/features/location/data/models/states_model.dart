// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'states_model.freezed.dart';
part 'states_model.g.dart';

@freezed
abstract class StatesModel with _$StatesModel {
  const factory StatesModel({required int id, required String value}) = _StatesModel;

  factory StatesModel.fromJson(Map<String, dynamic> json) => _$StatesModelFromJson(json);
}
