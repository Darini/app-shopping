import 'package:dio/dio.dart';
import 'package:shopping/models/product_details.model.dart';
import 'package:shopping/models/product_list_item.model.dart';
import 'package:shopping/settings.dart';

class ProductRepository {
  Future<List<ProductItemListModel>> getAll() async {
    var url = '${Settings.apiUrl}v1/products';

    Response response = await Dio().get(url);

    return (response.data as List)
        .map((course) => ProductItemListModel.fromJson(course))
        .toList();
  }

  Future<List<ProductItemListModel>> getByCategory(String category) async {
    var url = '${Settings.apiUrl}v1/categories/$category/products';

    Response response = await Dio().get(url);

    return (response.data as List)
        .map((course) => ProductItemListModel.fromJson(course))
        .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = '${Settings.apiUrl}v1/products/$tag';

    Response response = await Dio().get(url);

    return ProductDetailsModel.fromJson(response.data);
  }
}
