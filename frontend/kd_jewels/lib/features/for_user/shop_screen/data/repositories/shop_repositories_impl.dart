import '../../../../../core/api/api_result.dart';
import '../../../../../core/mixins/error_mixin.dart';
import '../../domain/repositories/shop_repository.dart';
import '../datasources/shop_remote_datasource.dart';
import '../model/data_model.dart';

class ShopRepositoriesImpl with ErrorMixin implements ShopRepository {
  final ShopRemoteDatasource _shopRemoteDatasource;

  ShopRepositoriesImpl({required ShopRemoteDatasource shopRemoteDatasource})
    : _shopRemoteDatasource = shopRemoteDatasource;

  @override
  Future<ApiResult<DataModel>> getData() async {
    try {
      final result = await _shopRemoteDatasource.getData();
      //final DataModel response = DataModel.fromJson(result.data);
      final DataModel response = DataModel();
      return ApiResult.success(data: response);
    } catch (e) {
      return handleAPIError<DataModel>(e);
    }
  }
}
