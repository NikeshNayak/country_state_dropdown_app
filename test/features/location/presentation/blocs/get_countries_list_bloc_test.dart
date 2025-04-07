import 'package:bloc_test/bloc_test.dart';
import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_countries_list/get_countries_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/location_usecase_mocks.mocks.dart';

void main() {
  late GetCountriesListBloc bloc;
  late MockLocationUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockLocationUseCase();
    bloc = GetCountriesListBloc(mockUseCase);
  });

  final countriesList = [CountriesModel(id: 1, value: "Australia")];

  group('GetCountriesListBloc', () {
    blocTest<GetCountriesListBloc, GetCountriesListState>(
      'emits [Loading, Success] when useCase returns DataSuccess',
      build: () {
        when(mockUseCase.getCountriesList())
            .thenAnswer((_) async => DataSuccess(countriesList));
        return bloc;
      },
      act: (bloc) => bloc.add(GetCountriesListDataEvent()),
      expect: () => [
        GetCountriesListLoadingState(),
        GetCountriesListSuccessState(response: countriesList),
      ],
    );

    blocTest<GetCountriesListBloc, GetCountriesListState>(
      'emits [Loading, Failed] when useCase returns DataFailed',
      build: () {
        when(mockUseCase.getCountriesList())
            .thenAnswer((_) async => DataFailed([]));
        return bloc;
      },
      act: (bloc) => bloc.add(GetCountriesListDataEvent()),
      expect: () => [
        GetCountriesListLoadingState(),
        GetCountriesListFailedState(response: []),
      ],
    );

    blocTest<GetCountriesListBloc, GetCountriesListState>(
      'emits [Loading, Exception] when useCase returns DataDioException',
      build: () {
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/'),
          type: DioExceptionType.unknown,
        );

        when(mockUseCase.getCountriesList())
            .thenAnswer((_) async => DataDioException(dioException));
        return bloc;
      },
      act: (bloc) => bloc.add(GetCountriesListDataEvent()),
      expect: () => [
        GetCountriesListLoadingState(),
        GetCountriesListExceptionState(DioException(
          requestOptions: RequestOptions(path: '/'),
          type: DioExceptionType.unknown,
        )),
      ],
    );
  });
}
