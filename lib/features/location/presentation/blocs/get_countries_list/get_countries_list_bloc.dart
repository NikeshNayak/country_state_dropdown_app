import 'package:bloc/bloc.dart';
import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/domain/usecases/location_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_countries_list_event.dart';
part 'get_countries_list_state.dart';

class GetCountriesListBloc extends Bloc<GetCountriesListEvent, GetCountriesListState> {
  final LocationUseCase _locationUseCase;

  GetCountriesListBloc(this._locationUseCase) : super(GetCountriesListInitialState()) {
    on<GetCountriesListDataEvent>(_getCountriesListDataEvent);
  }

  void _getCountriesListDataEvent(
    GetCountriesListDataEvent event,
    Emitter<GetCountriesListState> emit,
  ) async {
    emit(GetCountriesListLoadingState());

    final dataState = await _locationUseCase.getCountriesList();

    if (dataState is DataSuccess && (dataState.data?.isNotEmpty ?? false)) {
      emit(GetCountriesListSuccessState(response: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(GetCountriesListFailedState(response: dataState.data!));
    }

    if (dataState is DataDioException) {
      emit(GetCountriesListExceptionState(dataState.exception!));
    }
  }
}
