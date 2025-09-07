import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/products/products_page_viewmodel.dart';
import 'package:get/get.dart';

part 'bindings/products_page_binding.dart';

class ProductsPage extends GetView<ProductsPageViewmodel> {
  static const String routeName = "/productsPage";
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Container(
      child: Text("Products Page"),
    );
  }
}
