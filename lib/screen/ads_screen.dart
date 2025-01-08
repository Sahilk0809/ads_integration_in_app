import 'package:ads_integration_in_app/utils/ads_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdsHelper.adsHelper.loadBannerAd();
    AdsHelper.adsHelper.loadInterstitialAd();
    AdsHelper.adsHelper.loadRewardedAd();
    AdsHelper.adsHelper.loadOpenAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_sharp),
        title: const Text('Admob Ads'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: AdWidget(ad: AdsHelper.adsHelper.bannerAd!),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              if(AdsHelper.adsHelper.interstitialAd != null){
                await AdsHelper.adsHelper.interstitialAd!.show();
              }
            },
            child: const Text("Show Interstitial Ad"),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              if(AdsHelper.adsHelper.rewardedAd != null){
                await AdsHelper.adsHelper.rewardedAd!.show(
                  onUserEarnedReward: (ad, reward) {
                    debugPrint("Amount/Points of to earn => ${reward.amount}");
                  },
                );
              }
            },
            child: const Text("Show Rewarded Ad"),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              if(AdsHelper.adsHelper.appOpenAd != null){
                await AdsHelper.adsHelper.appOpenAd!.show();
              }
            },
            child: const Text("Show App Open Ad"),
          ),
        ],
      ),
    );
  }
}
