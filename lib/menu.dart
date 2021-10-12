import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Menu extends StatefulWidget{
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu>{
  //Leer y Usar API
  List<String> comidas = ["biryani","burger","butter-chicken","dessert","dosa","idly","pasta","pizza","rice","samosa"];
  String platillo = "biryani";
  String imageURL = "";
  //Funcion para obtener un platillo aleatorio
  Future<void> _randomPlatillo() async{
    String uri="https://foodish-api.herokuapp.com/api/images/"+platillo;
    var response = await http.get(Uri.parse(uri));
    var responseBody = json.decode(response.body);
    setState(() {
      imageURL = responseBody["image"];
    });
    
  }
  //Widget Build
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Menu',
        ),
        backgroundColor: Colors.red,
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton(
                value:platillo,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 12,
                style: const TextStyle(color: Colors.deepOrange),
                onChanged: (String ? newValue){
                  setState((){
                    platillo = newValue!;
                  });
                },
                items: comidas
                  .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: <Widget>[
                        Text(value),
                        ],
                      ),
                    ))
                  .toList(),
              ),
              ElevatedButton(
                child: const Text('Imagen'),
                onPressed: _randomPlatillo,
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
              imageURL == ""
              ? Text("Seleccione una platillo")
              : Container(
                  child: Card(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:<Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          child: Image.network(
                            imageURL,
                            height: 250,
                            fit: BoxFit.fill,
                          )
                        )
                      ]
                    )
                  ),
                )
            ],
          ),
        ),
      )
    );
  }
}