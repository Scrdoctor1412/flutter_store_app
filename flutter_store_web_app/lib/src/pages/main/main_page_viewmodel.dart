import 'package:flutter/material.dart';
import 'package:flutter_store_web_app/src/core/base/base_view_model.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/buyers/buyers_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/categories/categories_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/orders/orders_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/products/products_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/upload_banners/upload_banners_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/vendors/vendors_page.dart';

class MainPageViewmodel extends GetViewModelBase {
  Widget selectedRoute = VendorsPage();

  void onSelected(String route) {
    switch (route) {
      case VendorsPage.routeName:
        selectedRoute = VendorsPage();
        break;
      case BuyersPage.routeName:
        selectedRoute = BuyersPage();
        break;
      case OrdersPage.routeName:
        selectedRoute = OrdersPage();
        break;
      case CategoriesPage.routeName:
        selectedRoute = CategoriesPage();
        break;
      case UploadBannersPage.routeName:
        selectedRoute = UploadBannersPage();
        break;
      case ProductsPage.routeName:
        selectedRoute = ProductsPage();
        break;
      default:
        selectedRoute = VendorsPage();
        break;
    }
    update();
  }
}
