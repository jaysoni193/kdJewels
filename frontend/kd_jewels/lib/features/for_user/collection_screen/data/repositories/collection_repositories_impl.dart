import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../../domain/repositories/collection_repository.dart';
import '../datasources/collection_remote_datasource.dart';
import '../model/data_model.dart';

class CollectionRepositoriesImpl with ErrorMixin implements CollectionRepository {
  final CollectionRemoteDatasource _collectionRemoteDatasource;

  CollectionRepositoriesImpl({required CollectionRemoteDatasource collectionRemoteDatasource})
      : _collectionRemoteDatasource = collectionRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _collectionRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
