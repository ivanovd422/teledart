

import '../Data/WeatherData.dart';

abstract class WeatherApi {
  Future<WeatherData> getWeather(String link);
}

