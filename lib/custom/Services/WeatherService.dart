

import '../API/Data/WeatherData.dart';

abstract class WeatherService {
  Future<WeatherData> getWeather();
}