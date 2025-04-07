part of 'get_states_list_bloc.dart';

abstract class GetStatesListState extends Equatable {
  final List<StatesModel>? response;
  final DioException? exception;

  const GetStatesListState({this.response, this.exception});

  @override
  List<Object> get props => [];
}

class GetStatesListInitialState extends GetStatesListState {}

class GetStatesListLoadingState extends GetStatesListState {}

class GetStatesListSuccessState extends GetStatesListState {
  const GetStatesListSuccessState({super.response});
}

class GetStatesListFailedState extends GetStatesListState {
  const GetStatesListFailedState({super.response});
}

class GetStatesListExceptionState extends GetStatesListState {
  const GetStatesListExceptionState(DioException exception) : super(exception: exception);
}
