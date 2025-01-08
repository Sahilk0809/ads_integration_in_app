import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  AdsHelper._();

  static AdsHelper adsHelper = AdsHelper._();

  BannerAd? bannerAd;

  // TODO: replace this test ad unit with your own ad unit.
  // final adUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-3940256099942544/9214589741'
  //     : 'ca-app-pub-3940256099942544/2435281174';

  void loadBannerAd() async {
    bannerAd = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/9214589741",
      request: const AdRequest(),
      listener: const BannerAdListener(
          // Called when an ad is successfully received.
          // onAdLoaded: (ad) {
          //   debugPrint('$ad loaded.');
          // },
          // Called when an ad request failed.
          // onAdFailedToLoad: (ad, err) {
          //   debugPrint('BannerAd failed to load: $error');
          //   // Dispose the ad here to free resources.
          //   ad.dispose();
          // },
          ),
      size: AdSize.banner,
    )..load();
  }

  InterstitialAd? interstitialAd;

  // TODO: replace this test ad unit with your own ad unit.
  // final adUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-3940256099942544/1033173712'
  //     : 'ca-app-pub-3940256099942544/4411468910';

  /// Loads an interstitial ad.
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          // debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          interstitialAd = ad;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  RewardedAd? rewardedAd;

  // TODO: replace this test ad unit with your own ad unit.
  // final adUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-3940256099942544/5224354917'
  //     : 'ca-app-pub-3940256099942544/1712485313';

  /// Loads a rewarded ad.
  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          // debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          rewardedAd = ad;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  AppOpenAd? appOpenAd;

  void loadOpenAds() {
    AppOpenAd.load(
      adUnitId: "ca-app-pub-3940256099942544/9257395921",
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          debugPrint("Failed Open Ad: $error");
        },
      ),
    );
  }
}
