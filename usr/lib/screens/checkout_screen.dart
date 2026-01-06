import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _paymentMethod = 'Credit Card'; // Mock

  void _processPayment() {
    // TODO: Integrate real payment API (e.g., Shopify Payments or Stripe) via Supabase once connected
    if (_formKey.currentState!.validate()) {
      // Mock success
      Provider.of<CartProvider>(context, listen: false).clearCart();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment successful!')));
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Total: \$${cartProvider.totalPrice}'),
              TextFormField(validator: (value) => value!.isEmpty ? 'Required' : null, decoration: const InputDecoration(labelText: 'Name')),
              TextFormField(validator: (value) => value!.isEmpty ? 'Required' : null, decoration: const InputDecoration(labelText: 'Address')),
              DropdownButtonFormField(
                value: _paymentMethod,
                items: ['Credit Card', 'PayPal'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) => setState(() => _paymentMethod = value!),
              ),
              const Spacer(),
              ElevatedButton(onPressed: _processPayment, child: const Text('Pay Now')),
            ],
          ),
        ),
      ),
    );
  }
}
