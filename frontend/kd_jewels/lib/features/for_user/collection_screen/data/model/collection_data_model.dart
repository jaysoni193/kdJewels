import '../../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_assets.dart';

class CollectionDataModel {
  final String? image;
  final String? productName;
  final String? productPrice;
  final String? label;

  CollectionDataModel({this.image, this.productName, this.productPrice, this.label});

  static List<CollectionDataModel> collectionDataList() {
    return [
      CollectionDataModel(image: AppAssets.temp, productName: AppStrings.productName, productPrice: AppStrings.productPrice, label: AppStrings.label),
      CollectionDataModel(image: AppAssets.temp, productName: AppStrings.productName, productPrice: AppStrings.productPrice, label: AppStrings.label),
      CollectionDataModel(image: AppAssets.temp, productName: AppStrings.productName, productPrice: AppStrings.productPrice, label: AppStrings.label),
      CollectionDataModel(image: AppAssets.temp, productName: AppStrings.productName, productPrice: AppStrings.productPrice, label: AppStrings.label),
      CollectionDataModel(image: AppAssets.temp, productName: AppStrings.productName, productPrice: AppStrings.productPrice, label: ''),
    ];
  }
}
