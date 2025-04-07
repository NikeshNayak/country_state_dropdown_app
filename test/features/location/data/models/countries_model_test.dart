import 'package:flutter_test/flutter_test.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';

void main() {
  group('CountriesModel', () {
    test('fromJson creates correct object', () {
      final json = {'id': 13, 'value': 'Australia'};
      final model = CountriesModel.fromJson(json);

      expect(model.id, 13);
      expect(model.value, 'Australia');
    });

    test('toJson returns correct map', () {
      final model = CountriesModel(id: 13, value: 'Australia');
      final json = model.toJson();

      expect(json, {'id': 13, 'value': 'Australia'});
    });
  });
}
