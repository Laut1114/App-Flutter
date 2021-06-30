import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueAccent,
        title: Text("Caracteristicas"),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            alignment: Alignment.topCenter,
            child: Image.asset('assets/caract3.png'),
          ),
        ]),
      ),
    );
  }
}
