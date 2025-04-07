import 'package:country_state_dropdown_app/config/routes/routes.dart';
import 'package:country_state_dropdown_app/features/location/data/models/countries_model.dart';
import 'package:country_state_dropdown_app/features/location/data/models/states_model.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_countries_list/get_countries_list_bloc.dart';
import 'package:country_state_dropdown_app/features/location/presentation/blocs/get_states_list/get_states_list_bloc.dart';
import 'package:country_state_dropdown_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInit = true;
  final _locationFormKey = GlobalKey<FormState>();
  List<CountriesModel> countriesList = [];
  CountriesModel? countryModel;
  List<StatesModel> statesList = [];
  StatesModel? stateModel;

  void _submitFunc() {
    if (!(_locationFormKey.currentState?.validate() ?? false)) {
      return;
    }
    Navigator.of(context).pushNamed(
      Routes.viewLocationScreen,
      arguments: {'countryName': countryModel?.value ?? '', 'stateName': stateModel?.value ?? ''},
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      BlocProvider.of<GetCountriesListBloc>(context).add(GetCountriesListDataEvent());
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Country State Dropdown')),
          body: Form(
            key: _locationFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildCountryDropDownWidget(),
                  SizedBox(height: 15),
                  _buildStateDropDownWidget(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitFunc,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      fixedSize: Size(120, 40),
                    ),
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStateDropDownWidget() {
    return BlocConsumer<GetStatesListBloc, GetStatesListState>(
      listener: (context, state) {
        if (state is GetStatesListSuccessState) {
          statesList = state.response ?? [];
        } else if (state is GetStatesListFailedState) {
          showSnackMessage(
            context: context,
            title: 'Error',
            text: 'Failed to fetch states list',
            icon: Icons.error,
          );
        } else if (state is GetStatesListExceptionState) {
          showSnackMessage(
            context: context,
            title: 'Error',
            text: 'Something went wrong !!',
            icon: Icons.error,
          );
        }
      },
      builder: (context, state) {
        return state is GetStatesListLoadingState
            ? Center(child: CircularProgressIndicator())
            : DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'State',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items:
                  statesList.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e.value));
                  }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Required Field !';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  stateModel = value;
                });
              },
            );
      },
    );
  }

  Widget _buildCountryDropDownWidget() {
    return BlocConsumer<GetCountriesListBloc, GetCountriesListState>(
      listener: (context, state) {
        if (state is GetCountriesListSuccessState) {
          countriesList = state.response ?? [];
        } else if (state is GetCountriesListFailedState) {
          showSnackMessage(
            context: context,
            title: 'Error',
            text: 'Failed to fetch countries list',
            icon: Icons.error,
          );
        } else if (state is GetCountriesListExceptionState) {
          showSnackMessage(
            context: context,
            title: 'Error',
            text: 'Something went wrong !!',
            icon: Icons.error,
          );
        }
      },
      builder: (context, state) {
        return state is GetCountriesListLoadingState
            ? Center(child: CircularProgressIndicator())
            : DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Country',
                prefixIcon: Icon(Icons.flag),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items:
                  countriesList.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e.value));
                  }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Required Field !';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  countryModel = value;
                  stateModel = null;
                });
                BlocProvider.of<GetStatesListBloc>(
                  context,
                ).add(GetStatesListDataEvent(countryId: value?.id ?? 0));
              },
            );
      },
    );
  }
}
