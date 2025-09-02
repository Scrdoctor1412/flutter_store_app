// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/1.png
  AssetGenImage get a1 => const AssetGenImage('assets/icons/1.png');

  /// File path: assets/icons/2.png
  AssetGenImage get a2 => const AssetGenImage('assets/icons/2.png');

  /// File path: assets/icons/3.png
  AssetGenImage get a3 => const AssetGenImage('assets/icons/3.png');

  /// File path: assets/icons/arrow.png
  AssetGenImage get arrow => const AssetGenImage('assets/icons/arrow.png');

  /// File path: assets/icons/bell.png
  AssetGenImage get bell => const AssetGenImage('assets/icons/bell.png');

  /// File path: assets/icons/cam.png
  AssetGenImage get cam => const AssetGenImage('assets/icons/cam.png');

  /// File path: assets/icons/camera.png
  AssetGenImage get camera => const AssetGenImage('assets/icons/camera.png');

  /// File path: assets/icons/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/icons/cart.png');

  /// File path: assets/icons/cartb.png
  AssetGenImage get cartb => const AssetGenImage('assets/icons/cartb.png');

  /// File path: assets/icons/delete.png
  AssetGenImage get delete => const AssetGenImage('assets/icons/delete.png');

  /// File path: assets/icons/edit.png
  AssetGenImage get edit => const AssetGenImage('assets/icons/edit.png');

  /// File path: assets/icons/email.png
  AssetGenImage get email => const AssetGenImage('assets/icons/email.png');

  /// File path: assets/icons/help.png
  AssetGenImage get help => const AssetGenImage('assets/icons/help.png');

  /// File path: assets/icons/history.png
  AssetGenImage get history => const AssetGenImage('assets/icons/history.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icons/icon.png');

  /// File path: assets/icons/logout.png
  AssetGenImage get logout => const AssetGenImage('assets/icons/logout.png');

  /// File path: assets/icons/love.png
  AssetGenImage get love => const AssetGenImage('assets/icons/love.png');

  /// File path: assets/icons/mart.png
  AssetGenImage get mart => const AssetGenImage('assets/icons/mart.png');

  /// File path: assets/icons/message.png
  AssetGenImage get message => const AssetGenImage('assets/icons/message.png');

  /// File path: assets/icons/not.png
  AssetGenImage get not => const AssetGenImage('assets/icons/not.png');

  /// File path: assets/icons/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/icons/notification.png');

  /// File path: assets/icons/orders.png
  AssetGenImage get orders => const AssetGenImage('assets/icons/orders.png');

  /// File path: assets/icons/password.png
  AssetGenImage get password =>
      const AssetGenImage('assets/icons/password.png');

  /// File path: assets/icons/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/icons/profile.png');

  /// File path: assets/icons/searc1.png
  AssetGenImage get searc1 => const AssetGenImage('assets/icons/searc1.png');

  /// File path: assets/icons/search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/search.png');

  /// File path: assets/icons/searchBanner.jpeg
  AssetGenImage get searchBanner =>
      const AssetGenImage('assets/icons/searchBanner.jpeg');

  /// File path: assets/icons/user.jpeg
  AssetGenImage get userJpeg => const AssetGenImage('assets/icons/user.jpeg');

  /// File path: assets/icons/user.png
  AssetGenImage get userPng => const AssetGenImage('assets/icons/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    a1,
    a2,
    a3,
    arrow,
    bell,
    cam,
    camera,
    cart,
    cartb,
    delete,
    edit,
    email,
    help,
    history,
    home,
    icon,
    logout,
    love,
    mart,
    message,
    not,
    notification,
    orders,
    password,
    profile,
    searc1,
    search,
    searchBanner,
    userJpeg,
    userPng,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Illustration.png
  AssetGenImage get illustration =>
      const AssetGenImage('assets/images/Illustration.png');

  /// File path: assets/images/banner3.jpg
  AssetGenImage get banner3 => const AssetGenImage('assets/images/banner3.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [illustration, banner3];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
