

import 'package:flutter/material.dart';
import 'package:flutter_application_6/Activity/home.dart';
import 'package:flutter_application_6/Activity/loding.dart';
import 'package:flutter_application_6/Activity/location.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    routes: {
      "/" :(context) => Loading(),
      "/home":(context) => Home(),
      "/loding":(context) => Loading(),
    },

  ));
}


