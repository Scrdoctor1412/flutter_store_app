part of '../products_page.dart';

class ProductsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductsPageViewmodel(),
    );
  }
}
