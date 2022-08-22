import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/WeatherStates.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Shared/DioHelper.dart';


// http://api.weatherapi.com/v1/forecast.json?key=d99eec724f244b289be123209222208&q=London&days=1&aqi=no&alerts=no

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit():super(WeatherInitialState());

  static WeatherCubit get(context)=>BlocProvider.of(context);

  Map<String,dynamic>? WeatherCairoList;
  List<WeatherModel>modeel=[];
  WeatherModel? weatherModel;
  void getCairoWeather({required String CityName}) {
    emit(WeatherLoadingState());
    DioHelper.getData(url: 'v1/forecast.json', query: {
      'key': 'd99eec724f244b289be123209222208',
      'q': '${CityName}',
      'days': '1',
      'aqi': 'no',
      'alerts': 'no',
    }).then((value) {
       WeatherCairoList= value.data;

       weatherModel=WeatherModel.fromJson(WeatherCairoList);
      emit(WeatherGetWeatherSuccessState());

    })
        .catchError((onError){
      emit(WeatherGetWeatherErrorState(onError.toString()));
      print(onError.toString());

    });
  }




}