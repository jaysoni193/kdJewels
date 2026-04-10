import '../../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_assets.dart';

class RelatedProductModel {
  final String? image;
  final String? productName;
  final String? productPrice;

  RelatedProductModel({
    this.image,
    this.productName,
    this.productPrice,
  });

  static List<RelatedProductModel> relatedProductsList() {
    return [
      RelatedProductModel(
        image: AppAssets.temp,
        productName: AppStrings.productName,
        productPrice: AppStrings.productPrice,
      ),
      RelatedProductModel(
        image: AppAssets.temp,
        productName: AppStrings.productName,
        productPrice: AppStrings.productPrice,
      ),
      RelatedProductModel(
        image: AppAssets.temp,
        productName: AppStrings.productName,
        productPrice: AppStrings.productPrice,
      ),
      RelatedProductModel(
        image: AppAssets.temp,
        productName: AppStrings.productName,
        productPrice: AppStrings.productPrice,
      ),
      RelatedProductModel(
        image: AppAssets.temp,
        productName: AppStrings.productName,
        productPrice: AppStrings.productPrice,
      ),
    ];
  }
}
