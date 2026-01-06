import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  void addToCart(Map<String, dynamic> product) {
    final existingIndex = _cartItems.indexWhere((item) => item['id'] == product['id']);
    if (existingIndex != -1) {
      _cartItems[existingIndex]['quantity'] += 1;
    } else {
      _cartItems.add({...product, 'quantity': 1});
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _cartItems.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}