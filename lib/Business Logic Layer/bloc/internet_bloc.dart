import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(internetState: 'Internet Connected'));
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState(internetState: 'Internet Not Connected'));
      }
    });
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.wifi ||event ==  ConnectivityResult.mobile){
        add(ConnectedEvent());

      }else{
        add(NotConnectedEvent());
      }
    });

  }
  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
