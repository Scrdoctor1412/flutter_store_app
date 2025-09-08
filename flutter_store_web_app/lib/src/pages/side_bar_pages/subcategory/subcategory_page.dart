import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/models/category.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/subcategory/subcategory_page_viewmodel.dart';
import 'package:get/get.dart';

part 'bindings/subcategory_page_binding.dart';

class SubcategoryPage extends GetView<SubcategoryPageViewmodel> {
  static const routeName = "/subCategoryPage";
  const SubcategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Subcategories',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          GetBuilder<SubcategoryPageViewmodel>(
            builder: (controller) {
              return DropdownButton<Category>(
                hint: Text("Select Category"),
                value: controller.catDropDownValue,
                items: List.generate(
                  controller.categories.length,
                  (index) => DropdownMenuItem(
                    value: controller.categories[index],
                    child: Text(
                      controller.categories[index].name,
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.onChangeDropDownValue(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
