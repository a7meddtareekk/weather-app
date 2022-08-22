import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Combonant/Combonant.dart';
import 'package:weather_app/Cubits/WeatherCubit.dart';
import 'package:weather_app/Cubits/WeatherStates.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class SearchScreen extends StatelessWidget {
  var textController=TextEditingController();
  String? cityName;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context,state){},
      builder: (context,state){

        return Scaffold(
          appBar: defaultAppBar(context: context,title: 'Search a City'),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                defaultFormField(
                  controller: textController,
                  onSubmit: (data){
                    cityName=data;
                    //WeatherCubit.get(context).getCairoWeather(CityName: cityName!);

                  },
                  type: TextInputType.text,
                  lable:'Enter City Name' ,
                  Suffix: Icons.search,
                  SuffixPressed: ()  {
                    WeatherCubit.get(context).getCairoWeather(CityName: textController.text);
                   if(textController.text!=null){
                     return Navigator.pop(context);
                   }else{print('Error');}
                    },)
              ],
            ),
          ),
        );},


    );
  }
}
