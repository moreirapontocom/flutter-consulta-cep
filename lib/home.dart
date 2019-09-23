import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "";

  TextEditingController _controllerCEP = TextEditingController();

  _recuperarCep() async {

    String url = "http://viacep.com.br/ws/" + _controllerCEP.text + "/json/";

    http.Response response = await http.get(url);

    Map<String, dynamic> content = json.decode(response.body);

    String logradouro = content["logradouro"];
    String bairro = content["bairro"];
    String localidade = content["localidade"];

    setState(() {
      _resultado = logradouro + ", " + bairro + " - " + localidade;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CEP API"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        width: double.infinity,
        child: Column(
          children: <Widget>[

            TextField(
              keyboardType: TextInputType.number,
              controller: _controllerCEP,
              decoration: InputDecoration(
                labelText: "Informe o CEP"
              ),
            ),

            RaisedButton(
              child: Text("Recuperar CEP"),
              onPressed: _recuperarCep,
            ),
            Text( _resultado )

          ],
        ),
      ),
    );
  }
}