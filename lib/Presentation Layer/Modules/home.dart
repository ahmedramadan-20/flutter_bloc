import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business Logic Layer/bloc/internet_bloc.dart';

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
        child: BlocBuilder<InternetBloc, InternetState>(
  builder: (context, state) {
    if(state is ConnectedState){
      internet = state.internetState;
      return Center(child: Text(internet),);
    }else if(state is NotConnectedState){
      internet = state.internetState;
      return Center(child: Text(internet),);
    }
    return Center(child: Text(internet),);
  },
),
      ),
    );
  }
}
