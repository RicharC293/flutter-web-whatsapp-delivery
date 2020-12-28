import 'package:location/location.dart';

class BuyModel {
  final LocationData location;
  final List<String> products;
  final double total;

  BuyModel(this.location, this.products, this.total);
}
