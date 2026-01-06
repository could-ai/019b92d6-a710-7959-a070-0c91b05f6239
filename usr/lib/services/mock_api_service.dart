import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class MockApiService {
  static const String _baseUrl = 'https://mockapi.example.com'; // Placeholder for Shopify API

  // TODO: Replace with real Shopify Storefront API once Supabase is connected for secret storage
  static Future<List<Product>> fetchProducts() async {
    // Mock data for fast processing - simulates Shopify product listings
    return [
      Product(
        id: '1',
        name: 'Wireless Headphones',
        description: 'High-quality sound with noise cancellation.',
        price: 99.99,
        imageUrl: 'assets/images/headphones.jpg',
        categories: ['Electronics', 'Audio'],
      ),
      // Add more mock products...
    ];
  }

  // Mock AI backend task: Inventory forecasting
  static Future<String> getAiForecast() async {
    // TODO: Integrate real AI API (e.g., OpenAI) via Supabase Edge Function once secrets are stored
    return 'Forecast: High demand for electronics this month.';
  }
}