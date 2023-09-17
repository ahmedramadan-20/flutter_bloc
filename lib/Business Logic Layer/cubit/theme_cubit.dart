import 'package:bloc/bloc.dart';
import 'package:learningbloc/Helpers/constants.dart';
import 'package:meta/meta.dart';

import '../../Data Layer/Models/Enums/theme_state.dart';

part 'theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(ThemeInitial());

changeTheme(ThemeState state){
  switch (state){
    case ThemeState.initial:
      if(sharedPreferences!.getString('theme') != null){
        if(sharedPreferences!.getString('theme') == 'l'){
          emit(LightTheme());
        }else {
          emit(DarkTheme());
        }
      }
      break;
    case ThemeState.light:
      sharedPreferences!.setString('theme', 'l');
      emit(LightTheme());
      break;

    case ThemeState.dark:
      sharedPreferences!.setString('theme', 'd');

      emit(DarkTheme());
      break;

  }
}
}
