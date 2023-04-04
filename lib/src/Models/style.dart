import 'package:flutter/material.dart';

class FlutterSnackBarStyle {
  const FlutterSnackBarStyle({
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    this.margin = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
    this.radius = const BorderRadius.only(
        topLeft: Radius.circular(6),
        topRight: Radius.circular(6),
        bottomLeft: Radius.circular(6),
        bottomRight: Radius.circular(6)),
    this.shadow = const BoxShadow(
      color: Colors.black26,
      offset: Offset(0, 4),
      blurRadius: 12.0,
      spreadRadius: 1,
    ),
    this.backgroundColor = Colors.green,
    this.titleStyle = const TextStyle(),
    this.titleAlignment = TextAlign.start,
    this.messageAlignment = TextAlign.start,
    this.messageStyle = const TextStyle(),
    this.contentCrossAxisAlignment = CrossAxisAlignment.center,
    this.leadingSpace = 4.0,
    this.trailingSpace = 4.0,
    this.titleSpacing = 4.0,
    this.loadingBarHeight = 4.0,
    this.loadingBarRailColor = Colors.redAccent,
    this.loadingBarColor = Colors.red,
    this.loadingBarRadius = BorderRadius.zero,
  });
  // Padding
  final EdgeInsets? padding;
  // Margin
  final EdgeInsets? margin;
  // Radius
  final BorderRadius? radius;
  // Box Shadow
  final BoxShadow? shadow;
  // Background Color
  final Color? backgroundColor;
  // Title Style
  final TextStyle? titleStyle;
  // Title Allignment
  final TextAlign? titleAlignment;
  // Message Allignment
  final TextAlign? messageAlignment;
  // Message Style
  final TextStyle? messageStyle;
  // Leading Space
  final double? leadingSpace;
  // Content Cross Axis Allignment
  final CrossAxisAlignment contentCrossAxisAlignment;
  // Trailing Space
  final double? trailingSpace;
  // Title Spacing
  final double? titleSpacing;
  // Loading Bar Height
  final double? loadingBarHeight;
  // Loading Bar Empty Color
  final Color? loadingBarRailColor;
  // Loading Bar Loaded Color
  final Color? loadingBarColor;
  // Loading Bar Radius
  final BorderRadius loadingBarRadius;
  //
}
