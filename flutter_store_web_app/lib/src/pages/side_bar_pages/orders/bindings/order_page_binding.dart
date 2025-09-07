part of '../orders_page.dart';

class OrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => OrderPageViewmodel(),
    );
  }
}
