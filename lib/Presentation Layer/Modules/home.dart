import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/Business%20Logic%20Layer/cubit/theme_cubit.dart';
import 'package:learningbloc/Data%20Layer/Models/Enums/theme_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String internet = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AppThemeCubit>(context).changeTheme(ThemeState.dark);

                },
                child: Text(
                  'Dark Theme',
                  // style: TextStyle(color: Colors.white),
                ),
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.blue,
                //   foregroundColor: Colors.redAccent,
                // ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AppThemeCubit>(context).changeTheme(ThemeState.light);

                },
                child: Text(
                  'Light Theme',
                  // style: TextStyle(color: Colors.white),
                ),
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.blue,
                //   foregroundColor: Colors.redAccent,
                // ),
              ),
            ],
          )),
    );
  }
}
