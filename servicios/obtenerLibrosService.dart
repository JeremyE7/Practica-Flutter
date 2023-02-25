import 'dart:convert';

import 'package:prueba2/servicios/modelo/inicioSesionWs.dart';
import 'package:prueba2/servicios/modelo/obtenerLibrosWs.dart';
import 'package:prueba2/utiles/conexionWs.dart';
import 'dart:developer';

import 'package:prueba2/utiles/urls.dart';


class ObtenerLibrosService{
  conexionWs restCliente = conexionWs();

  Future<ObtenerLibroWs> obtenerLibros() async
  {
    log('ObtenerLibrosService:obtenerLibros');
      RespuestaGenerica response = await restCliente.solicitudGet('libros', await obtener("token"));
    return _obtenerLibrosJson((response.code == 200) ? response.data : null);

  }

  Future<ObtenerLibroWs> buscarLibros(String tipo, String nombre) async
  {
    log('ObtenerLibrosService:obtenerLibros');
    RespuestaGenerica response = await restCliente.solicitudGet('libros/buscar/'+tipo+'/'+nombre, await obtener("token"));
    return _obtenerLibrosJson((response.code == 200) ? response.data : null);

  }

  ObtenerLibroWs _obtenerLibrosJson(dynamic data)
  {
    var libros = ObtenerLibroWs();
    log(data.toString());
    if(data != null)
      {
        Map<String,dynamic> mapa = jsonDecode(data) as Map<String, dynamic>;
        if((mapa["msg"] == "OK") || (mapa["msg"] == "ok"))
          {
            libros = ObtenerLibroWs.fromMap(mapa);
          }
        libros.code = mapa["code"];
        libros.msg = mapa["msg"];

      }
    else
      {
        libros.code = "400";
        libros.msg = "Error Fatal";
      }


    return libros;
  }
}