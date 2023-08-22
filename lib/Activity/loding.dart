import 'package:flutter/material.dart';
import 'package:flutter_application_6/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // var temprature = 'Loading';

  String? city = 'Bhopal';
  var temp;
  var hum;
  var airSpeed;
  var des;
  var main;
  var icon;

  void startApp() async {
    Worker instance = Worker(city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    airSpeed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 0), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "airSpeed_value": airSpeed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city
      });
    });

    // setState(() {
    //   // temprature = instance.temp;
    // });

    // print(instance.airSpeed);
    // print(instance.description);
  }

  @override
  void initState() {
    // TODO: implement initState
    startApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context)?.settings.arguments as Map;
    city=search['searchText'];



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "img/logo.png",
              height: 180,
              width: 180,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Weather App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made By Shami",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
