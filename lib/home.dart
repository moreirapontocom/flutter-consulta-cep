import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarCep() async {
    String cep = "30775330";
    String url = "http://viacep.com.br/ws/" + cep + "/json/";

    http.Response response = await http.get(url);

    Map<String, dynamic> content = json.decode(response.body);

    print("Rua " + content["logradouro"] + ", " + content["bairro"] + " - " + content["localidade"]);
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
        child: RaisedButton(
          child: Text("Recuperar CEP"),
          onPressed: _recuperarCep,
        ),
      ),
    );
  }
}