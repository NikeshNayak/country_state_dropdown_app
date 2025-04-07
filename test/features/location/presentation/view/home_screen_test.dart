import 'package:bloc_test/bloc_test.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_countries_list/get_countries_list_bloc.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_states_list/get_states_list_bloc.dart';
import 'package:country_state_dropdown_app/features/location/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCountriesBloc extends MockBloc<GetCountriesListEvent, GetCountriesListState>
    implements GetCountriesListBloc {}

class MockStatesBloc extends MockBloc<GetStatesListEvent, GetStatesListState>
    implements GetStatesListBloc {}

void main() {
  late MockCountriesBloc countriesBloc;
  late MockStatesBloc statesBloc;

  setUp(() {
    countriesBloc = MockCountriesBloc();
    statesBloc = MockStatesBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<GetCountriesListBloc>.value(value: countriesBloc),
          BlocProvider<GetStatesListBloc>.value(value: statesBloc),
        ],
        child: const HomeScreen(),
      ),
    );
  }

  testWidgets('selects India from country dropdown and displays it', (WidgetTester tester) async {
    final countries = [
      CountriesModel(id: 1, value: 'India'),
      CountriesModel(id: 2, value: 'Germany'),
    ];

    // Emit the countries success state
    whenListen(
      countriesBloc,
      Stream<GetCountriesListState>.fromIterable([
        GetCountriesListSuccessState(response: countries),
      ]),
      initialState: GetCountriesListInitialState(),
    );

    // StatesBloc not relevant for this test, just keep it idle
    whenListen(
      statesBloc,
      Stream<GetStatesListState>.empty(),
      initialState: GetStatesListInitialState(),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Tap the dropdown icon (prefixed by Icons.flag)
    await tester.tap(find.byIcon(Icons.flag));
    await tester.pumpAndSettle();

    // Tap on the "India" dropdown item
    await tester.tap(find.text('India').last);
    await tester.pumpAndSettle();

    // After selection, "India" should now be shown in the dropdown as selected
    expect(find.text('India'), findsOneWidget);
  });

  testWidgets('selects India then selects Gujarat from respective dropdowns', (
    WidgetTester tester,
  ) async {
    final countries = [
      CountriesModel(id: 1, value: 'India'),
      CountriesModel(id: 2, value: 'Australia'),
    ];

    final statesForIndia = [
      StatesModel(id: 2, value: 'Gujarat'),
      StatesModel(id: 1, value: 'Maharashtra'),
    ];

    // Step 1: Emit countries list
    whenListen(
      countriesBloc,
      Stream<GetCountriesListState>.fromIterable([
        GetCountriesListSuccessState(response: countries),
      ]),
      initialState: GetCountriesListInitialState(),
    );

    // Step 2: Emit states after country selection
    whenListen(
      statesBloc,
      Stream<GetStatesListState>.fromIterable([
        GetStatesListSuccessState(response: statesForIndia),
      ]),
      initialState: GetStatesListInitialState(),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Select "India" from the country dropdown
    await tester.tap(find.byIcon(Icons.flag));
    await tester.pumpAndSettle();
    await tester.tap(find.text('India').last);
    await tester.pumpAndSettle();

    // Verify "India" is selected
    expect(find.text('India'), findsOneWidget);

    // Select "Maharashtra" from the state dropdown
    await tester.tap(find.byIcon(Icons.location_city));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Maharashtra').last);
    await tester.pumpAndSettle();

    // Verify "Maharashtra" is selected
    expect(find.text('Maharashtra'), findsOneWidget);
  });
}
