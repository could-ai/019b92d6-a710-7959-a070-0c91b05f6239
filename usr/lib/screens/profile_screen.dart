import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isPremium = false; // Mock - TODO: Fetch from Supabase auth
    bool _onFreeTrial = true; // Mock free trial status

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_onFreeTrial) const Text('Free Trial Active - Upgrade to Premium for ad-free experience'),
            if (!_isPremium)
              ElevatedButton(
                onPressed: () {
                  // TODO: Integrate premium payment via Supabase and real gateway
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Premium unlocked!')));
                },
                child: const Text('Upgrade to Premium'),
              ),
            const SizedBox(height: 20),
            // Mock API key input for Shopify integrations
            TextFormField(
              decoration: const InputDecoration(labelText: 'Shopify API Key (for integrations)'),
              obscureText: true,
            ),
            const Text('Note: API keys will be securely stored in Supabase once connected. Free trial features are limited.'),
          ],
        ),
      ),
    );
  }
}