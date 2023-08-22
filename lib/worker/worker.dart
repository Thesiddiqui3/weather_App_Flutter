// class-- different method

// instance-- deffrent data

import 'dart:convert';

import 'package:http/http.dart';

class Worker {
  var locatoin;

  // constructor for getting location
  Worker(this.locatoin) {
    locatoin = this.locatoin;
  }

  var temp;
  var humidity;
  var airSpeed;
  var description;
  var main;
  var icon;

  // method

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$locatoin&appid=299163e4a2fb4bfc7c3ac056f08f27b7"));
      Map data = jsonDecode(response.body);

      // getting disc
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      // etting temp, Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      String getTemp = (temp_data['temp'] - 273.15).toString();

      // getting wind
      Map wind = data['wind'];
      String getAir_speed = (wind['speed'] / 0.27777777777778).toString();

      // icon

      // print(icon);

      // Assigning values

      temp = getTemp; //c
      humidity = getHumidity; //%
      airSpeed = getAir_speed; //km/h
      description = getDesc; //string
      main = getMain_des; //string
      icon = weather_main_data['icon'].toString();
    } catch (e) {
      temp = "Data Not Found";
      humidity = "Data Not Found";
      airSpeed = "Data Not Found";
      description = "Data Not Found";
      main = "Data Not Found";
      icon = '03n';
    }
  }
}
