abstract class WeatherStates{}
class WeatherInitialState extends WeatherStates{}
class WeatherGetWeatherSuccessState extends WeatherStates{}
class WeatherGetWeatherErrorState extends WeatherStates{
 final String error;
 WeatherGetWeatherErrorState(this.error);
}
class WeatherLoadingState extends WeatherStates{}
class WeatherGetWeatherAlexandriaSuccessState extends WeatherStates{}
class WeatherGetWeatherAlexandriaErrorState extends WeatherStates{}
class WeatherGetWeatherAlexandriaLoadingState extends WeatherStates{}
class WeatherGetWeatherLondonSuccessState extends WeatherStates{}
class WeatherGetWeatherLondonErrorState extends WeatherStates{}
class WeatherGetWeatherLondonLoadingState extends WeatherStates{}
