import 'package:flutter/material.dart';
import 'package:flutter_web_1/data/repositories-implementation/interface-repositori-implementation.dart';
import 'package:flutter_web_1/domain/models/buy-model.dart';
import 'package:flutter_web_1/domain/models/productos-model.dart';

class Body extends StatelessWidget {
  final List<ProductsModel> productsAdded;

  const Body({this.productsAdded});
  @override
  Widget build(BuildContext context) {
    double total = 0;
    productsAdded.forEach((element) {
      total = element.price + total;
    });
    return Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Verificar su compra'),
          ListView.builder(
            itemCount: productsAdded.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final data = productsAdded[index];
              return ListTile(
                leading: Text('${data.uId}'),
                title: Text('${data.name}'),
                subtitle: Text('${data.description}'),
                trailing: Text('${data.price}'),
              );
            },
          ),
          Text('Total: $total'),
          FlatButton(
            child: Text('Comprar'),
            onPressed: () async {
              final listProducts = productsAdded.map((e) => e.name).toList();
              final impl = InterfaceRepositoriImplementation();
              final location = await impl.getlocationUser();
              final dataToSend = BuyModel(location, listProducts, total);
              impl.sendMessage(dataToSend);
            },
          ),
        ],
      ),
    );
  }
}
