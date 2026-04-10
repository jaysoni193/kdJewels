import '../../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_assets.dart';

class FeaturedProductModel {
  final String? productImage;
  final String? productName;
  final String? productPrice;
  final bool? isFav;

  FeaturedProductModel({this.productImage, this.productName, this.productPrice, this.isFav});

  static List<FeaturedProductModel> featuredProductsList() {
    return [
      FeaturedProductModel(productImage: AppAssets.temp, productName:AppStrings.productName, productPrice:AppStrings.productPrice, isFav: false),
      FeaturedProductModel(productImage: AppAssets.temp, productName:AppStrings.productName, productPrice:AppStrings.productPrice, isFav: false),
      FeaturedProductModel(productImage: AppAssets.temp, productName:AppStrings.productName, productPrice:AppStrings.productPrice, isFav: false),
      FeaturedProductModel(productImage: AppAssets.temp, productName:AppStrings.productName, productPrice:AppStrings.productPrice, isFav: false),
      FeaturedProductModel(productImage: AppAssets.temp, productName:AppStrings.productName, productPrice:AppStrings.productPrice, isFav: false),
      FeaturedProductModel(productImage: AppAssets.temp, productName:AppStrings.productName, productPrice:AppStrings.productPrice, isFav: false),
      FeaturedProductModel(productImage: AppAssets.temp, productName:AppStrings.productName, productPrice:AppStrings.productPrice, isFav: false),
    ];
  }
}
