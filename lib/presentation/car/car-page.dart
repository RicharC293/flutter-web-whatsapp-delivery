import 'package:flutter/material.dart';
import 'package:flutter_web_1/presentation/car/components/body.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar Compra'),
      ),
      body: Body(),
    );
  }
}
