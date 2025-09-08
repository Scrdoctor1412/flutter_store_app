import 'package:flutter_store_web_app/src/core/base/base_view_model.dart';
import 'package:flutter_store_web_app/src/core/global/global_variable.dart';
import 'package:flutter_store_web_app/src/models/category.dart';

class SubcategoryPageViewmodel extends GetViewModelBase {
  late Category catDropDownValue;
  List<Category> categories = [];

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() async {
    categories = await fetchCategories();
    catDropDownValue = categories.first;
    update();
  }

  void onChangeDropDownValue(value) {
    catDropDownValue = value;
    update();
  }

  Future<List<Category>> fetchCategories() async {
    List<Category> categories = [];
    final res = await apiCategory.getAllCategories();
    if (res.isNotEmpty) {
      categories = res.map((e) => e).toList();
    }
    return categories;
  }
}
