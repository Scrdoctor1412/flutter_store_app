import 'package:flutter_store_web_app/src/pages/main/main_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/buyers/buyers_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/categories/categories_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/orders/orders_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/products/products_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/subcategory/subcategory_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/upload_banners/upload_banners_page.dart';
import 'package:flutter_store_web_app/src/pages/side_bar_pages/vendors/vendors_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'route_paths.dart';

class AppRouter {
  static String initial = MainPage.routeName;
  static final List<GetPage> routes = [
    GetPage(
      name: RoutePaths.mainPageRoute,
      page: () => const MainPage(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: RoutePaths.buyersPageRoute,
      page: () => const BuyersPage(),
      // binding: BuyerPageBinding(),
    ),
    GetPage(
      name: RoutePaths.categoriesPageRoute,
      page: () => const CategoriesPage(),
      // binding: CategoriesPageBinding(),
    ),
    GetPage(
      name: RoutePaths.ordersPageRoute,
      page: () => const OrdersPage(),
      // binding: OrderPageBinding(),
    ),
    GetPage(
      name: RoutePaths.productsPageRoute,
      page: () => const ProductsPage(),
      // binding: ProductsPageBinding(),
    ),
    GetPage(
      name: RoutePaths.uploadBannersPageRoute,
      page: () => const UploadBannersPage(),
      // binding: UploadBannersPageBinding(),
    ),
    GetPage(
      name: RoutePaths.vendorsPageRoute,
      page: () => const VendorsPage(),
      // binding: VendorsPageBinding(),
    ),
    GetPage(
      name: RoutePaths.subCategoryPageRoute,
      page: () => const SubcategoryPage(),
      // binding: VendorsPageBinding(),
    ),
  ];
}
