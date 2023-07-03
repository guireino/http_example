import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

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

    // ######################### Dio #########################

    final dio = Dio();

    try {
      Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      //throw "Erro customizado";
      print(response.data);
    } on DioException catch (e) {
      print("Erro na request: ${e.response?.statusCode}");

      //print("Erro generico: $e");
    }

    // ######################### http: ^0.13.4 #########################

    //buscando link no tipo json com get
    // http.Response response = await http.get( http: ^0.13.4
    //   Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    //   headers: headers,
    // );

    //buscando link no tipo json com post
    // http.Response response = await http.post( http: ^0.13.4
    //   Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    //   headers: headers,
    //   body: json.encode(body),
    // );

    // Respostas de sucesso (200-299)

    //verificando resposta que servidor for 200
    //if (response.statusCode >= 200 && response.statusCode < 300) {  http: ^0.13.4
    //print(response.body);
    //List result = json.decode(response.body);  http: ^0.13.4

    //buscando list json
    // for (var item in result) {
    //   print(item['title']);
    // }

    //} else {
    //print('aconteceu um erro: ${response.statusCode}');  http: ^0.13.4
    //}
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
