import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> callBeckend() async {
    //Header json
    Map<String, String> headers = {
      'content-type': 'application/json',
    };

    //Body json
    Map<String, dynamic> body = {
      'title': 'test',
      'body': 'conteudo',
      'userId': 1,
    };

    //buscando link no tipo json com get
    // http.Response response = await http.get(
    //   Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    //   headers: headers,
    // );

    //buscando link no tipo json com post
    http.Response response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: headers,
      body: json.encode(body),
    );

    // Respostas de sucesso (200-299)

    //verificando resposta que servidor for 200
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      //List result = json.decode(response.body);

      //buscando list json
      // for (var item in result) {
      //   print(item['title']);
      // }

    } else {
      print('aconteceu um erro: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callBeckend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste HTTP'),
      ),
      body: const Center(
        child: Text('Realizando teste HTTP'),
      ),
    );
  }
}
