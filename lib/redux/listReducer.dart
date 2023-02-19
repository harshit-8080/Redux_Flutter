import './listAction.dart';
import '../models/AppState.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is Add) {
    // newState.l1 = action;
  }

  return newState;
}
