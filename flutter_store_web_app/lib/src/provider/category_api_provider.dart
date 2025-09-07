import 'package:flutter_store_web_app/src/core/base/base_api_provider.dart';
import 'package:flutter_store_web_app/src/core/error/exception/api_exception.dart';
import 'package:flutter_store_web_app/src/models/category.dart';

class CategoryApiProvider extends BaseApiProvider {
  Future<Category> addNewCategory(Category newCat) async {
    try {
      final res = await post('/category', body: newCat.toMap());
      return Category.fromMap(res);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw Exception(
        'Unknown error occurred while trying to add new category: $e',
      );
    }
  }

  Future<List<Category>> getAllCategories() async {
    try {
      final res = await get("/category");
      return res;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw Exception(
        'Unknown error occurred while trying to add new category: $e',
      );
    }
  }
}
