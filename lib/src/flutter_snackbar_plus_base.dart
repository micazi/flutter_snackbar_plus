import 'package:flutter/material.dart';

import 'models/configuration.dart';
import 'models/style.dart';
import 'widgets/exports.dart';

///
/// Minimal library to handle SnackBars with elaborate list of configuration & style options.
///
class FlutterSnackBar {
  static List<OverlayEntry> entries = [];
  //
  static FlutterSnackBarConfiguration? defaultConfiguration;
  static FlutterSnackBarStyle? defaultStyle;

  ///
  /// Initialize the instance with default [FlutterSnackBarConfiguration] & [FlutterSnackBarStyle].
  ///
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
  static void showTemplated(
    BuildContext context, {
    ///
    /// Leading Widget for the SnackBar.
    ///
    Widget? leading,

    ///
    /// Title parameter for the SnackBar.
    ///
    required String title,

    ///
    /// Message parameter for the SnackBar.
    ///
    String? message,

    ///
    /// Main Content Widget for the SnackBar, Should not be used with the [title] & [message] parameters.
    ///
    Widget? content,

    ///
    /// Trailing Widget for the SnackBar.
    ///
    Widget? trailing,

    ///
    /// Styling parameter for the SnackBar.
    ///
    FlutterSnackBarStyle? style,

    ///
    /// Configuration parameter for the SnackBar.
    ///
    FlutterSnackBarConfiguration? configuration,
  }) {
    // Overlay State
    final overlayState = Overlay.of(context);
    // Overlay Entry
    OverlayEntry? snackBar;
    // Build Overlay Entry
    snackBar = OverlayEntry(
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
                if (snackBar != null) {
                  entries.remove(snackBar);
                  snackBar.remove();
                }
              }
            : () {},
      ),
    );

    // Add Overlay Entry
    entries.add(snackBar);
    // Show Overlay Entry
    overlayState.insert(snackBar);
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
        entries.remove(snackBar);
        snackBar!.remove();
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
    final overlayState = Overlay.of(context);
    // Overlay Entry
    OverlayEntry? snackBar;
    // Build Overlay Entry
    snackBar = OverlayEntry(
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
                if (snackBar != null) {
                  entries.remove(snackBar);
                  snackBar.remove();
                }
              }
            : () {},
      ),
    );

    // Add Overlay Entry
    entries.add(snackBar);
    // Show Overlay Entry
    overlayState.insert(snackBar);
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
        entries.remove(snackBar);
        snackBar!.remove();
      });
    }
  }
}
