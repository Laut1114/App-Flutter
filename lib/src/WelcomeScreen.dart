import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {

  final Widget textSection = Container(
    padding: const EdgeInsets.only(left: 26, right: 26),
    child: RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Esta es un aplicación hecha en ",
            style: TextStyle(color: Colors.black45, fontSize: 16, height: 2)),
        TextSpan(
            text: "Flutter.\n",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18)),
        TextSpan(
            text: "Flutter ",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18)),
        TextSpan(
            text:
                "es el kit de herramientas de UI de Google para realizar hermosas aplicaciones, compiladas nativamente, para móvil, web y escritorio desde una única base de código.\n ",
            style: TextStyle(color: Colors.black45, fontSize: 16)),
      ]),
    ),
  );

  final Widget backgroundSection = Container(
    alignment: Alignment.center,
    child: Image.asset(
      'assets/7948.jpg',
    ),
  );

  final Widget urlDocumentacion = Container(
    margin: EdgeInsets.only(top: 18.0),
    alignment: Alignment.center,
    child: new RichText(
      text: TextSpan(
        children: [
          TextSpan(style: TextStyle(color: Colors.black), text: 'Ir a la ', ),
          TextSpan(
            style: new TextStyle(
                color: Colors.blue, decoration: TextDecoration.underline),
            text: 'Documentación Oficial',
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final url = 'https://esflutter.dev/docs';
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceSafariVC: false,
                  );
                }
              },
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white10,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white10,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40.0),
            Column(
              children: <Widget>[
                Text(
                  "Bienvenid@ a Mi App.",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 28,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.40,
                  ),
                )
              ],
            ),
            textSection,
            backgroundSection,
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  elevation: 5.0,
                  fixedSize: Size(200, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Conocer Más"),
              ),
            ),
            urlDocumentacion
          ],
        ),
      ),
    );
  }
}
