import 'package:flutter/material.dart';
import 'package:prueba2/servicios/inicioSesionService.dart';
import 'package:prueba2/utiles/conexionWs.dart';
import 'dart:developer';
import 'package:prueba2/utiles/urls.dart';
import 'package:prueba2/views/principalView.dart';

class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController correoController =  TextEditingController();
  final TextEditingController claveController =  TextEditingController();
  InicioSesionService inicioSesionService = InicioSesionService();

  void _iniciar()
  {
    setState(() {
      if(_formKey.currentState!.validate())
        {
          Map<dynamic,dynamic> data = {
            "correo":correoController.text,
            "clave": claveController.text
          };
          inicioSesionService.inicioSesion(data).then((value){
            if(value.token != "")
              {
                log("wdoiawoda");
                guardar("token",value.token);
                SnackBar msg = SnackBar(content: Text("Bienvenido"));
                ScaffoldMessenger.of(context).showSnackBar(msg);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => principalView()),
                );
              }
            else
              {
                SnackBar msg = SnackBar(content: Text(value.msg));
                ScaffoldMessenger.of(context).showSnackBar(msg);
              }
            log('loginView:_iniciar');
            log(value.msg);
          });
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,  
      child:Scaffold(
      backgroundColor: Colors.amberAccent,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("imgs/login.png"),
              ),
              Text(
                "Inicio de Sesion",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 2000.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.5,
                  height: 15.0,
                ),
              ),
              Divider(
                height: 45.0,
                color: Colors.transparent,
              ),
              TextFormField(
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  labelText: "Correo Electronico",
                  suffixIcon: Icon(Icons.alternate_email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  fillColor: Colors.red
                ),
                controller: correoController,
              ),
              Divider(
                height: 25.0,
                color: Colors.transparent,
              ),
              TextFormField(
                  enableInteractiveSelection: false,
                  controller: claveController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Clave",
                      suffixIcon: Icon(Icons.lock_outline_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      fillColor: Colors.red
                  ),
              ),
              Divider(
                height: 20.0,
                color: Colors.transparent,
              ),
              SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),

                  ),
                  child: Text(
                      "Iniciar Sesion",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0
                    ),
                  ),
                  onPressed: _iniciar
                ),
              )
            ],
          )
        ],
      ),
    )
    );
  }
}
