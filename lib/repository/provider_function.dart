import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/shared_prefs_keys.dart';
import 'package:hacker_kernel/entity/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderFunction with ChangeNotifier {
  List<Product> productList = [];

  Future<bool> addProduct(
      {required Product product, required BuildContext context}) async {
    if (productList
        .any((p) => p.name.toUpperCase() == product.name.toUpperCase())) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product Already Exist!")));
      }
      return false;
    } else {
      productList.add(product);
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String encodedProduct = jsonEncode(product.toMap());
      prefs.setString(product.id, encodedProduct);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product Added!")));
      }
      return true;
    }
  }

  void removeProduct({required Product product}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    productList.removeWhere((p) => p.id == product.id);
    notifyListeners();
    prefs.remove(product.id);
  }

  Future<void> getAllProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> listOfKeys = prefs.getKeys();
    productList.clear();
    for (String key in listOfKeys) {
      if (key == kToken) {
        continue;
      }
      String? encodedProduct = prefs.getString(key);
      if (encodedProduct != null) {
        Map<String, dynamic> productMap = jsonDecode(encodedProduct);
        Product product = Product.fromMap(productMap);
        productList.add(product);
      }
    }

    notifyListeners();
  }
}
