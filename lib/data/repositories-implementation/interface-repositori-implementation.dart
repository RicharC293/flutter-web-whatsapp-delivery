import 'package:flutter_web_1/domain/models/buy-model.dart';
import 'package:flutter_web_1/domain/models/productos-model.dart';
import 'package:flutter_web_1/domain/repositories/interface_implementation.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:location/location.dart' as lc;
import 'package:url_launcher/url_launcher.dart';

class InterfaceRepositoriImplementation extends InterfaceImplementation {
  @override
  Future<LocationData> getlocationUser() async {
    lc.Location location = new lc.Location();
    bool _serviceEnabled;
    lc.PermissionStatus _permissionGranted;
    lc.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == lc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != lc.PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  @override
  Future<void> sendMessage(BuyModel buy) async {
    final _numeberTest = '593983736422'; //Número del establecimiento
    final _latitude = buy.location.latitude;
    final _longitude = buy.location.longitude;
    final _generalUrlGoogleMaps =
        'https://www.google.com/maps/search/?api=1%26query=';
    final urlGoogleMaps = '$_generalUrlGoogleMaps$_latitude,$_longitude';
    final iniciomsj = 'Hola%20me%20gustaría%20adquirir%20lo%20siguiente:%20';
    final products = buy.products.map((element) {
      final mensaje = element + '%20';
      return mensaje;
    }).toString();
    final mensajeFinal =
        '$iniciomsj$products%20a%20la%20dirección%20$urlGoogleMaps%0D%0ASu%20total%20es%20de:%20${buy.total}%20USD%20Gracias%20por%20preferirnos.';
    final messageToSend = 'https://wa.me/$_numeberTest?text=$mensajeFinal';
    if (await canLaunch(messageToSend)) {
      await launch(messageToSend);
    } else {
      throw 'Could not launch $messageToSend';
    }
  }

  List<ProductsModel> _productAdded = [];
  @override
  void addProduct(ProductsModel product) {
    _productAdded.add(product);
  }

  @override
  List<ProductsModel> getProductsAdded() {
    return _productAdded;
  }
}
