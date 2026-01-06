import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatefulWidget {
  const AdBanner({super.key});

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    // TODO: Load real ads once Supabase is connected for monetization
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test ID
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: _bannerAd != null ? AdWidget(ad: _bannerAd!) : const Text('Ad loading...'),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}