import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/widgets.dart';
import 'package:flutter_application_3/utils/responsive.dart';
import 'package:flutter_application_3/widgets/circle.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:icon/icon.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//FirebaseAuth _auth = FirebaseAuth.instance;

class comentario extends StatelessWidget {
  final String title = 'Comentario';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _comentarioController = TextEditingController();
  late final bool _success = false;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = new Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    final size = MediaQuery.of(context).size;

    Row userResult = Row(
      children: [
        Container(
          //alignment: Alignment.bottomLeft,
          height: responsive.hp(7),
          //color: Colors.amber,
          width: responsive.wp(16), //size.width * .125,
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/img/pru1.jpeg'),
          ),
        ),
        SizedBox(
          width: responsive.wp(1),
        ),
        SizedBox(
          width: responsive.wp(66.4),
          child: Text(
            "Ricardo Andres Carvajal Arenas",
            style: TextStyle(
              fontSize: responsive.wp(5),
              //backgroundColor: Colors.amber,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
          iconSize: responsive.dp(3),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Busquedas"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Expanded(
                  //flex: 2,
                  child: SizedBox(
                    child: ListView(
                      children: [
                        Wrap(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          direction: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: responsive.dp(1),
                                  horizontal: responsive.dp(1)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        height: responsive.hp(7),
                                        //color: Colors.amber,
                                        width: responsive
                                            .wp(16), //size.width * .125,
                                        child: const CircleAvatar(
                                          radius: 60,
                                          backgroundImage: AssetImage(
                                              'assets/img/pru1.jpeg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: responsive.hp(7),
                                    width: responsive.wp(78),
                                    //color: Colors.grey.shade300, //parte de perfil
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontSize: responsive.dp(2.2)),
                                      controller: _comentarioController,
                                      //maxLines: 3,
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey.shade300,
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            left: 15.0, top: 30),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                responsive.dp(15))),
                                        hintText: 'Buscar personas...',
                                        hintStyle: GoogleFonts.roboto(
                                          fontSize: 18,
                                        ),
                                        suffixIcon: IconButton(
                                          //color: Colors.amber,
                                          iconSize: responsive.dp(3),
                                          icon: const Icon(Icons.search),
                                          onPressed: () {
                                            Fluttertoast.showToast(
                                              msg: 'Buscando',
                                            );
                                          },
                                        ),
                                      ),
                                      validator: RequiredValidator(
                                          errorText: 'El campo es obligatorio'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  responsive.wp(5), responsive.hp(1), 0, 0),
                              child: Text(
                                'Busquedas recientes.',
                                style: TextStyle(
                                  fontSize: responsive.dp(2.4),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(_success == null
                              ? 'Null'
                              : (_success ? 'Comentario registrado' : '')),
                        ),
                        //? aqui estaba el result de busqueda

                        Container(
                          width: responsive.wp(98),
                          height: responsive.hp(65),
                          //color: Colors.black12,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(responsive.dp(2)))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: responsive.dp(1)),
                            child: Column(
                              children: [
                                userResult,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    _comentarioController.dispose();
    dispose();
  }
}
