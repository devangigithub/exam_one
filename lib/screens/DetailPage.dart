import 'package:flutter/material.dart';
import 'package:wallpepar_api/modal/modal_class.dart';
import 'package:wallpepar_api/screens/cartPage.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '₹${product.price}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                CartManager.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart!')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
