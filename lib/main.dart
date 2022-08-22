import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/WeatherCubit.dart';
import 'package:weather_app/Modules/HomePage.dart';

import 'Modules/SearchScreen.dart';
import 'Shared/DioHelper.dart';

void main() {
  runApp( MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {

  String? text;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>WeatherCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: HomePage(),

      ),
    );
  }
}


