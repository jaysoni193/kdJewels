import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/collection_repository.dart';

class CollectionUseCase {
  final CollectionRepository _collectionRepository;

  CollectionUseCase({required CollectionRepository collectionRepository})
    : _collectionRepository = collectionRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _collectionRepository.getData();
  }
}
