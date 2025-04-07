import 'package:country_state_dropdown_app/features/location/data/data_sources/remote/location_remote_api_service.dart';
import 'package:country_state_dropdown_app/features/location/data/repository/location_repository_impl.dart';
import 'package:country_state_dropdown_app/features/location/domain/repository/location_repository.dart';
import 'package:country_state_dropdown_app/features/location/domain/usecases/location_usecase.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_countries_list/get_countries_list_bloc.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_states_list/get_states_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  Dio dio = Dio();
  sl.registerSingleton<Dio>(dio);

  //Dependencies
  sl.registerSingleton<LocationRemoteApiService>(LocationRemoteApiService(sl()));

  //Repositories
  sl.registerSingleton<LocationRepository>(LocationRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<LocationUseCase>(LocationUseCase(sl()));

  //BLoCs
  sl.registerFactory(() => GetCountriesListBloc(sl()));
  sl.registerFactory(() => GetStatesListBloc(sl()));
}
