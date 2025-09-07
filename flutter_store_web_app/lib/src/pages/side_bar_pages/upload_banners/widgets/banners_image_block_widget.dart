import 'dart:typed_data';

import 'package:flutter/material.dart';

///This widget is use for displaying upload
///banner image block
///@params - onTapUploadImage: a call back helps upload image
///@params - imageBytes: input display image
///@params - imageBlockBackgroundColor: the background color of the block
///@params - title: Image block title when empty
class BannersImageBlockWidget extends StatelessWidget {
  final VoidCallback onTapUploadImage;
  final Uint8List? imageBytes;
  final Color? imageBlockBackGroundColor;
  final String? title;

  const BannersImageBlockWidget({
    Key? key,
    required this.onTapUploadImage,
    this.imageBlockBackGroundColor,
    this.title,
    this.imageBytes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Image block
        imageBytes != null
            ? SizedBox(
                width: 150,
                height: 150,
                child: Image.memory(
                  imageBytes!,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: imageBlockBackGroundColor ?? Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    title ?? "Category Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
        const SizedBox(
          height: 12,
        ),

        ///Upload button
        ElevatedButton(
          onPressed: onTapUploadImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 0,
          ),

          child: Text(
            "Upload Image",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
