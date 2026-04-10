import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../datasources/home_remote_datasource.dart';
import '../../domain/repositories/home_repository.dart';
import '../model/data_model.dart';

class HomeRepositoriesImpl with ErrorMixin implements HomeRepository {
  final HomeRemoteDatasource _homeRemoteDatasource;

  HomeRepositoriesImpl({required HomeRemoteDatasource homeRemoteDatasource})
    : _homeRemoteDatasource = homeRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _homeRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
