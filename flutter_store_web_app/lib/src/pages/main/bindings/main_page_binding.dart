part of '../main_page.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainPageViewmodel(),
    );
    Get.lazyPut(
      () => VendorsPageViewmodel(),
    );
    Get.lazyPut(
      () => BuyersPageViewmodel(),
    );
    Get.lazyPut(
      () => OrderPageViewmodel(),
    );
    Get.lazyPut(
      () => CategoriesPageViewmodel(),
    );
    Get.lazyPut(
      () => UploadBannersPageViewmodel(),
    );
    Get.lazyPut(
      () => ProductsPageViewmodel(),
    );
  }
}
