import 'dart:io';

import 'package:country_state_dropdown_app/core/resources/data_state.dart';
import 'package:country_state_dropdown_app/features/location/data/data_sources/remote/location_remote_api_service.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/features/location/domain/repository/location_repository.dart';
import 'package:dio/dio.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationRemoteApiService _apiService;

  LocationRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<CountriesModel>>> getCountriesList() async {
    try {
      final httpResponse = await _apiService.getCountriesList();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.isNotEmpty) {
          return DataSuccess(httpResponse.data);
        } else {
          return DataFailed(httpResponse.data);
        }
      } else {
        return DataDioException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (err) {
      return DataDioException(err);
    }
  }

  @override
  Future<DataState<List<StatesModel>>> getStatesList({required int countryId}) async {
    try {
      final httpResponse = await _apiService.getStatesList(countryId: countryId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.isNotEmpty) {
          return DataSuccess(httpResponse.data);
        } else {
          return DataFailed(httpResponse.data);
        }
      } else {
        return DataDioException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (err) {
      return DataDioException(err);
    }
  }
}
