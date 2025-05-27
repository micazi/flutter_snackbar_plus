import '../models/configuration.dart';
import '../models/style.dart';
import 'base_snackbar.dart';

///
/// Custom Snackbar widget to spicify custom content child. Used in combination with [FlutterSnackBarConfiguration] and
///[FlutterSnackBarStyle] classes.
///
class CustomSnackbar extends BaseSnackBar {
  const CustomSnackbar({
    super.key,
    required super.child,
    required FlutterSnackBarConfiguration super.configuration,
    required FlutterSnackBarStyle super.style,
    required super.onDismissed,
  });
}
