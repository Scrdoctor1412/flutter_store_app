part of '../upload_banners_page.dart';

class UploadBannersPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UploadBannersPageViewmodel(),
    );
  }
}
