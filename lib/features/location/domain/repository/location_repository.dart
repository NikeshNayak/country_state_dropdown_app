import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';

abstract class LocationRepository {
  Future<DataState<List<CountriesModel>>> getCountriesList();

  Future<DataState<List<StatesModel>>> getStatesList({required int countryId});
}
