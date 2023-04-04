import 'package:flutter/material.dart';

import '../exports.dart';

///
/// Custom Snackbar widget to spicify custom content child. Used in combination with [FlutterSnackBarConfiguration] and
///[FlutterSnackBarStyle] classes.
///
class CustomSnackbar extends BaseSnackBar {
  const CustomSnackbar({
    super.key,
    required Widget child,
    required FlutterSnackBarConfiguration configuration,
    required FlutterSnackBarStyle style,
    required VoidCallback onDismissed,
  }) : super(
          configuration: configuration,
          style: style,
          onDismissed: onDismissed,
          child: child,
        );
}
