import 'package:flutter/material.dart';
import 'package:flutter_web_1/presentation/home/home-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo envio de productos con Ubicación',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
