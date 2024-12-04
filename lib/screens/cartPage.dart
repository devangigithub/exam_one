import 'package:flutter/material.dart';
import 'package:wallpepar_api/modal/modal_class.dart';

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CartManager {
  static const _cartKey = 'cart';

  // Fetch the cart from SharedPreferences
  static Future<List<Product>> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(_cartKey);
    if (cartString != null) {
      List<dynamic> cartList = jsonDecode(cartString);
      return cartList.map((item) => Product.fromJson(item)).toList();
    }
    return [];
  }

  // Save the cart to SharedPreferences
  static Future<void> addToCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    final cart = await getCart();

    // Add the new product to the cart
    cart.add(product);

    // Save the updated cart back to SharedPreferences
    final cartString = jsonEncode(cart.map((item) => item.toJson()).toList());
    await prefs.setString(_cartKey, cartString);
  }
}


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = CartManager.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            leading: Image.network(product.image, width: 50, height: 50),
            title: Text(product.title),
            subtitle: Text('₹${product.price}'),
          );
        },
      ),
    );
  }
}
