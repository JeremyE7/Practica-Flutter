class ObtenerLibroWs {
  List<dynamic> libros = [];
  String code = "";
  String msg= "";

  ObtenerLibroWs({this.code = "", this.msg = ""});

  ObtenerLibroWs.fromMap(Map<dynamic, dynamic> mapa)
  {
     libros = mapa["data"];
  }
}