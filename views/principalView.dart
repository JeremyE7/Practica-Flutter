import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba2/servicios/obtenerLibrosService.dart';
import 'package:prueba2/views/libroDescView.dart';
import 'dart:developer';


class principalView extends StatefulWidget
{
  const principalView({Key? key}): super(key: key);

  @override
  State<principalView> createState() => _principalViewState();
}

class _principalViewState extends State<principalView>
{

  final _formKey = GlobalKey<FormState>();
  List<dynamic> _libros = [] ;
  ObtenerLibrosService obtenerLibrosService = ObtenerLibrosService();
  final TextEditingController busquedaController =  TextEditingController();


  @override
  void initState() {
    _obtenerLibros();
  }

  void _obtenerLibros()
  {
    setState(() {

        obtenerLibrosService.obtenerLibros().then((value){
          if(!value.libros.isEmpty)
          {
            log("wdoiawoda");
            _libros = value.libros;
          }
          else
          {
            SnackBar msg = SnackBar(content: Text(value.msg));
            ScaffoldMessenger.of(context).showSnackBar(msg);
          }
          log('principalView:_obtenerLibros');
          log(value.msg);
        });
      }
    );
  }

  void _buscarLibro()
  {
    setState(() {
      if(busquedaController.text.isEmpty)
        {
          _obtenerLibros();
          return;
        }

      obtenerLibrosService.buscarLibros("2", busquedaController.text).then((value){
        if(!value.libros.isEmpty)
        {
          log("wdoiawoda");
          _libros = value.libros;
          log(_libros.toString());
        }
        else
        {
          SnackBar msg = SnackBar(content: Text(value.msg));
          ScaffoldMessenger.of(context).showSnackBar(msg);
        }
        log('principalView:_obtenerLibros');
        log(value.msg);
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 90.0
        ),
        children: <Widget>[
          Expanded(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),

                      ),
                      child: Text(
                        "Buscar",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0
                        ),
                      ),
                      onPressed: _buscarLibro
                  ),
                ),
                TextFormField(
                  controller: busquedaController,
                  validator: (value)
                  {
                    if(value == null || value.isEmpty)
                    {
                      return 'Este campo no puede estar vacio';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Buscar Libro",
                      suffixIcon: Icon(Icons.search)
                  ),
                ),
                (_libros.isEmpty)
                    ?
                CircularProgressIndicator()
                    :
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _libros.length,
                    padding: const EdgeInsets.all(4.0),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black54,
                    ),
                    itemBuilder: (context, index) {

                      return librosItem(_libros[index]) ;
                    }
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

Widget librosItem(dynamic libro) {
  return TextButton(
      child: Column(
        children: <Widget>[
          Divider(
            height: 10.0,
            color: Colors.transparent,
          ),
          //Text(libro.titulo),
          Text(libro["titulo"]),
          Text(libro["autores"]),
          Text(libro["editorial"]),
        ],
      ),
      onPressed: () {
        log("awdawd");
      }
  );
}
