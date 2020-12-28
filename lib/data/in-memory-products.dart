import 'package:flutter_web_1/domain/models/productos-model.dart';

final productoUno = ProductsModel(
  1,
  'Hamburguesa',
  'Hamburguesa de carne',
  4.50,
  'https://img.freepik.com/foto-gratis/deliciosas-hamburguesas-parrilla_62847-16.jpg?size=626&ext=jpg',
  false,
);

final productoDos = ProductsModel(
  2,
  'Alitas',
  'Alitas de pollo recubiertas con diferentes Salsas',
  5.50,
  'https://es.cravingsjournal.com/wp-content/uploads/2019/11/alitas-bbq-6-500x500.jpg',
  false,
);

final productoTres = ProductsModel(
  3,
  'Alitas bbq',
  'Alitas de pollo recubiertas con salsa BBQ',
  5.50,
  'https://es.cravingsjournal.com/wp-content/uploads/2019/11/alitas-bbq-6-500x500.jpg',
  false,
);

List<ProductsModel> listProducts = [
  productoUno,
  productoDos,
  productoTres,
];
