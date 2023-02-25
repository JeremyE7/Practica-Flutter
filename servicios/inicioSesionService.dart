import 'dart:convert';

import 'package:prueba2/servicios/modelo/inicioSesionWs.dart';
import 'package:prueba2/utiles/conexionWs.dart';
import 'dart:developer';

class InicioSesionService{
  conexionWs restCliente = conexionWs();

  Future<InicioSesionWs> inicioSesion(Map<dynamic,dynamic> mapa) async
  {
    log('InicioSesionService:inicioSesion');
    RespuestaGenerica response = await restCliente.solicitudPost('inicio_sesion', mapa, conexionWs.NO_TOKEN);
    log(response.code.toString());
    return _inicioSesionJson((response.code == 200) ? response.data : null);
  }


  InicioSesionWs _inicioSesionJson(dynamic data)
  {
    var inicio = InicioSesionWs();
    if(data != null)
      {
        Map<String,dynamic> mapa = jsonDecode(data);
        if((mapa["msg"] == "OK") || (mapa["msg"] == "ok"))
          {
            inicio = InicioSesionWs.fromMap(mapa["data"]);
          }
        inicio.code = mapa["code"];
        inicio.msg = mapa["msg"];

      }
    else
      {
        inicio.code = "400";
        inicio.msg = "Error Fatal";
      }


    return inicio;
  }
}