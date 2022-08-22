import 'package:dio/dio.dart';


// http://api.weatherapi.com/v1/forecast.json?key=d99eec724f244b289be123209222208&q=London&days=1&aqi=no&alerts=no


class DioHelper{

 static late Dio dio ;

 static init(){
   dio=Dio(
     BaseOptions(
       baseUrl:'https://api.weatherapi.com/',
       receiveDataWhenStatusError: true,
     )
   );
 }
 static Future<Response> getData({
   required String url,
   required Map<String,dynamic> query,
 }) async {
   return await dio.get(url, queryParameters: query,);
 }

}