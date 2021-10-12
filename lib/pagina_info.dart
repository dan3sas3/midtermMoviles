import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PaginaInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return Center(
        child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            'La Loggia',
          ),
        ),
        body: SingleChildScrollView(
          child:Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRect(
                        child:  Image.asset(
                          'assets/logo.png',
                          height: 180,
                          fit: BoxFit.fill,
                        )
                      )
                    ],
                  )
                ),
                const Padding(
                  padding: EdgeInsets.all(32),
                  child:Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    softWrap: true
                  )
                ),
                Container(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRect(
                        child:  Image.asset(
                          'assets/restaurante.jpg',
                          height: 180,
                          fit: BoxFit.fill,
                        )
                      )
                    ],
                  )
                ),
                const Padding(
                  padding: EdgeInsets.all(32),
                  child:Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    softWrap: true
                  )
                ),
              ],
            ),
          )
        )
      )
    );
  }
}