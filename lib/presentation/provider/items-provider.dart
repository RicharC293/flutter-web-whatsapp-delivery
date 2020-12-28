import 'package:flutter/material.dart';
import 'package:flutter_web_1/domain/models/productos-model.dart';

class ItemsProvider extends ChangeNotifier {
  List<ProductsModel> _productsAdded = new List();
  List<ProductsModel> get productsAdded => this._productsAdded;
  set productsAdded(List<ProductsModel> value) {
    this._productsAdded = value;
    notifyListeners();
  }

  set addProduct(ProductsModel value) {
    this._productsAdded.add(value);
  }

  set deleteProduct(int value) {
    this._productsAdded.removeWhere((element) => element.uId == value);
  }
}
