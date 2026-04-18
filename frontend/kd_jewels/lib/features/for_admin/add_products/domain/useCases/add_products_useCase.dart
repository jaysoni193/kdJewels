import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/add_products_repository.dart';

class AddProductsUseCase {
  final AddProductsRepository _addProductsRepository;

  AddProductsUseCase({required AddProductsRepository addProductsRepository})
    : _addProductsRepository = addProductsRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _addProductsRepository.getData();
  }
}
