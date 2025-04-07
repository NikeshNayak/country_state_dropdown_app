import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_countries_list/get_countries_list_bloc.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_states_list/get_states_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/bloc_observer.dart';
import 'config/injection_container.dart';
import 'config/routes/app_router.dart';
import 'config/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetCountriesListBloc>(create: (context) => sl()),
        BlocProvider<GetStatesListBloc>(create: (context) => sl()),
      ],
      child: MaterialApp(
        title: 'Country State Dropdown App ',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}