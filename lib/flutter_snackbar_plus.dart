library flutter_snackbar_plus;

import 'package:flutter/material.dart';

import 'src/exports.dart';
export 'src/exports.dart';

///
/// Minimal library to handle SnackBars with elaborate list of configuration * style options.
///
class FlutterSnackBar {
  static List<OverlayEntry> entries = [];
  //
  static FlutterSnackBarConfiguration? defaultConfiguration;
  static FlutterSnackBarStyle? defaultStyle;

  initialize(
      {FlutterSnackBarConfiguration? configuration,
      FlutterSnackBarStyle? style}) {
    defaultConfiguration = configuration;
    defaultStyle = style;
  }

  ///
  /// Show [TemplatedSnackbar] with the provided parameters, for a list of available configuration & style parameters
  /// see [FlutterSnackBarConfiguration] and [FlutterSnackBarStyle].
  /// Make Sure to set as Dismissible when using persistence.
  ///
  static showTemplated(
    BuildContext context, {
    // Leading
    Widget? leading,
    // Main Content
    required String title,
    String? message,
    Widget? content,
    // Trailing
    Widget? trailing,
    // Style
    FlutterSnackBarStyle? style,
    // Configuration
    FlutterSnackBarConfiguration? configuration,
  }) {
    // Overlay State
    final _overlayState = Overlay.of(context);
    // Overlay Entry
    OverlayEntry? _snackBar;
    // Build Overlay Entry
    _snackBar = OverlayEntry(
      builder: (_) => TemplatedSnackbar(
        leading: leading,
        title: title,
        message: message,
        content: content,
        trailing: trailing,
        configuration: configuration ??
            defaultConfiguration ??
            const FlutterSnackBarConfiguration(),
        style: style ?? defaultStyle ?? const FlutterSnackBarStyle(),
        onDismissed: configuration?.persistent ??
                defaultConfiguration?.persistent ??
                false
            ? () {
                if (_snackBar != null) {
                  entries.remove(_snackBar);
                  _snackBar.remove();
                }
              }
            : () {},
      ),
    );

    // Add Overlay Entry
    entries.add(_snackBar);
    // Show Overlay Entry
    _overlayState.insert(_snackBar);
    // Dismess Overlay Entry after show duration
    if (!(configuration ??
            defaultConfiguration ??
            const FlutterSnackBarConfiguration())
        .persistent!) {
      Future.delayed((configuration ??
                      defaultConfiguration ??
                      const FlutterSnackBarConfiguration())
                  .showDuration! +
              ((configuration ??
                          defaultConfiguration ??
                          const FlutterSnackBarConfiguration())
                      .animationDuration! *
                  2))
          .then((_) {
        entries.remove(_snackBar);
        _snackBar!.remove();
      });
    }
  }

  ///
  /// Show [CustomSnackbar] with the provided parameters, for a list of available configuration & style parameters
  /// see [FlutterSnackBarConfiguration] and [FlutterSnackBarStyle].
  /// Make Sure to set as Dismissible when using persistence.
  ///
  static showCustom(
    BuildContext context, {
    required Widget child,
    // Style
    FlutterSnackBarStyle? style = const FlutterSnackBarStyle(),
    // Configuration
    FlutterSnackBarConfiguration? configuration =
        const FlutterSnackBarConfiguration(),
  }) {
    // Overlay State
    final _overlayState = Overlay.of(context);
    // Overlay Entry
    OverlayEntry? _snackBar;
    // Build Overlay Entry
    _snackBar = OverlayEntry(
      builder: (_) => CustomSnackbar(
        child: child,
        configuration: configuration ??
            defaultConfiguration ??
            const FlutterSnackBarConfiguration(),
        style: style ?? defaultStyle ?? const FlutterSnackBarStyle(),
        onDismissed: (configuration ??
                    defaultConfiguration ??
                    const FlutterSnackBarConfiguration())
                .persistent!
            ? () {
                if (_snackBar != null) {
                  entries.remove(_snackBar);
                  _snackBar.remove();
                }
              }
            : () {},
      ),
    );

    // Add Overlay Entry
    entries.add(_snackBar);
    // Show Overlay Entry
    _overlayState.insert(_snackBar);
    // Dismess Overlay Entry after show duration
    if (!(configuration ??
            defaultConfiguration ??
            const FlutterSnackBarConfiguration())
        .persistent!) {
      Future.delayed((configuration ??
                  defaultConfiguration ??
                  const FlutterSnackBarConfiguration())
              .showDuration!)
          .then((_) {
        entries.remove(_snackBar);
        _snackBar!.remove();
      });
    }
  }
}
