class WeatherModel {
  String date;
  String weatherStateName;
  String cityName;
  double temp;
  double maxTemp;
  double minTemp;

  WeatherModel(
      {required this.date,
      required this.weatherStateName,
      required this.temp,
      required this.cityName,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      cityName: data['location']['name'],
        date: data['location']['localtime'],
        weatherStateName: jsonData['condition']['text'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }
}
