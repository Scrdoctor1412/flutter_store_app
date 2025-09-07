import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/categories/categories_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/categories/widgets/categories_image_block_widget.dart';
import 'package:get/get.dart';

part 'bindings/categories_page_binding.dart';

class CategoriesPage extends GetView<CategoriesPageViewmodel> {
  static const String routeName = "/categoriesPage";
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: controller.formKey,
            child: Row(
              children: [
                GetBuilder<CategoriesPageViewmodel>(
                  id: CatGetBuilderId.categoriesImageBlock,
                  builder: (controller) {
                    return CategoriesImageBlockWidget(
                      onTapUploadImage: () => controller.pickCatImage(),
                      imageBytes: controller.catImage,
                    );
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 200,
                  // height: 60,
                  child: TextFormField(
                    controller: controller.catController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter category name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter category Name",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.onSaveCategory();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              GetBuilder<CategoriesPageViewmodel>(
                id: CatGetBuilderId.categoriesBannerImageBlock,
                builder: (controller) {
                  return CategoriesImageBlockWidget(
                    onTapUploadImage: () => controller.pickCatBannerImage(),
                    imageBytes: controller.catBannerImage,
                    title: 'Category Banner',
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
