part of 'get_states_list_bloc.dart';

abstract class GetStatesListEvent extends Equatable {
  const GetStatesListEvent();

  @override
  List<Object?> get props => [];
}

class GetStatesListDataEvent extends GetStatesListEvent {
  final int countryId;

  const GetStatesListDataEvent({required this.countryId});
}
