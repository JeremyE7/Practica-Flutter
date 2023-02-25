class InicioSesionWs {
  String external = "";
  String correo = "";
  String token = "";
  String code = "";
  String msg= "";

  InicioSesionWs({this.external = "", this.correo = "", this.token = ""});

  InicioSesionWs.fromMap(Map<dynamic, dynamic> mapa)
  {
    correo = mapa["correo"];
    token = mapa["token"];
    external = mapa["external"];
  }
}