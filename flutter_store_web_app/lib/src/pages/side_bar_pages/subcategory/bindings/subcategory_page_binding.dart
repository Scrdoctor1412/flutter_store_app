part of '../subcategory_page.dart';

class SubcategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubcategoryPageViewmodel>(
      () => SubcategoryPageViewmodel(),
    );
  }
}
