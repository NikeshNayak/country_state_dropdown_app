import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StatesModel', () {
    test('fromJson creates correct object', () {
      final json = {'id': 9, 'value': 'Gujarat'};
      final model = StatesModel.fromJson(json);

      expect(model.id, 9);
      expect(model.value, 'Gujarat');
    });

    test('toJson returns correct map', () {
      final model = StatesModel(id: 9, value: 'Gujarat');
      final json = model.toJson();

      expect(json, {'id': 9, 'value': 'Gujarat'});
    });
  });
}
