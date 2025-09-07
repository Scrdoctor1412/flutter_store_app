import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/orders/order_page_viewmodel.dart';
import 'package:get/get.dart';

part 'bindings/order_page_binding.dart';

class OrdersPage extends GetView<OrderPageViewmodel> {
  static const String routeName = "/ordersPage";
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Container(
      child: Text("Orders Page"),
    );
  }
}
