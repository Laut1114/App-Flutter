import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget buttonSection = CircleAvatar(
      radius: 30,
      backgroundColor: Colors.blueAccent,
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/pantalla2');
        },
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueAccent,
        title: Text("Caracteristicas"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/caract1.png',
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: buttonSection,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}