import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate : ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange : ${bloc.runtimeType}, change: $change');
    debugPrint("Current State: ${change.currentState}");
    debugPrint("Next State: ${change.nextState}");
    debugPrint(change.runtimeType.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
    debugPrint("Event: ${transition.event}");
    debugPrint("Current State: ${transition.currentState}");
    debugPrint("Next State: ${transition.nextState}");
    debugPrint(transition.runtimeType.toString());
    debugPrint('onTransition ${transition.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError : ${bloc.runtimeType}, error: $error');
    debugPrint("Error: ${error.runtimeType}");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose ${bloc.runtimeType}');
  }
}
