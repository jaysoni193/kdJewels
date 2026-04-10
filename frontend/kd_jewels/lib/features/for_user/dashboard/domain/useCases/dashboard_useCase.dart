import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/dashboard_repository.dart';

class DashboardUseCase {
  final DashboardRepository _dashboardRepository;

  DashboardUseCase({required DashboardRepository dashboardRepository})
    : _dashboardRepository = dashboardRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _dashboardRepository.getData();
  }
}
