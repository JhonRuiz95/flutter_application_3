//import 'dart:typed_data';
//import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:photo_manager/photo_manager.dart';
//import 'package:prueba_interfaz/helpers/animation_route.dart';
import 'package:flutter_application_3/ui/widgets.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/utils/responsive.dart';
//import 'package:prueba_interfaz/widgets/circle.dart';

//FirebaseAuth _auth = FirebaseAuth.instance;

class publicacionPerfil extends StatelessWidget {
  final String title = 'Publicación';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _comentarioController = TextEditingController();
  late final bool _success = false;
  late String userMail;
  //const ejemplo1({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();
  late List<AssetEntity> _mediaList = [];

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    final size = MediaQuery.of(context).size;
    //int _count = 0;
    //String srcImage;
    int privacidad = 1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Column(
            children: [
              SizedBox(
                height: responsive.hp(6.8),
                width: responsive.wp(100),
                child: _appBarPost(context),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(responsive.dp(1.2)),
            child: Column(
              children: [
                //const SizedBox(height: 10.0),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              //color: Colors.amber,
                              //padding: const EdgeInsets.symmetric(vertical: 40),
                              alignment: Alignment.center,
                              height: responsive.hp(10),
                              width: size.width * .19,
                              child: CircleAvatar(
                                radius: responsive.dp(4.15), //39
                                backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf0ERpjDSStCmhswKfKo13q_LtBlg72b-H1qDCyoQtUHgzhCpVEhM9Ld5aumNAZ3PbRkc&usqp=CAU',
                                  scale: responsive.dp(10),
                                ),
                              ),
                            ),
                            Container(
                              height: responsive.hp(7),
                              width: responsive.wp(75),
                              color: Colors.grey.shade300, //parte de perfil
                              child: TextFormField(
                                controller: _comentarioController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, top: 40.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            responsive.dp(1))),
                                    hintText: 'Agrega un comentario...',
                                    hintStyle:
                                        GoogleFonts.roboto(fontSize: 18)),
                                validator: RequiredValidator(
                                    errorText: 'El campo es obligatorio'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: responsive.hp(1.1),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 65.0, right: 10.0),
                          child: Container(
                            height: 150,
                            width: size.width * .95,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://st2.depositphotos.com/1852625/5395/i/600/depositphotos_53954927-stock-photo-beautiful-landscape-of-scottish-nature.jpg') //imagen para mostrar
                                  ),
                            ),
                          ), //Text('Linea 140 a 186'),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 65.0, right: 10.0),
                          child: Container(
                              height: 150,
                              width: size.width * .95,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://thumbs.dreamstime.com/b/paisaje-hermoso-de-la-luna-con-la-silueta-de-la-ciudad-32060787.jpg') //imagen para mostrar
                                      ))),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 65.0, right: 10.0),
                          child: Container(
                              height: 150,
                              width: size.width * .95,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'http://2.bp.blogspot.com/-fjvjAMS-bYY/U3Y1AK9cYdI/AAAAAAABTZA/yTIIgjpTlzs/s1600/fotografo-indonesia-paisajes-4.jpg') //imagen para mostrar
                                      ))),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 65.0, right: 10.0),
                          child: Container(
                            height: 150,
                            width: size.width * .95,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://st.depositphotos.com/1003352/2263/i/600/depositphotos_22635647-stock-photo-mountain-lake.jpg') //imagen para mostrar
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.all(responsive.wp(2)),
                  height: responsive.hp(12),
                  width: size.width,
                  color: Colors.amber,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: <Widget>[
                          Container(
                            //color: Colors.black,
                            height: 55,
                            width: size.width * .2,
                            margin: const EdgeInsets.only(
                              bottom: 3.0,
                              left: 3.0,
                              top: 3.0,
                              right: 3.0,
                            ),
                            child: Image.network(
                              'https://st.depositphotos.com/1003352/2263/i/600/depositphotos_22635647-stock-photo-mountain-lake.jpg',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 55,
                            width: size.width * .2,
                            margin: const EdgeInsets.only(
                              bottom: 3.0,
                              left: 3.0,
                              top: 3.0,
                              right: 3.0,
                            ),
                            child: Image.network(
                              'http://2.bp.blogspot.com/-fjvjAMS-bYY/U3Y1AK9cYdI/AAAAAAABTZA/yTIIgjpTlzs/s1600/fotografo-indonesia-paisajes-4.jpg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), // ? ListView.builder
                ),
                const SizedBox(height: 5.0),
                const Divider(),
                InkWell(
                  //onTap: () => ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        //? seleccion de prevacidad
                        if (privacidad == 1) const Icon(Icons.public_rounded),
                        if (privacidad == 2) const Icon(Icons.public_outlined),
                        if (privacidad == 3)
                          const Icon(Icons.lock_outline_rounded),
                        const SizedBox(),
//ahora mostramos el mensaje
                        const SizedBox(width: 5.0),
                        if (privacidad == 1)
                          const Text.rich(
                              TextSpan(text: 'Todos pueden comentar')),
                        if (privacidad == 2)
                          const Text.rich(TextSpan(text: 'Solo seguidores')),
                        if (privacidad == 3)
                          const Text.rich(TextSpan(text: 'Nadie')),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
                //const Divider(),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: 40,
                  width: 192, //linea 266
                  //child: Icon(Icons.add_a_photo),
                  child: Row(
                    children: [
                      IconButton(
                          splashRadius: 20,
                          onPressed: () async {
                            const Text.rich(TextSpan(
                                text: 'Permiso para acceder a galeria'));
                          },
                          icon: const Icon(Icons
                              .camera)), //SvgPicture.asset('assets/svg/gallery.svg')
                      IconButton(
                          splashRadius: 20,
                          onPressed: () async {
                            const Text.rich(TextSpan(
                                text: 'Permiso para acceder a camara'));
                          },
                          icon: const Icon(Icons.add_a_photo)),
                      IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.gif)),
                      IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.location_on)),
                    ],
                  ),
                )
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

  void _register() async {
    /*final FirebaseAuth user = (await _auth.createUserWithEmailAndPassword(
        email: _comentarioController.text,
        password: _comentarioController.text)) as FirebaseAuth;
    if (user != null) {
      //setState
    } else {}*/
  }

  Widget _appBarPost(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.of(context).pop();
            }, //=> Navigator.pushAndRemoveUntil(
            // 'context', routeSlide(page: ejemplo1()), (_) => false),

            icon: const Icon(Icons.arrow_back)),
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          onPressed: () {},
          child: const TextFrave(
            text: 'Publicar',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 5,
          ),
        ),
        //TextButton(onPressed: () {}, child: const Text('Hola'))
      ],
    );
  }
}
