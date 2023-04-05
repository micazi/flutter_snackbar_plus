import 'package:flutter/material.dart';

import '../enums/exports.dart';

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
  //Location
  final FlutterSnackBarLocation? location;
  //Dismiss Direction
  final DismissDirection? dismissDirection;
  //Distance
  final double? distance;
  // Animation Type
  final FlutterSnackbarAnimation? animation;
  // Animation Curve
  final Curve? animationCurve;
  // Animation Duration
  final Duration? animationDuration;
  // ShowDuration
  final Duration? showDuration;
  // Dissmissable?
  final bool? dismissible;
  // Persistent
  final bool? persistent;
  // Show Loading Bar?
  final bool? showLoadingBar;
}
