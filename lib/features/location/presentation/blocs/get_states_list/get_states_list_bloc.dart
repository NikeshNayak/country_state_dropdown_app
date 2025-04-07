import 'package:bloc/bloc.dart';
import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/features/location/domain/usecases/location_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_states_list_event.dart';
part 'get_states_list_state.dart';

class GetStatesListBloc extends Bloc<GetStatesListEvent, GetStatesListState> {
  final LocationUseCase _locationUseCase;

  GetStatesListBloc(this._locationUseCase) : super(GetStatesListInitialState()) {
    on<GetStatesListDataEvent>(_getStatesListDataEvent);
  }

  void _getStatesListDataEvent(
    GetStatesListDataEvent event,
    Emitter<GetStatesListState> emit,
  ) async {
    emit(GetStatesListLoadingState());

    final dataState = await _locationUseCase.getStatesList(countryId: event.countryId);

    if (dataState is DataSuccess && (dataState.data?.isNotEmpty ?? false)) {
      emit(GetStatesListSuccessState(response: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(GetStatesListFailedState(response: dataState.data!));
    }

    if (dataState is DataDioException) {
      emit(GetStatesListExceptionState(dataState.exception!));
    }
  }
}
