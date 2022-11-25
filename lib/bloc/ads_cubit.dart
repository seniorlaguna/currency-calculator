import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsCubit extends Cubit<bool> {

  static AdsCubit of(BuildContext context) => BlocProvider.of<AdsCubit>(context);

  AdsCubit(super.initialState);
  BannerAd? banner;

  Future<void> init() async {
    banner = BannerAd(
      adUnitId: "ca-app-pub-7519220681088057/4344383854",
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: _onAdLoaded),
    )..load();
  }

  void _onAdLoaded(Ad ad) {
    emit(true);
  }
}
