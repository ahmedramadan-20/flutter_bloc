import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business Logic Layer/bloc/app_theme_bloc.dart';

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
                  BlocProvider.of<AppThemeBloc>(context).add(DarkThemeEvent());
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
                  BlocProvider.of<AppThemeBloc>(context).add(LightThemeEvent());
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
