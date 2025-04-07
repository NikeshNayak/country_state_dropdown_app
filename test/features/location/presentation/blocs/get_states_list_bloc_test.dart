import 'package:bloc_test/bloc_test.dart';
import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_states_list/get_states_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/location_usecase_mocks.mocks.dart';

void main() {
  late GetStatesListBloc bloc;
  late MockLocationUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockLocationUseCase();
    bloc = GetStatesListBloc(mockUseCase);
  });

  final countriesList = [StatesModel(id: 9, value: "Gujarat")];

  group('GetStatesListBloc', () {
    blocTest<GetStatesListBloc, GetStatesListState>(
      'emits [Loading, Success] when useCase returns DataSuccess',
      build: () {
        when(
          mockUseCase.getStatesList(countryId: 8),
        ).thenAnswer((_) async => DataSuccess(countriesList));
        return bloc;
      },
      act: (bloc) => bloc.add(GetStatesListDataEvent(countryId: 8)),
      expect:
          () => [GetStatesListLoadingState(), GetStatesListSuccessState(response: countriesList)],
    );

    blocTest<GetStatesListBloc, GetStatesListState>(
      'emits [Loading, Failed] when useCase returns DataFailed',
      build: () {
        when(mockUseCase.getStatesList(countryId: 8)).thenAnswer((_) async => DataFailed([]));
        return bloc;
      },
      act: (bloc) => bloc.add(GetStatesListDataEvent(countryId: 8)),
      expect: () => [GetStatesListLoadingState(), GetStatesListFailedState(response: [])],
    );

    blocTest<GetStatesListBloc, GetStatesListState>(
      'emits [Loading, Exception] when useCase returns DataDioException',
      build: () {
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/'),
          type: DioExceptionType.unknown,
        );

        when(
          mockUseCase.getStatesList(countryId: 8),
        ).thenAnswer((_) async => DataDioException(dioException));
        return bloc;
      },
      act: (bloc) => bloc.add(GetStatesListDataEvent(countryId: 8)),
      expect:
          () => [
            GetStatesListLoadingState(),
            GetStatesListExceptionState(
              DioException(
                requestOptions: RequestOptions(path: '/'),
                type: DioExceptionType.unknown,
              ),
            ),
          ],
    );
  });
}
