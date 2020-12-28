import 'package:location/location.dart' as lc;

class BuyModel {
  final lc.LocationData location;
  final List<String> products;
  final double total;

  BuyModel(this.location, this.products, this.total);
}
