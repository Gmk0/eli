import 'package:eli/Test/CustomerDetailsPage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class CustomerController extends GetxController {
  // Variables pour stocker les informations du client
  TextEditingController nom = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController address = TextEditingController();

  // Fonction pour enregistrer les informations du client
  void enregistrerInformations() {
    // Enregistrez les informations dans SharedPreferences ou votre méthode de stockage préférée ici
    // Exemple avec SharedPreferences :
    _enregistrerDansSharedPreferences(nom.text, id.text, address.text);
  }

  // Fonction pour enregistrer dans SharedPreferences
  Future<void> _enregistrerDansSharedPreferences(
      String nom, String id, String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nom', nom);
    await prefs.setString('id', id);
    await prefs.setString('address', address);
  }

  // Fonction pour charger les informations depuis SharedPreferences
  Future<void> chargerInformationsDepuisSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nom.text = prefs.getString('nom') ?? '';
    id.text = prefs.getString('id') ?? '';
    address.text = prefs.getString('address') ?? '';
  }
}
