import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/home_repository.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _homeRepository.getData();
  }
}
