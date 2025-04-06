import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  Dio dio = Dio();
  sl.registerSingleton<Dio>(dio);
}
