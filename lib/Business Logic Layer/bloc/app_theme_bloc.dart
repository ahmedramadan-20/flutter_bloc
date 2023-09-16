

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learningbloc/Helpers/constants.dart';
import 'package:meta/meta.dart';

part 'app_theme_event.dart';

part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial()) {
    on<AppThemeEvent>((event, emit) {
      if (event is InitialEvent) {
        if(sharedPreferences!= null){
          if(sharedPreferences!.getString('theme') == 'l'){
            emit(AppLightThemeState(appTheme: 'l'));
          }else{
            emit(AppDarkThemeState(appTheme: 'd'));

          }
        }

      } else if (event is LightThemeEvent) {
        sharedPreferences!.setString('theme', 'l');
        emit(AppLightThemeState(appTheme: 'l'));
      } else if (event is DarkThemeEvent) {
        sharedPreferences!.setString('theme', 'd');
        emit(AppDarkThemeState(appTheme: 'd'));
      }
    });
  }
}
