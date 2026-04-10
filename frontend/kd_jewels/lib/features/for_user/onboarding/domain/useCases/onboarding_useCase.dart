import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/onboarding_repository.dart';

class OnboardingUseCase {
  final OnboardingRepository _onboardingRepository;

  OnboardingUseCase({required OnboardingRepository onboardingRepository})
      : _onboardingRepository = onboardingRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _onboardingRepository.getData();
  }
}
