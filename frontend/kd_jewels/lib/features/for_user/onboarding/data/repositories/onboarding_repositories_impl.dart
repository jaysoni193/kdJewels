import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_remote_datasource.dart';
import '../model/data_model.dart';

class OnboardingRepositoriesImpl with ErrorMixin implements OnboardingRepository {
  final OnboardingRemoteDatasource _onboardingRemoteDatasource;

  OnboardingRepositoriesImpl({required OnboardingRemoteDatasource onboardingRemoteDatasource})
    : _onboardingRemoteDatasource = onboardingRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _onboardingRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
