class PubModel {
  String? id;
  String? uid;
  String? mensaje;
  String? fecha;
  String? hora;
  String? imagen;

  PubModel(
      {this.id, this.uid, this.mensaje, this.fecha, this.hora, this.imagen});

  factory PubModel.fromMap(Map) {
    return PubModel(
        id: Map['id'],
        uid: Map['uid'],
        mensaje: Map['mensaje'],
        fecha: Map['fecha'],
        hora: Map['hora'],
        imagen: Map['imagen']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'mensaje': mensaje,
      'fecha': fecha,
      'hora': hora,
      'imagen': imagen
    };
  }
}
