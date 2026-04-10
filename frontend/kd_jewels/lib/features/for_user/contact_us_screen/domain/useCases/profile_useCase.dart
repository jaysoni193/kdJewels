import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _profileRepository.getData();
  }
}
