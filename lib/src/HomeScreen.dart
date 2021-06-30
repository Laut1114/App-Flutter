import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatelessWidget {

  final String mensaje;

  const HomeScreen({Key? key, required this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: "Flutter ",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 21)
          ),
          TextSpan(
              text: "es un framework de código abierto desarrollado por Google y publicado a finales de 2018.\n"
                  "Este kit de desarrollo ofrece un gran número de bibliotecas para elementos estándar de la interfaz de usuario de Android y iOS, "
                  "pero también sirve para desarrollar aplicaciones web.\nLas aplicaciones con ",
              style: TextStyle(color: Colors.black45, fontSize: 20)
          ),
          TextSpan(
              text: "Flutter ",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 21)
          ),
          TextSpan(
              text: "tienen el aspecto normal de las aplicaciones en cada sistema y se comportan como \nse espera de ellas, sin que los programadores tengan que prestar atención a las particularidades de cada sistema.",
              style: TextStyle(color: Colors.black45, fontSize: 20)
          ),
        ]),
      ),
    );

    Widget buttonSection = CircleAvatar(
      radius: 30,
      backgroundColor: Colors.blueAccent,
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/pantalla1');
        },
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 28, bottom: 28),
              alignment: Alignment.center,
              child: Text(
                mensaje,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Image.asset(
                'assets/flutter.png',
                height: 240,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 20),
            textSection,
            SizedBox(height: 60),
            buttonSection,
            SizedBox(height: 40),
          ],
        ),// Children
      ),
    );
  }
}