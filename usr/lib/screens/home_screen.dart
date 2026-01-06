import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../services/mock_api_service.dart';
import '../models/product.dart';
import '../widgets/ad_banner.dart';
import '../widgets/ai_chatbot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [];
  bool _isPremium = false; // Mock premium status

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final products = await MockApiService.fetchProducts();
    setState(() => _products = products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => Navigator.pushNamed(context, '/cart')),
          IconButton(icon: const Icon(Icons.person), onPressed: () => Navigator.pushNamed(context, '/profile')),
        ],
      ),
      body: Column(
        children: [
          if (!_isPremium) const AdBanner(), // Ads for free users
          const AiChatbot(), // Mock AI for recommendations
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/product', arguments: product),
                  child: Card(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.imageUrl,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('$${product.price}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}