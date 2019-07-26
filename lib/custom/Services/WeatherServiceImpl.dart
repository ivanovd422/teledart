import '../API/Data/WeatherData.dart';
import '../API/WeatherApi/WeatherApi.dart';
import '../API/WeatherApi/WeatherApiImpl.dart';
import 'package:teledart/custom/Constants.dart';
import 'WeatherService.dart';

class WeatherServiceImpl extends WeatherService {
  WeatherServiceImpl() {
    weatherApi = WeatherApiImpl();
  }

  WeatherApi weatherApi;

  final mainApi = "api.openweathermap.org";
  final queryType = "/data/2.5/weather";

  final idKey = "id";
  final langKey = "lang";
  final unitsKey = "units";
  final tokenKey = "APPID";

  @override
  Future<WeatherData> getWeather() async {
    final uri = Uri.https(mainApi, queryType, geWeatherParameters());

    final weatherData = await weatherApi.getWeather(uri.toString());

    return weatherData;
  }

  Map<String, String> geWeatherParameters() {
    return {
      idKey: 524901.toString(),
      langKey: "ru",
      unitsKey: "metric",
      tokenKey: weatherToken,
    };
  }
}
