import '../../../../../core/constants/app_assets.dart';

class LatestProductModel {
  final String? backgroundImage;
  final String? buttonText;

  LatestProductModel({this.backgroundImage, this.buttonText});

  static List<LatestProductModel> latestProductCardList() {
    return [
      LatestProductModel(
          backgroundImage: AppAssets.temp,),
      LatestProductModel(
        backgroundImage: AppAssets.temp,),
    ];
  }
}
