import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class WeatherData {

  WeatherData({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });


  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory WeatherData.fromRawJson(String str) =>
      WeatherData.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        coord: Coord.fromJson(json["coord"] as Map<String, dynamic>),
        weather: List<Weather>.from(json["weather"]
                .map((x) => Weather.fromJson(x as Map<String, dynamic>))
            as Iterable),
        base: json["base"] as String,
        main: Main.fromJson(json["main"] as Map<String, dynamic>),
        visibility: json["visibility"] as int,
        wind: Wind.fromJson(json["wind"] as Map<String, dynamic>),
        clouds: Clouds.fromJson(json["clouds"] as Map<String, dynamic>),
        dt: json["dt"] as int,
        sys: Sys.fromJson(json["sys"] as Map<String, dynamic>),
        timezone: json["timezone"] as int,
        id: json["id"] as int,
        name: json["name"] as String,
        cod: json["cod"] as int,
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  int all;

  Clouds({
    this.all,
  });

  factory Clouds.fromRawJson(String str) =>
      Clouds.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] as int,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  double lon;
  double lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromRawJson(String str) =>
      Coord.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble() as double,
        lat: json["lat"].toDouble() as double,
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  String temp;
  String pressure;
  String humidity;
  String tempMin;
  String tempMax;

  Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
  });

  factory Main.fromRawJson(String str) =>
      Main.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toString(),
        pressure: json["pressure"].toString(),
        humidity: json["humidity"].toString(),
        tempMin: json["temp_min"].toString(),
        tempMax: json["temp_max"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "pressure": pressure,
        "humidity": humidity,
        "temp_min": tempMin,
        "temp_max": tempMax,
      };
}

class Sys {
  int type;
  int id;
  double message;
  String country;
  int sunrise;
  int sunset;

  Sys({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromRawJson(String str) =>
      Sys.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"] as int,
        id: json["id"] as int,
        message: json["message"].toDouble() as double,
        country: json["country"] as String,
        sunrise: json["sunrise"] as int,
        sunset: json["sunset"] as int,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "message": message,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromRawJson(String str) =>
      Weather.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] as int,
        main: json["main"] as String,
        description: json["description"] as String,
        icon: json["icon"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  String speed;
  String deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromRawJson(String str) =>
      Wind.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toString(),
        deg: json["deg"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
