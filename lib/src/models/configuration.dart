import 'package:flutter/material.dart';

import '../enums/exports.dart';

///
/// Base Configuration for the [FlutterSnackBar].
///
class FlutterSnackBarConfiguration {
  const FlutterSnackBarConfiguration({
    this.location = FlutterSnackBarLocation.bottom,
    this.dismissDirection = DismissDirection.up,
    this.distance = 35.0,
    this.animation = FlutterSnackbarAnimation.slide,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 500),
    this.showDuration = const Duration(seconds: 2),
    this.dismissible = false,
    this.showLoadingBar = false,
    this.persistent = false,
  });

  ///
  /// The location of the SnackBar.
  ///
  final FlutterSnackBarLocation? location;

  ///
  /// The direction to dismiss the SnackBar when [dismissible] is enabled.
  ///
  final DismissDirection? dismissDirection;

  ///
  /// The distance covered by the SnackBar for the [location].
  ///
  final double? distance;

  ///
  /// Animation type for the SnackBar.
  ///
  final FlutterSnackbarAnimation? animation;

  ///
  /// The animation curve of the SnackBar.
  ///
  final Curve? animationCurve;

  ///
  /// The animation duration of the SnackBar.
  ///
  final Duration? animationDuration;

  ///
  /// How long the SnackBar will be shown.
  ///
  final Duration? showDuration;

  ///
  /// Is the SnackBar dismissible?
  ///
  final bool? dismissible;

  ///
  /// Is the SnackBar persistent? (will discard the [showDuration] value).
  ///
  final bool? persistent;

  ///
  /// Show the loading bar?
  ///
  final bool? showLoadingBar;
}
