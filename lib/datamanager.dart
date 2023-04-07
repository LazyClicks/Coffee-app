import 'dart:convert';

import 'package:flutter_application_2/datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  fetchMenu() async {
    String url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      var body = responce.body;
      _menu = [];
      var decodeData = jsonDecode(body) as List<dynamic>;
      for (var json in decodeData) {
        _menu?.add(Category.fromJson(json));
      }
    }
    return responce;
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  cartAdd(Product p) {
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
      } else {
        cart.add(ItemInCart(product: p, quantity: 1));
      }
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
