import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../../domain/repositories/blog_repository.dart';
import '../datasources/blog_remote_datasource.dart';
import '../model/data_model.dart';

class BlogRepositoriesImpl with ErrorMixin implements BlogRepository {
  final BlogRemoteDatasource _blogRemoteDatasource;

  BlogRepositoriesImpl({required BlogRemoteDatasource blogRemoteDatasource})
    : _blogRemoteDatasource = blogRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _blogRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
