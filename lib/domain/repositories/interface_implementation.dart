import 'package:flutter_web_1/domain/models/buy-model.dart';
import 'package:flutter_web_1/domain/models/productos-model.dart';
import 'package:location/location.dart' as lc;

abstract class InterfaceImplementation {
  Future<lc.LocationData> getlocationUser();
  Future<void> sendMessage(BuyModel buy);
  void addProduct(ProductsModel product);
  List<ProductsModel> getProductsAdded();
}
