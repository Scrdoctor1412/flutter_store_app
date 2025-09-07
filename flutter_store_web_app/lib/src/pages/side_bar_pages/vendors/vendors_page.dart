import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/vendors/vendors_page_viewmodel.dart';
import 'package:get/get.dart';

part 'bindings/vendors_page_binding.dart';

class VendorsPage extends GetView<VendorsPageViewmodel> {
  static const String routeName = "/vendorsPage";
  const VendorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Container(
      child: Text("Vendors Page"),
    );
  }
}
