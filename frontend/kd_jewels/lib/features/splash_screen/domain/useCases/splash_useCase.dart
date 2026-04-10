import '../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/splash_repository.dart';

class SplashUseCase {
  final SplashRepository _splashRepository;

  SplashUseCase({required SplashRepository splashRepository})
      : _splashRepository = splashRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _splashRepository.getData();
  }
}
