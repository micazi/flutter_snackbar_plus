import 'package:flutter/material.dart';

import '../models/configuration.dart';
import '../models/style.dart';

import 'base_snackbar.dart';

///
/// Templated Snackbar widget used as an easier way to section a snackbar as a tile. Mainly Leading Widget, Content Section, and
///Trailing Widget. Content Section can be either a Widget or the usage of both the [title], and [message] parameters. Used in
///combination with [FlutterSnackBarConfiguration] and [FlutterSnackBarStyle] classes.
///
class TemplatedSnackbar extends BaseSnackBar {
  TemplatedSnackbar({
    super.key,
    Widget? leading,
    String? title,
    String? message,
    Widget? content,
    Widget? trailing,
    required FlutterSnackBarConfiguration super.configuration,
    required FlutterSnackBarStyle super.style,
    required super.onDismissed,
  })  : assert(content != null && title == null ||
            title != null && content == null),
        super(
          child: Row(
            crossAxisAlignment: style.contentCrossAxisAlignment,
            children: [
              leading ?? Container(),
              leading != null
                  ? SizedBox(
                      width: style.leadingSpace,
                    )
                  : Container(),
              Expanded(
                child: content ??
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          title ?? '',
                          style: style.titleStyle,
                          textAlign: style.titleAlignment,
                        ),
                        message != null
                            ? SizedBox(
                                height: style.titleSpacing,
                              )
                            : Container(),
                        message != null
                            ? Text(
                                message,
                                style: style.messageStyle,
                                textAlign: style.messageAlignment,
                              )
                            : Container(),
                      ],
                    ),
              ),
              trailing != null
                  ? SizedBox(
                      width: style.trailingSpace,
                    )
                  : Container(),
              trailing ?? Container()
            ],
          ),
        );
}
