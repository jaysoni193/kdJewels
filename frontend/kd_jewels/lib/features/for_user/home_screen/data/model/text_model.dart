import '../../../../../../core/constants/app_strings.dart';

class TextModel {
  final String? text;

  TextModel({this.text});

  static List<TextModel> careAndTips() {
    return [
      TextModel(text: AppStrings.nameOfType),
    ];
  }
}
