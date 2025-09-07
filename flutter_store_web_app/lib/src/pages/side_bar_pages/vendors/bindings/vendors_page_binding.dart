part of '../vendors_page.dart';

class VendorsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VendorsPageViewmodel(),
    );
  }
}
