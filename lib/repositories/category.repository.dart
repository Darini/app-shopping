import 'package:dio/dio.dart';
import 'package:shopping/models/category.model.dart';
import 'package:shopping/settings.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getAll() async {
    var url = '${Settings.apiUrl}v1/categories';

    Response response = await Dio().get(url);

    return (response.data as List)
        .map((course) => CategoryModel.fromJson(course))
        .toList();
  }
}
