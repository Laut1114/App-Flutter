import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomeScreen.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _key = GlobalKey();

  RegExp emailRegExp =
      new RegExp(r'^\w+[\w-.]*@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');

  late String _correo;
  late String _contrasenia;
  late String mensaje;

  late String _nombre = _correo.substring(0, 12);

  bool _logueado = false;

  Widget urlDocumentacion = Container(
    margin: EdgeInsets.only(top: 12.0),
    alignment: Alignment.bottomCenter,
    child: new RichText(
      text: TextSpan(
        children: [
          TextSpan(style: TextStyle(color: Colors.black), text: 'Ir a la '),
          TextSpan(
            style: TextStyle(
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
    return Scaffold(
      body: SafeArea(
        child: _logueado ? HomeScreen(mensaje: mensaje) : loginForm(),
      ),
    );
  }

  Widget loginForm() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white10,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ListView(
      children: <Widget>[
        // Logo FLutter
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 170,
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: FlutterLogo(size: 150),
            )
          ],
        ),

        // Texto: Inicio de Sesión
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Inicio de Sesión",
                style: TextStyle(
                  color: Color(0xff313333),
                  fontSize: 24,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),

        SizedBox(height: 30),

        // Formulario Login
        Container(
          width: 300.0,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                //INPUT DE CORREO ----------------------------------------------
                TextFormField(
                  validator: (text) {
                    if (text?.length == 0) {
                      return "Este campo es requerido";
                    } else if (!emailRegExp.hasMatch(text!)) {
                      return "El formato no es el esperado";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 2.5),
                      ),
                      hintText: 'Ingrese su Correo',
                      labelText: 'Correo',
                      counterText: '',
                      icon: Icon(
                        Icons.email_outlined,
                        size: 32.0,
                        color: Colors.blueAccent,
                      )),
                  onSaved: (text) => _correo = text!,
                ),

                SizedBox(height: 20),

                //INPUT DE CONTRASEÑA ------------------------------------------
                TextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Ingrese la contraseña';
                    } else if (text.length <= 8) {
                      return 'Su contraseña debe ser mayor a 8 caracteres';
                    } else if (!contRegExp.hasMatch(text)) {
                      return 'El formato no es el correcto';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 12,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red, width: 2.5),
                      ),
                      hintText: "Ingrese la contraseña",
                      labelText: "Contraseña",
                      counterText: "",
                      icon: Icon(
                        Icons.vpn_key_outlined,
                        size: 32,
                        color: Colors.blueAccent,
                      )),
                  onSaved: (text) => _contrasenia = text!,
                ),

                SizedBox(height: 45),

                //BUTTON Iniciar Sesion -----------------------------------------
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    elevation: 5.0,
                    fixedSize: Size(200, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();

                      void _login() {
                        setState(() {
                          _logueado = true;
                        });
                      }

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return  Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                          );
                        },
                      );
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context); //pop dialog
                        _login();
                      });

                      mensaje = 'Hola $_nombre';
                    }
                  },
                  child: Text('Ingresar'),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 200,
          child: urlDocumentacion,
        ),
      ],
    );
  }
}
