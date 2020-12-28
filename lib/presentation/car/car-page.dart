import 'package:flutter/material.dart';
import 'package:flutter_web_1/domain/models/productos-model.dart';
import 'package:flutter_web_1/presentation/car/components/body.dart';

class CarPage extends StatelessWidget {
  final List<ProductsModel> productsAdded;

  const CarPage({this.productsAdded});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar Compra'),
      ),
      body: Body(
        productsAdded: productsAdded,
      ),
    );
  }
}
