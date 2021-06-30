import 'package:flutter/material.dart';
import 'package:meet_flutter/src/Screen1.dart';
import 'package:meet_flutter/src/Screen2.dart';
import 'package:meet_flutter/src/Screen3.dart';
import 'package:meet_flutter/src/WelcomeScreen.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';

class MeetFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light(), //tema claro
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      initialRoute: '/welcome',
      routes: {
        '/welcome' : (context) => WelcomeScreen(),
        '/login' : (context) => LoginScreen(),
        '/inicio' : (context) => HomeScreen(mensaje: ''),
        '/pantalla1' : (context) => Screen1(),
        '/pantalla2' : (context) => Screen2(),
        '/pantalla3' : (context) => Screen3(),
      },
    );
  }
}