import '../../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_assets.dart';

class ImgTextModel {
  final String? image;
  final String? text;

  ImgTextModel({this.image, this.text});

  static List<ImgTextModel> filterList() {
    return [
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
    ];
  }

  static List<ImgTextModel> spacialProductList() {
    return [
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
    ];
  }

  static List<ImgTextModel> productCategoryList() {
    return [
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
    ];
  }

  static List<ImgTextModel> trendingProductList() {
    return [
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
      ImgTextModel(image: AppAssets.temp, text: AppStrings.nameOfType),
    ];
  }
}
