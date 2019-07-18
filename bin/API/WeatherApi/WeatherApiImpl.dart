

import 'dart:convert';

import 'package:teledart/teledart.dart';

import '../Data/WeatherData.dart';
import 'WeatherApi.dart';

class WeatherApiImpl extends WeatherApi {

  @override
  Future<WeatherData> getWeather(String link) async {

    final request = await HttpClient().getUrl(Uri.parse(link));
    final response = await request.close();
    WeatherData result;

    await for (var contents in response.transform(Utf8Decoder())) {
      print(contents);
      result = WeatherData.fromRawJson(contents);
      print(result.main.temp);
    }

    return result;
  }
}