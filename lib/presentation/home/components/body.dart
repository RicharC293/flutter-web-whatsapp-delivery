import 'package:flutter/material.dart';
import 'package:flutter_web_1/data/in-memory-products.dart';
import 'package:flutter_web_1/domain/models/productos-model.dart';
import 'package:flutter_web_1/presentation/car/car-page.dart';

final List<ProductsModel> dataProducts = [];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Productos disponibles'),
          Expanded(
            child: _ListProducts(),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: FlatButton(
              child: Text('Ir al carrito'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return CarPage(
                      productsAdded: dataProducts,
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ListProducts extends StatefulWidget {
  @override
  __ListProductsState createState() => __ListProductsState();
}

class __ListProductsState extends State<_ListProducts> {
  final iconAdded = Icon(Icons.check_circle, color: Colors.green);
  final iconDefault = Icon(Icons.shopping_cart, color: Colors.blueAccent);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listProducts.length,
      padding: EdgeInsets.all(20),
      itemBuilder: (BuildContext context, int index) {
        final data = listProducts[index];
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(width: 20),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(data.image),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('${data.name}'),
                      Text('${data.description}'),
                      Text('\$${data.price}'),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    dataProducts.add(data);
                    setState(() {
                      data.addToCart = !data.addToCart;
                    });
                  },
                  child: (data.addToCart) ? iconAdded : iconDefault,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
