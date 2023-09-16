import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? subscription;
  InternetCubit() : super(InternetInitial());

checkConnectivity(){
  subscription = Connectivity().onConnectivityChanged.listen((event) {
    if(event == ConnectivityResult.wifi||event == ConnectivityResult.mobile){
      emit(ConnectedState(internetState: 'Internet Connected'));
    }else{
      emit(NotConnectedState(internetState: 'Internet Not Connected'));

    }
  });

}
@override
  Future<void> close() {
  subscription!.cancel();
    return super.close();
  }

}
