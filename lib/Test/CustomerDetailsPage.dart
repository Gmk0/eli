import 'package:flutter/material.dart';
import '../controller/CustomerControler.dart';

class CustomerDetailsPage extends StatelessWidget {
  final CustomerController customerController;

  const CustomerDetailsPage({required this.customerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nom: ${customerController.nom.value}'),
            Text('ID: ${customerController.id.value}'),
            Text('Adresse: ${customerController.address.value}'),
          ],
        ),
      ),
    );
  }
}
