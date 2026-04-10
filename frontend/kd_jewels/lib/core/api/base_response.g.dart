// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      validationError: json['validation_error'],
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'validation_error': instance.validationError,
    };

BasePageParams _$BasePageParamsFromJson(Map<String, dynamic> json) =>
    BasePageParams(
      total: (json['total'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      nextPageUrl: json['next_page_url'] as String?,
    );

Map<String, dynamic> _$BasePageParamsToJson(BasePageParams instance) =>
    <String, dynamic>{
      'total': instance.total,
      'current_page': instance.currentPage,
      'next_page_url': instance.nextPageUrl,
    };
