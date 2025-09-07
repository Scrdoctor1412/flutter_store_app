import 'package:flutter_store_web_app/src/core/base/base_api_provider.dart';
import 'package:flutter_store_web_app/src/core/error/exception/api_exception.dart';
import 'package:flutter_store_web_app/src/models/banner.dart';

class BannersApiProvider extends BaseApiProvider {
  Future<Banner> addNewBanner(Banner banner) async {
    try {
      final res = await post('/banner', body: banner.toMap());
      return Banner.fromMap(res);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Banner>> getBanners() async {
    try {
      List<Banner> banners = [];
      final res = await get("/banner");
      if (res != null && res is List && res.isNotEmpty) {
        banners = res.map((e) => Banner.fromMap(e)).toList();
      }
      return banners;
    } on ApiException {
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
