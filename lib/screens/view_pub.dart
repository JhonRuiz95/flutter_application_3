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

    Container _contPub = Container(
      //color: Colors.deepPurpleAccent,
      padding: EdgeInsets.all(resposive.dp(2)),
      width: resposive.wp(80),
      height: resposive.hp(60),
      decoration: BoxDecoration(
        color: Colors.amber,
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
                top: pinkSize * 0.15,
                left: resposive.wp(11),
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
