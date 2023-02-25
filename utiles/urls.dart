import 'package:shared_preferences/shared_preferences.dart';

String base = "http://192.168.1.14:8081/api/v1/";

guardar(String key, dynamic value) async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();

  await preferences.setString(key, value);
}

Future<String> obtener(String key) async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String data = await preferences.getString(key).toString();
  return data;
}