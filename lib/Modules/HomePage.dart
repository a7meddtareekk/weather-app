import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Combonant/Combonant.dart';
import 'package:weather_app/Cubits/WeatherCubit.dart';
import 'package:weather_app/Cubits/WeatherStates.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Modules/SearchScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            actions: [TextButton(onPressed: (){
              var text;
              //WeatherCubit.get(context).getCairoWeather(CityName: text);

              navigateTo(context, SearchScreen());}, child: Icon(Icons.search,color: Colors.white,))],
            title: Text('Weather App'),
          ),
          body: BlocBuilder<WeatherCubit,WeatherStates>(
            builder: (BuildContext context, state) {
              if (state is WeatherLoadingState){
                return Center(child: CircularProgressIndicator(),);
              }else if (state is WeatherGetWeatherSuccessState){
                var index;
                return buildWeatherHome(WeatherCubit.get(context).weatherModel!);
              }else if (state is WeatherGetWeatherErrorState){
                return Center(child: Text('Error'),);
              }else{
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],),
                );
              }
            },

          ),
        );
  }

  Widget buildWeatherHome(WeatherModel model){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${model.cityName}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'update:${model.date}',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.sunny,color: Colors.amber,size: 50,),
              Text('${model.temp}'),
              Column(
                children: [
                  Text('max:${model.maxTemp}'),
                  Text('min:${model.minTemp}'),
                ],
              )
            ],
          ),
          SizedBox(height: 15,),
          Text('${model.weatherStateName}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
