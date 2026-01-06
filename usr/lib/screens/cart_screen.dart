import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartProvider.cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      return ListTile(
                        leading: Image.network(item['imageUrl'], width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(item['name']),
                        subtitle: Text('Qty: ${item['quantity']} - $${item['price'] * item['quantity']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => cartProvider.removeFromCart(item['id']),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Total: $${cartProvider.totalPrice}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/checkout'),
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}