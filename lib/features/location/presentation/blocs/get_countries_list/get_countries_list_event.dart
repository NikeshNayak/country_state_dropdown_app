part of 'get_countries_list_bloc.dart';

abstract class GetCountriesListEvent extends Equatable {
  const GetCountriesListEvent();

  @override
  List<Object?> get props => [];
}

class GetCountriesListDataEvent extends GetCountriesListEvent {
  const GetCountriesListDataEvent();
}

class FavouriteAmbrishDataEvent extends GetCountriesListEvent {
  final int personId;

  const FavouriteAmbrishDataEvent({required this.personId});
}
