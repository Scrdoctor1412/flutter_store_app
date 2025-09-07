import 'dart:typed_data';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_store_web_app/src/core/base/base_view_model.dart';
import 'package:flutter_store_web_app/src/core/global/global_variable.dart';
import 'package:flutter_store_web_app/src/models/category.dart';
import 'package:http/http.dart' as http;

class CatGetBuilderId {
  CatGetBuilderId._();
  static const categoriesImageBlock = "categoriesImageBlock";
  static const categoriesBannerImageBlock = "categoriesBannerImageBlock";
}

class CategoriesPageViewmodel extends GetViewModelBase {
  Uint8List? catImage;
  Uint8List? catBannerImage;
  late TextEditingController catController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    catController = TextEditingController();
  }

  @override
  void dispose() {
    catController.dispose();
    super.dispose();
  }

  void pickCatImage() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (file != null) {
      catImage = file.files.first.bytes;
      update([CatGetBuilderId.categoriesImageBlock]);
    }
  }

  void pickCatBannerImage() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (file != null) {
      catBannerImage = file.files.first.bytes;
      update([CatGetBuilderId.categoriesBannerImageBlock]);
    }
  }

  void onSaveCategory() {
    if (formKey.currentState!.validate()) {
      // debugPrint(catController.text);
      if (catImage != null && catBannerImage != null) {
        _uploadCategory(catImage: catImage!, catBannerImage: catBannerImage!);
      }
    }
  }

  void _uploadCategory({
    required Uint8List catImage,
    required Uint8List catBannerImage,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dojjt9z3n", "q1tcpckx");

      //upload the image
      CloudinaryResponse catImageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          catImage,
          identifier: "catImage",
          folder: "categoryimages",
        ),
      );

      CloudinaryResponse catImageBannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          catBannerImage,
          identifier: "catBannerImage",
          folder: "categorybannerimages",
        ),
      );
      final catImgSecureUrl = catImageResponse.secureUrl;
      final catImgBannerSecureUrl = catImageBannerResponse.secureUrl;

      Category category = Category(
        id: "",
        name: catController.text,
        image: catImgSecureUrl,
        banner: catImgBannerSecureUrl,
      );

      var res = await apiCategory.addNewCategory(category);

      debugPrint(catImageResponse.secureUrl);
      debugPrint(catImageBannerResponse.secureUrl);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
