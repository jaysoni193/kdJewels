import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../datasources/admin_dashboard_remote_datasource.dart';
import '../../domain/repositories/admin_dashboard_repository.dart';
import '../model/data_model.dart';

class AdminDashboardRepositoriesImpl with ErrorMixin implements AdminDashboardRepository {
  final AdminDashboardRemoteDatasource _adminDashboardRemoteDatasource;

  AdminDashboardRepositoriesImpl({
    required AdminDashboardRemoteDatasource adminDashboardRemoteDatasource,
  }) : _adminDashboardRemoteDatasource = adminDashboardRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _adminDashboardRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
