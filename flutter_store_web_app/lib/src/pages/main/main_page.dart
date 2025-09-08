import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/navigation/app_router.dart';

import 'package:flutter_store_web_app/src/pages/main/main_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/buyers/buyers_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/categories/categories_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/orders/order_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/products/products_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/subcategory/subcategory_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/subcategory/subcategory_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/upload_banners/upload_banners_page_viewmodel.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/vendors/vendors_page_viewmodel.dart';
import 'package:get/get.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

part 'bindings/main_page_binding.dart';

class MainPage extends GetView<MainPageViewmodel> {
  static const String routeName = '/mainScreen';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Management',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: GetBuilder<MainPageViewmodel>(
        builder: (controller) {
          return controller.selectedRoute;
        },
      ),
      sideBar: SideBar(
        onSelected: (item) {
          controller.onSelected(item.route!);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              'Multi Vendor Admin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.7,
              ),
            ),
          ),
        ),
        items: [
          AdminMenuItem(
            title: "Vendors",
            route: RoutePaths.vendorsPageRoute,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: "Buyers",
            route: RoutePaths.buyersPageRoute,
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: "Orders",
            route: RoutePaths.ordersPageRoute,
            icon: CupertinoIcons.shopping_cart,
          ),
          AdminMenuItem(
            title: "Categories",
            route: RoutePaths.categoriesPageRoute,
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: "Sub Categories",
            route: RoutePaths.subCategoryPageRoute,
            icon: Icons.category_outlined,
          ),
          AdminMenuItem(
            title: "Upload Banners",
            route: RoutePaths.uploadBannersPageRoute,
            icon: Icons.add,
          ),
          AdminMenuItem(
            title: "Products",
            route: RoutePaths.productsPageRoute,
            icon: Icons.store,
          ),
        ],
        selectedRoute: "",
      ),
    );
  }
}
