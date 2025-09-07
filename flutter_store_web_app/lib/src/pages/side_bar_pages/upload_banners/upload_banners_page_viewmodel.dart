import 'dart:typed_data';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart' hide Banner;
import 'package:flutter_store_web_app/src/core/base/base_view_model.dart';
import 'package:flutter_store_web_app/src/core/global/global_variable.dart';
import 'package:flutter_store_web_app/src/models/banner.dart';

class UploadBannersPageViewmodel extends GetViewModelBase {
  Uint8List? image;
  List<Banner> banners = [];
  bool isLoadingImage = true;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    banners = await fetchBanners();
    update();
  }

  void pickImage() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (file != null) {
      image = file.files.first.bytes;
      update();
    }
  }

  void onSaveBanner() {
    if (image != null) {
      _uploadBanner(image!);
    }
  }

  void _uploadBanner(Uint8List image) async {
    try {
      final cloudinary = CloudinaryPublic("dojjt9z3n", "q1tcpckx");
      //upload the image
      CloudinaryResponse catImageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          image,
          identifier: "bannerImage",
          folder: "bannerimages",
        ),
      );

      final newBanner = Banner(id: "", image: catImageResponse.secureUrl);
      final res = await apiBanners.addNewBanner(newBanner);
      debugPrint(res.toString());
      debugPrint(catImageResponse.secureUrl);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Banner>> fetchBanners() async {
    List<Banner> banners = [];
    final res = await apiBanners.getBanners();
    if (res.isNotEmpty) {
      banners = res.map((e) => e).toList();
    }
    isLoadingImage = false;
    return banners;
  }
}
