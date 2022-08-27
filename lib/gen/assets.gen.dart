/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsProfileIconsGen {
  const $AssetsProfileIconsGen();

  /// File path: assets/profileIcons/cards.svg
  String get cards => 'assets/profileIcons/cards.svg';

  /// File path: assets/profileIcons/favorite.svg
  String get favorite => 'assets/profileIcons/favorite.svg';

  /// File path: assets/profileIcons/key.svg
  String get key => 'assets/profileIcons/key.svg';

  /// File path: assets/profileIcons/language.svg
  String get language => 'assets/profileIcons/language.svg';

  /// File path: assets/profileIcons/location.svg
  String get location => 'assets/profileIcons/location.svg';

  /// File path: assets/profileIcons/logout.svg
  String get logout => 'assets/profileIcons/logout.svg';

  /// File path: assets/profileIcons/mode.svg
  String get mode => 'assets/profileIcons/mode.svg';

  /// File path: assets/profileIcons/notification.svg
  String get notification => 'assets/profileIcons/notification.svg';

  /// File path: assets/profileIcons/orders.svg
  String get orders => 'assets/profileIcons/orders.svg';

  /// File path: assets/profileIcons/profile.svg
  String get profile => 'assets/profileIcons/profile.svg';
}

class Assets {
  Assets._();

  static const AssetGenImage carousel = AssetGenImage('assets/carousel.jpg');
  static const String checkout = 'assets/checkout.svg';
  static const String emptyCart = 'assets/emptyCart.svg';
  static const String intro = 'assets/intro.svg';
  static const AssetGenImage login = AssetGenImage('assets/login.jpg');
  static const AssetGenImage logoo = AssetGenImage('assets/logoo.png');
  static const $AssetsProfileIconsGen profileIcons = $AssetsProfileIconsGen();
  static const AssetGenImage splash = AssetGenImage('assets/splash.png');
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  String get path => _assetName;

  String get keyName => _assetName;
}
