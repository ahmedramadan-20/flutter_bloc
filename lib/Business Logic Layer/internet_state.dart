part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}
class ConnectedState extends InternetState {
  final String internetState;

  ConnectedState({required this.internetState});
}
class NotConnectedState extends InternetState {
  final String internetState;

  NotConnectedState({required this.internetState});
}
