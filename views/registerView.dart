import 'package:flutter/material.dart';

List<String> listaTipoIdentificacion = <String> ["Cedula","Pasaporte","R.U.C."];

class registerView extends StatefulWidget
{
  const registerView({Key? key}) : super(key: key);

  @override
  State<registerView> createState() => _registerViewState();
}

class _registerViewState extends State<registerView>
{

  final _formKey = GlobalKey<FormState>();

  String dropValueIdent = listaTipoIdentificacion.first;

  String dropValueRol = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Scaffold(
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
                      backgroundImage: AssetImage("imgs/register.png"),
                      backgroundColor: Colors.transparent,
                  ),
                  TextFormField(
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                        {
                          return 'Este campo no puede estar vacio';
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Nombres",
                      suffixIcon: Icon(Icons.person)
                    ),
                  ),
                  TextFormField(
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return 'Este campo no puede estar vacio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Apellidos",
                        suffixIcon: Icon(Icons.person)
                    ),
                  ),
                  TextFormField(
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return 'Este campo no puede estar vacio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Direccion",
                        suffixIcon: Icon(Icons.person)
                    ),
                  ),
                  DropdownButton<String>(
                      value: dropValueIdent,
                      icon: Icon(Icons.arrow_downward),
                      items: listaTipoIdentificacion.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                      setState(() {
                        dropValueIdent = value.toString();
                      });
                    },
                  ),
                  TextFormField(
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return 'Este campo no puede estar vacio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Identificacion",
                        suffixIcon: Icon(Icons.person)
                    ),
                  ),
                  TextFormField(
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return 'Este campo no puede estar vacio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Telefono",
                        suffixIcon: Icon(Icons.person)
                    ),
                  ),
                  DropdownButton(

                    value: dropValueRol,
                    icon: Icon(Icons.arrow_downward),
                    items: null,
                    onChanged: (value) {
                      setState(() {
                        dropValueRol = value.toString();
                      });
                    },
                  ),
                  ElevatedButton(
                      onPressed: ()
                      {
                        if(_formKey.currentState!.validate())
                          {
                            print("hola");
                          }
                      },
                      child: Text("Enviar")
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}