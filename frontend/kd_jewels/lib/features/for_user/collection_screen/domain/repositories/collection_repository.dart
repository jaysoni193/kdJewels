import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';

abstract class CollectionRepository {

  Future<ApiResult<DataModel>> getData();

}