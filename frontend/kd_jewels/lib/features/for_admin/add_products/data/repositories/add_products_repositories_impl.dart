import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../datasources/add_products_remote_datasource.dart';
import '../../domain/repositories/add_products_repository.dart';
import '../model/data_model.dart';

class AddProductsRepositoriesImpl with ErrorMixin implements AddProductsRepository {
  final AddProductsRemoteDatasource _addProductsRemoteDatasource;

  AddProductsRepositoriesImpl({
    required AddProductsRemoteDatasource addProductsRemoteDatasource,
  }) : _addProductsRemoteDatasource = addProductsRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _addProductsRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
