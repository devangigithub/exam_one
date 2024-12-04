//
//
// import 'package:flutter/material.dart';
// import 'package:wallpepar_api/helpaer/api_helper.dart';
// import '../modal/modal_class.dart';
//
//
// class CategoryProvider extends ChangeNotifier {
//   bool isLoading = true;
//   List<Product> products = [];
//   List<String> categories = [];
//   String selectedCategory = '';
//
//   CategoryProvider() {
//     fetchProducts();
//   }
//
//   Future<void> fetchProducts() async {
//     isLoading = true;
//     notifyListeners();
//     try {
//       List<dynamic> response = await ApiHelper.obj.getUserLit();
//       products = response.map((item) => Product.fromJson(item)).toList();
//       categories = products.map((e) => e.category).toSet().toList();
//       if (categories.isNotEmpty) selectedCategory = categories[0];
//     } catch (e) {
//       print("Error fetching products: $e");
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   void selectCategory(String category) {
//     selectedCategory = category;
//     notifyListeners();
//   }
//
//   List<Product> get filteredProducts {
//     if (selectedCategory.isEmpty) return products;
//     return products.where((p) => p.category == selectedCategory).toList();
//   }
// }