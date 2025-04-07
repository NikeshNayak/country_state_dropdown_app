import 'package:country_state_dropdown_app/config/api_endpoints.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'location_remote_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LocationRemoteApiService {
  factory LocationRemoteApiService(Dio dio) = _LocationRemoteApiService;

  @GET(APIEndPoints.countries)
  Future<HttpResponse<List<CountriesModel>>> getCountriesList({
    @Header('X-API-Key') String apiKey = xAPIKey,
  });

  @GET(APIEndPoints.states)
  Future<HttpResponse<List<StatesModel>>> getStatesList({
    @Header('X-API-Key') String apiKey = xAPIKey,
    @Path('countryid') required int countryId,
  });
}
