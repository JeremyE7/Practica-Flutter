import 'package:flutter/material.dart';

class libroDescView extends StatefulWidget
{
  const libroDescView({Key? key}): super(key: key);

  @override
  State<libroDescView> createState() => _libroDescViewState();
}

class _libroDescViewState extends State<libroDescView>
{
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Column(
          children: <Widget>[
            Divider(
              height: 10.0,
              color: Colors.transparent,
            ),
            Text("Titulo"),
            Text("Año"),
            Text("Autor"),
            Text("Descripcion"),
          ],
        ),
        onPressed: ()
        {
          print("awdawd");
        }
    );
  }

}
