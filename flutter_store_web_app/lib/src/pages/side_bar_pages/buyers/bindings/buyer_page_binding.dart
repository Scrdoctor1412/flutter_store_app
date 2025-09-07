part of '../buyers_page.dart';

class BuyerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BuyersPageViewmodel(),
    );
  }
}
