import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/buyers/buyers_page_viewmodel.dart';
import 'package:get/get.dart';

part 'bindings/buyer_page_binding.dart';

class BuyersPage extends GetView<BuyersPageViewmodel> {
  static const String routeName = '/buyersPage';
  const BuyersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Buyers Page"),
    );
  }
}
