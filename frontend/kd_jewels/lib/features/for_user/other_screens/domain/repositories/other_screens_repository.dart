import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';

abstract class OtherScreensRepository {

  Future<ApiResult<DataModel>> getData();

}