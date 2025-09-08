import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/upload_banners/upload_banners_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/upload_banners/widgets/banners_image_block_widget.dart';
import 'package:get/get.dart';

part 'bindings/upload_banners_page_binding.dart';

class UploadBannersPage extends GetView<UploadBannersPageViewmodel> {
  static const String routeName = '/uploadBannersPage';

  const UploadBannersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Banners',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            height: 30,
          ),

          ///Banner image block
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                GetBuilder<UploadBannersPageViewmodel>(
                  builder: (controller) {
                    return BannersImageBlockWidget(
                      onTapUploadImage: () => controller.pickImage(),
                      imageBytes: controller.image,
                      title: "Banner Image",
                    );
                  },
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    controller.onSaveBanner();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
          ),

          ///Shows all of the banner images
          GetBuilder<UploadBannersPageViewmodel>(
            builder: (controller) {
              return controller.isLoadingImage
                  ? const CircularProgressIndicator()
                  : controller.banners.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        children: [
                          ...List.generate(
                            controller.banners.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(
                                right: 12,
                              ),
                              child: SizedBox(
                                // width: 40,
                                height: 60,
                                child: Image.network(
                                  controller.banners[index].image,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Text("No banners found"),
                    );
            },
          ),
        ],
      ),
    );
  }
}
