

part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeState {}

class AppThemeInitial extends AppThemeState {}


class AppLightThemeState extends AppThemeState {
  final String? appTheme;

  AppLightThemeState({this.appTheme});
}
class AppDarkThemeState extends AppThemeState {
  final String? appTheme;

  AppDarkThemeState({this.appTheme});
}

