part of '../main_page.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => MainPageViewmodel())
      ..put(VendorsPageViewmodel())
      ..put(BuyersPageViewmodel())
      ..put(OrderPageViewmodel())
      ..put(CategoriesPageViewmodel())
      ..put(UploadBannersPageViewmodel())
      ..put(ProductsPageViewmodel())
      ..put(SubcategoryPageViewmodel());
  }
}
