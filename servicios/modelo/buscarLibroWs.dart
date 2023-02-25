class BuscarLibroWs {
  Map<String, dynamic> libro = {};
  String code = "";
  String msg= "";

  BuscarLibroWs({this.code = "", this.msg = ""});

  BuscarLibroWs.fromMap(Map<dynamic, dynamic> mapa)
  {
     libro = mapa["data"];
  }
}