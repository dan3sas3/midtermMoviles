import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';
class PaginaContacto extends StatefulWidget{
  @override
  _PaginaContactoState createState() => _PaginaContactoState();
}

class _PaginaContactoState extends State<PaginaContacto>{
  openwhatsapp(String message, String destinatario) async {
    var whatsapp = destinatario;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=" + message;
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        /*ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));*/
        print("WhatsApp no instalado");
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        /*ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));*/
          print("WhatsApp no instalado");
      }
    }
  }
  enviarsms(String msj, List<String> d) async {
    String r = await sendSMS(message:msj,recipients: d).catchError(
        (onError){
          print(onError);
        }
      );
    print(r);
  }
  hacerllamada() async{
    const url = 'tel:+525525647244';
    if (await canLaunch(url)){
      await launch(url);
    }else{
      throw 'error al llamar a $url';
    }
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Contactanos',
          ),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin:const EdgeInsets.all(25),
                width: 100,
                child: TextButton(
                  child: const Text('Llamada', style: TextStyle(
                    fontSize:20.0
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white
                  ),
                  onPressed: ()=>hacerllamada(),
                )
              ),
              Container(
                margin:const EdgeInsets.all(25),
                width: 100,
                child: TextButton(
                  child: const Text('SMS', style: TextStyle(
                    fontSize:20.0
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white
                  ),
                  onPressed: (){
                    String msj = "Haz tu reservacion";
                    List<String> d = ["12121212", "+98989"];
                    enviarsms(msj, d);
                  },
                )
              ),
              Container(
                margin:const EdgeInsets.all(25),
                width: 100,
                child: TextButton(
                  child: const Text('Whats', style: TextStyle(
                    fontSize:20.0
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white
                  ),
                  onPressed: (){
                    String mensaje = "Haz tu reservacion";
                    String destinatario = "+52555555555";
                    openwhatsapp(mensaje, destinatario);
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}