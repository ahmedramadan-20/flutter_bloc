import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/Data%20Layer/Models/Enums/theme_state.dart';
import 'package:learningbloc/Helpers/constants.dart';
import 'package:learningbloc/Presentation%20Layer/Modules/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Business Logic Layer/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit()..changeTheme(ThemeState.initial),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          if(state is LightTheme){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(
                useMaterial3: true,
              ),
              home: Home(),
            );
          }else  if(state is DarkTheme){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(
                useMaterial3: true,
              ),
              home: Home(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: Home(),
          );
        },
      ),
    );
  }
}
