part of 'get_countries_list_bloc.dart';

abstract class GetCountriesListState extends Equatable {
  final List<CountriesModel>? response;
  final DioException? exception;

  const GetCountriesListState({this.response, this.exception});

  @override
  List<Object> get props => [];
}

class GetCountriesListInitialState extends GetCountriesListState {}

class GetCountriesListLoadingState extends GetCountriesListState {}

class GetCountriesListSuccessState extends GetCountriesListState {
  const GetCountriesListSuccessState({super.response});
}

class GetCountriesListFailedState extends GetCountriesListState {
  const GetCountriesListFailedState({super.response});
}

class GetCountriesListExceptionState extends GetCountriesListState {
  const GetCountriesListExceptionState(DioException exception) : super(exception: exception);
}
