import 'package:flutter/material.dart';
import 'package:wallpepar_api/screens/DetailPage.dart';
import 'package:wallpepar_api/screens/Sscreen.dart';

import 'package:wallpepar_api/screens/cartPage.dart';
import 'package:wallpepar_api/screens/homeScreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    debugShowCheckedModeBanner: false,
    routes: {
      "Home_page" :(context){return HomeScreen();},
      "/" :(context){return SplashScreen();},
        // "detail_page" :(context){return DetailPage();},
      "cart_page" :(context){return CartScreen();}
    },
  ));
}

