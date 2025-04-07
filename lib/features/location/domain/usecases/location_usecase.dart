import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/features/location/domain/repository/location_repository.dart';

class LocationUseCase {
  final LocationRepository _locationRepository;

  LocationUseCase(this._locationRepository);

  Future<DataState<List<CountriesModel>>> getCountriesList() {
    return _locationRepository.getCountriesList();
  }

  Future<DataState<List<StatesModel>>> getStatesList({required int countryId}) {
    return _locationRepository.getStatesList(countryId: countryId);
  }
}
