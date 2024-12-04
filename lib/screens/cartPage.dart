import 'package:flutter/material.dart';
import 'package:wallpepar_api/modal/modal_class.dart';

class CartManager {
  static final List<Product> _cart = [];

  static List<Product> get cart => _cart;

  static void addToCart(Product product) {
    _cart.add(product);
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
