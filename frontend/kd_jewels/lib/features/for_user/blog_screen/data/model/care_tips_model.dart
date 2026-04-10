import '../../../../../../core/constants/app_strings.dart';

class CareTipsModel {
  final String? title;
  final String? subTitle;

  CareTipsModel({this.title,this.subTitle});

  static List<CareTipsModel> careAndTipsList() {
    return [
      CareTipsModel(title: AppStrings.nameOfType,subTitle: AppStrings.careAndTips),
      CareTipsModel(title: AppStrings.nameOfType,subTitle: AppStrings.careAndTips),
      CareTipsModel(title: AppStrings.nameOfType,subTitle: AppStrings.careAndTips),
    ];
  }
}
