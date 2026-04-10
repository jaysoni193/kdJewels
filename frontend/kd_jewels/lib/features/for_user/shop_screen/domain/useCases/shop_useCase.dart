import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/shop_repository.dart';

class ShopUseCase {
  final ShopRepository _shopRepository;

  ShopUseCase({required ShopRepository shopRepository})
    : _shopRepository = shopRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _shopRepository.getData();
  }
}
