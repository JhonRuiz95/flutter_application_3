import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/raiz.dart';
import 'package:flutter_application_3/screens/registro_screen.dart';
import 'package:flutter_application_3/screens/reset_screen.dart';
import 'package:flutter_application_3/utils/responsive.dart';
import 'package:flutter_application_3/widgets/circle.dart';
import 'package:flutter_application_3/widgets/icon_container.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    const double ancho = 70;
    const double alto = 5.5;

    final publicacionField = TextFormField(
      //?autofocus: false,
      //controller: publicacionController,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Por favor ingrese su correo');
        }
      },
      onSaved: (value) {
        //publicacionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.add_comment),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Agregar publicacion.",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Por favor ingrese su correo');
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Por favor, ingrese un correo v??lido");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Requiero una contrase??a");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese una contrase??a v??lida, min. 6 caracteres");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_clock_outlined),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          sigIn(emailController.text, passwordController.text);
        },
        child: const Text(
          "Log In",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: responsive.width,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -pinkSize * 0.5,
                  right: -pinkSize * 0.3,
                  child: Circle(
                    size: pinkSize,
                    colors: const [
                      Colors.pink,
                      Colors.pinkAccent,
                      //Colors.yellow,
                    ],
                  ),
                ),
                Positioned(
                  left: -orangeSize * 0.1,
                  top: -orangeSize * 0.6,
                  child: Circle(
                    size: orangeSize,
                    colors: const [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                      //Colors.yellow,
                    ],
                  ),
                ),
                Positioned(
                  top: pinkSize * 0.25,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        //tama??o del icono avatar
                        size: responsive.wp(30),
                      ),
                      SizedBox(
                        height: responsive.hp(5),
                      ),
                       SizedBox(
                         width: responsive.wp(ancho),
                         height: responsive.hp(alto),
                         child: emailField,
                       ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      SizedBox(
                        width: responsive.wp(ancho),
                        height: responsive.hp(alto),
                        child: passwordField,
                      ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      SizedBox(
                        width: responsive.wp(40),
                        height: responsive.hp(7),
                        child: loginButton,
                      ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '??No tienes cuenta? Reg??strese ',
                            style: TextStyle(fontSize: responsive.dp(1.5)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => registro_screen()));
                            },
                            child: Text(
                              'aqu??',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: responsive.dp(1.7)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text(
                              "??Olvid?? su contrase??a?",
                              style: TextStyle(fontSize: responsive.dp(1.7)),
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => reset_screen())),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sigIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: "Inicio Exitoso");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => raiz()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "Usuario o contrase??a incorrectos", gravity: ToastGravity.TOP);
    }
  }
}
