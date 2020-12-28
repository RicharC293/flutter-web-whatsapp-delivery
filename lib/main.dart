import 'package:flutter/material.dart';
import 'package:flutter_web_1/presentation/home/home-page.dart';
import 'package:flutter_web_1/presentation/provider/items-provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ItemsProvider()),
    ], child: MyApp()));

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
