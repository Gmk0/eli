import 'package:eli/Test/CustomerDetailsPage.dart';
import 'package:flutter/material.dart';
import '../controller/CustomerControler.dart';
// Importez la nouvelle interface
import 'package:get/get.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  CustomerController customerController = Get.put(CustomerController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: register(context),
      ),
    );
  }

  Widget register(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: customerController.nom,
              decoration: const InputDecoration(
                labelText: 'Customer Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Le nom est requis.';
                }
                if (value.contains(RegExp(r'[0-9]'))) {
                  return 'Le nom ne doit pas contenir de chiffres.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: customerController.id,
              decoration: const InputDecoration(
                labelText: 'Customer Id',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'L\'ID est requis.';
                }
                if (int.tryParse(value) == null ||
                    int.parse(value) < 1 ||
                    int.parse(value) > 1000) {
                  return 'L\'ID doit être un nombre entre 1 et 1000.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: customerController.address,
              decoration: const InputDecoration(
                labelText: 'Customer Address',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Récupérer les valeurs saisies dans les champs de texte

                bool? isValid = _formKey.currentState?.validate();

                if (isValid!) {
                  customerController.enregistrerInformations();
                } else {
                  // Afficher un message d'erreur si la validation a échoué
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Veuillez corriger les erreurs dans le formulaire.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                // Enregistrer les informations à l'aide du contrôleur

                // Naviguer vers la page de détails du client après la soumission
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
