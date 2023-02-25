import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:prueba2/utiles/urls.dart';

class conexionWs
{
  final String NAME = "ConexionWs";
  static String NO_TOKEN = "NO_TOKEN";
  Future<RespuestaGenerica> solicitudPost(String recurso, Map<dynamic,dynamic> data,String token) async
  {
    RespuestaGenerica _respuestaJson(int code, String message ,dynamic data)
    {
      var respuesta =  RespuestaGenerica();
      respuesta.code = code;
      respuesta.message =message;
      respuesta.data = data;

      return respuesta;
    }

    log("${this.NAME}:SolicitudPost");
    Map<String, String> _header = {'Content-Type':'application/json'};
    if(token != NO_TOKEN)
      {
        _header = {'Content-Type':'application/json', 'Authorization':token};
      }
    final String url = base + recurso;
    final uri = Uri.parse(url);
    try{
      final response = await http.post(uri,headers: _header,body: jsonEncode(data));
      if(response.statusCode != 200)
      {
        return _respuestaJson(response.statusCode, "Hubo un error de autorizacion",response.body);
      }
      else
      {
        return _respuestaJson(response.statusCode, "OK", response.body);
      }

    }catch(e)
    {
      log("Erro algo sucedio ${e.toString()}");
      Map<dynamic, dynamic> mapa = {'data': e.toString()};
      return _respuestaJson(0,"Hubo un error de validacion", mapa);
    }
  }

  Future<RespuestaGenerica> solicitudGet(String recurso,String token) async
  {
    RespuestaGenerica _respuestaJson(int code, String message ,dynamic data)
    {
      var respuesta =  RespuestaGenerica();
      respuesta.code = code;
      respuesta.message =message;
      respuesta.data = data;

      return respuesta;
    }

    log("${this.NAME}:solicitudGet");
    Map<String, String> _header = {'Content-Type':'aplication/json'};
    if(token != NO_TOKEN)
    {
      _header = {'Content-Type':'aplication/json', 'Authorization':token};
    }
    final String url = base + recurso;
    final uri = Uri.parse(url);
    log(uri.toString());

    try{
      final response = await http.get(uri,headers: _header);
      log(response.statusCode.toString());
      if(response.statusCode != 200)
        {
            return _respuestaJson(response.statusCode, "Hubo un error de autorizacion",response.body);
        }
      else
        {

          return _respuestaJson(response.statusCode, "OK", response.body);
        }

    }catch(e)
    {
      log("Erro algo sucedio ${e.toString()}");
      Map<dynamic, dynamic> mapa = {'data': e.toString()};
      return _respuestaJson(0,"Hubo un error de validacion", mapa);
    }


  }
}
class RespuestaGenerica
{
  String message = "";
  int code = 0;
  dynamic data;

  RespuestaGenerica({this.code = 0, this.message = "", this.data});



}