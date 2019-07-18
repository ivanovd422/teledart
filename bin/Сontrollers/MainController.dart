import 'dart:ffi';
import 'dart:io';

import '../API/Data/UpdateData.dart';
import '../API/Data/WeatherData.dart';
import '../Services/TelegramService.dart';
import '../Services/TelegramServiceImpl.dart';
import '../Services/WeatherService.dart';
import '../Services/WeatherServiceImpl.dart';
import '../Utils/TelegramResponseParser.dart';

class MainController {

  TelegramService telegramService;
  WeatherService weatherService;
  TelegramResponseParser responseParser;

  MainController() {
    telegramService = TelegramServiceImpl();
    weatherService = WeatherServiceImpl();
    responseParser = TelegramResponseParser();
  }

  var isWeatherLoading = false;

  void main() {

    startLoop();
  }

  void startLoop() async  {
    const isRunning = true;
    const Duration sleepDelay = Duration(seconds: 5);
    WeatherData weatherData;
    GetUpdateData updateData;

    while (isRunning) {

      if (!isWeatherLoading) {
        print("Зашли в условие isWeatherLoading");
        isWeatherLoading = true;
        updateData = await telegramService.getUpdates();

        if (responseParser.isShouldAnswer(updateData)) {
          print(updateData.result);
          weatherData = await weatherService.getWeather();
          var temp = weatherData.main.temp;
          await sendMessage("В Москве сейчас - $temp");
        }


        isWeatherLoading = false;
      }

      sleep(sleepDelay);
    }

  }



  Future<WeatherData> getWeatherData() async {
    var weather = await weatherService.getWeather();
    return weather;
  }

  Future<GetUpdateData> getUpdateData() async {
    var updateData = await telegramService.getUpdates();
    return updateData;
  }

  Future<Void> sendMessage(String text) async {
    await telegramService.sendMessage(text);
  }

}