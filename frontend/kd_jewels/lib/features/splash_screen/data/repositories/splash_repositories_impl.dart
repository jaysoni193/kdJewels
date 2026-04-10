import '../../../../core/api/api_result.dart';
import '../../../../core/mixins/error_mixin.dart';
import '../datasources/splash_remote_datasource.dart';
import '../../domain/repositories/splash_repository.dart';
import '../model/data_model.dart';

class SplashRepositoriesImpl with ErrorMixin implements SplashRepository {
  final SplashRemoteDatasource _splashRemoteDatasource;

  SplashRepositoriesImpl({required SplashRemoteDatasource splashRemoteDatasource})
    : _splashRemoteDatasource = splashRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _splashRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
