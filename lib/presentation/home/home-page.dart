import 'package:flutter/material.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Realizar un pedido y enviar por whatsapp',
      )),
      body: Body(),
    );
  }
}
