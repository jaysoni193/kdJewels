import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../model/data_model.dart';

class DashboardRepositoriesImpl with ErrorMixin implements DashboardRepository {
  final DashboardRemoteDatasource _dashboardRemoteDatasource;

  DashboardRepositoriesImpl({
    required DashboardRemoteDatasource dashboardRemoteDatasource,
  }) : _dashboardRemoteDatasource = dashboardRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _dashboardRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
