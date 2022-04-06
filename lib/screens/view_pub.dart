import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/responsive.dart';
import 'package:flutter_application_3/widgets/circle.dart';
import 'package:flutter_application_3/widgets/icon_container.dart';

class viewPub extends StatefulWidget {
  const viewPub({Key? key}) : super(key: key);

  @override
  State<viewPub> createState() => _viewPubState();
}

class _viewPubState extends State<viewPub> {
  //File? imagen = null;
  //final picker = ImagePicker();
/*
  Future selimagen(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      print('Abriendo foto');
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print("No hay imagen selecionada");
      }
    });
    Navigator.of(context).pop();
  }*/
  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final double pinkSize = resposive.wp(90);
    final double orangeSize = resposive.wp(55);
    final userName = "Jhon Ruiz";
    final fecha = "2/04/2022";
    final menPub = "Un hermosa paisaje.";
    final size = MediaQuery.of(context).size;

    Container _contPub = Container(
      //color: Colors.deepPurpleAccent,
      padding: EdgeInsets.all(resposive.dp(2)),
      width: resposive.wp(94.3),
      height: resposive.hp(60),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(
            resposive.dp(7),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              CircleAvatar(
                radius: resposive.dp(4.5),
                backgroundImage: AssetImage('assets/images/a.jpg'),
              ),
              SizedBox(
                width: resposive.wp(2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        userName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: resposive.dp(3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        fecha,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: resposive.dp(1.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.public),
                    ],
                  ),
                ],
              ),
            ],
          ),
          //?Parte de la Imagen ↓
          SizedBox(
            height: resposive.hp(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                menPub,
                style: TextStyle(fontSize: resposive.dp(1.9)),
              ),
            ],
          ),
          SizedBox(
            height: resposive.hp(1),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(
                Radius.circular(resposive.dp(7)),
              ),
            ),
            width: resposive.wp(90),
            height: resposive.hp(41),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                    child: Container(
                      //height: resposive.hp(48),
                      //width: resposive.wp(84.6),
                      //margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(resposive.dp(7)),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://st2.depositphotos.com/1852625/5395/i/600/depositphotos_53954927-stock-photo-beautiful-landscape-of-scottish-nature.jpg') //imagen para mostrar
                            ),
                      ),
                    ), //Text('Linea 140 a 186'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicaciones'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: resposive.height,
          color: Colors.white,
          child: Stack(
            //alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                right: -(pinkSize) * 0.3,
                top: -(pinkSize) * 0.5,
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
                left: -(orangeSize) * 0.1,
                top: -(orangeSize) * 0.6,
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
                top: pinkSize * 0.03,
                left: resposive.wp(3),
                child: _contPub,
              ),
              //?
            ],
          ),
        ),
      ),
    );
  }
}
