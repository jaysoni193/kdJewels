import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../datasources/other_screens_remote_datasource.dart';
import '../../domain/repositories/other_screens_repository.dart';
import '../model/data_model.dart';

class OtherScreensRepositoriesImpl with ErrorMixin implements OtherScreensRepository {
  final OtherScreensRemoteDatasource _otherScreensRemoteDatasource;

  OtherScreensRepositoriesImpl({
    required OtherScreensRemoteDatasource otherScreensRemoteDatasource,
  }) : _otherScreensRemoteDatasource = otherScreensRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _otherScreensRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
