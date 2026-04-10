import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class BaseResponse {
  bool? success;
  String? message;
  dynamic validationError;

  BaseResponse({
    this.success,
    this.message,
    this.validationError,
  });
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  String get error {
    if (validationError != null) {
      if (validationError is Map) {
        final key = (validationError as Map).keys.first;
        if (validationError[key] is List) {
          return (validationError[key] as List).first;
        }
        return validationError[key];
      }
    }
    return message ?? "";
  }
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class BasePageParams {
  int? total;
  int? currentPage;
  String? nextPageUrl;

  BasePageParams({
    this.total,
    this.currentPage,
    this.nextPageUrl,
  });
  factory BasePageParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BasePageParamsFromJson(json);

  Map<String, dynamic> toJson() => _$BasePageParamsToJson(this);
}
