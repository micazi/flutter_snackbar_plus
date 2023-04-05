import 'package:flutter/material.dart';

///
/// Base Styling for the [FlutterSnackBar].
///
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

  ///
  /// Overall padding for the SnackBar.
  ///
  final EdgeInsets? padding;

  ///
  /// Outside margin for the SnackBar.
  ///
  final EdgeInsets? margin;

  ///
  /// Border radius for the SnackBar.
  ///
  final BorderRadius? radius;

  ///
  /// Box shadow styling for the SnackBar.
  ///
  final BoxShadow? shadow;

  ///
  /// Background color of the SnackBar.
  ///
  final Color? backgroundColor;

  ///
  /// Text style for the title of the [TemplatedSnackBar]
  ///
  final TextStyle? titleStyle;

  ///
  /// Text alignment for the title of the [TemplatedSnackBar]
  ///
  final TextAlign? titleAlignment;

  ///
  /// Text alignment for the title of the [TemplatedSnackBar].
  ///
  final TextAlign? messageAlignment;

  ///
  /// Text style for the message of the [TemplatedSnackBar].
  ///
  final TextStyle? messageStyle;

  ///
  /// Leadign space between the leading widget & the content section of the [TemplatedSnackBar].
  ///
  final double? leadingSpace;

  ///
  /// CrossAxisAlignment of the leading widget, content section, and the trailing widget in the [TemplatedSnackBar].
  ///
  final CrossAxisAlignment contentCrossAxisAlignment;

  ///
  /// Trailing space between the trailing widget & the content section of the [TemplatedSnackBar].
  ///
  final double? trailingSpace;

  ///
  /// Spacing between the title & the message in the [TemplatedSnackBar].
  ///
  final double? titleSpacing;

  ///
  /// Height of the loading bar when enabled.
  ///
  final double? loadingBarHeight;

  ///
  /// Rail(empty) Color of the loading bar when enabled.
  ///
  final Color? loadingBarRailColor;

  ///
  /// Color of the loading bar when enabled.
  ///
  final Color? loadingBarColor;

  ///
  /// Border radius of the loading bar when enabled.
  ///
  final BorderRadius loadingBarRadius;
  //
}
