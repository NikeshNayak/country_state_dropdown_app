import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/features/location/domain/usecases/location_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/location_repository_mocks.mocks.dart';

void main() {
  late MockLocationRepository mockRepo;
  late LocationUseCase useCase;

  setUp(() {
    mockRepo = MockLocationRepository();
    useCase = LocationUseCase(mockRepo);
  });

  test('should return countries list from repository', () async {
    final mockData = [CountriesModel(id: 1, value: "Australia")];
    when(mockRepo.getCountriesList()).thenAnswer((_) async => DataSuccess(mockData));

    final result = await useCase.getCountriesList();

    expect(result, isA<DataSuccess<List<CountriesModel>>>());
    expect((result as DataSuccess).data, mockData);
    verify(mockRepo.getCountriesList()).called(1);
  });

  test('should return states list from repository', () async {
    final mockData = [StatesModel(id: 9, value: "Gujarat")];
    when(mockRepo.getStatesList(countryId: 8)).thenAnswer((_) async => DataSuccess(mockData));

    final result = await useCase.getStatesList(countryId: 8);

    expect(result, isA<DataSuccess<List<StatesModel>>>());
    expect((result as DataSuccess).data, mockData);
    verify(mockRepo.getStatesList(countryId: 8)).called(1);
  });
}
