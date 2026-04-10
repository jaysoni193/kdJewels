import '../../../../../core/api/api_result.dart';
import '../../data/model/data_model.dart';
import '../repositories/blog_repository.dart';

class BlogUseCase {
  final BlogRepository _blogRepository;

  BlogUseCase({required BlogRepository blogRepository})
    : _blogRepository = blogRepository;

  Future<ApiResult<DataModel>> call() async {
    return await _blogRepository.getData();
  }
}
