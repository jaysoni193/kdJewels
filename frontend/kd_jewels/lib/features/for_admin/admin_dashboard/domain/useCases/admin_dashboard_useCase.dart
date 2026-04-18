import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/admin_dashboard_repository.dart';

class AdminDashboardUseCase {
  final AdminDashboardRepository _adminDashboardRepository;

  AdminDashboardUseCase({required AdminDashboardRepository adminDashboardRepository})
    : _adminDashboardRepository = adminDashboardRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _adminDashboardRepository.getData();
  }
}
