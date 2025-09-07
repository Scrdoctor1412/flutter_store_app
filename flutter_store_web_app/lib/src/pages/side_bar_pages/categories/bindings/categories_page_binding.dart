part of '../categories_page.dart';

class CategoriesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CategoriesPageViewmodel(),
    );
  }
}
