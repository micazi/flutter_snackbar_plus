import 'package:flutter/material.dart';

import '../enums/exports.dart';
import '../models/configuration.dart';
import '../models/style.dart';

///
/// Base Snackbar widget used as a base for both [TemplatedSnackbar] & [CustomSnackbar].
///
abstract class BaseSnackBar extends StatefulWidget {
  final FlutterSnackBarConfiguration? configuration;
  final FlutterSnackBarStyle? style;
  final Widget child;
  final VoidCallback onDismissed;

  const BaseSnackBar({
    Key? key,
    required this.child,
    required this.onDismissed,
    this.configuration = const FlutterSnackBarConfiguration(),
    this.style = const FlutterSnackBarStyle(),
  }) : super(key: key);

  @override
  State<BaseSnackBar> createState() => _BaseSnackBarState();
}

class _BaseSnackBarState extends State<BaseSnackBar> {
  double? top = -150;
  double? bottom = -150;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          if (widget.configuration!.location ==
              FlutterSnackBarLocation.bottom) {
            bottom = widget.configuration!.distance;
          } else if (widget.configuration!.location ==
              FlutterSnackBarLocation.top) {
            top = widget.configuration!.distance;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: widget.configuration!.location == FlutterSnackBarLocation.bottom
          ? bottom
          : null,
      top: widget.configuration!.location == FlutterSnackBarLocation.top
          ? top
          : null,
      curve: widget.configuration!.animationCurve!,
      onEnd: widget.configuration!.persistent!
          ? () {}
          : () async {
              await Future.delayed(
                widget.configuration!.showDuration!,
                () {
                  if (mounted) {
                    setState(
                      () {
                        if (widget.configuration!.location ==
                            FlutterSnackBarLocation.bottom) {
                          bottom = -150;
                        } else if (widget.configuration!.location ==
                            FlutterSnackBarLocation.top) {
                          top = -150.0;
                        }
                      },
                    );
                  }
                },
              );
            },
      duration: widget.configuration!.animationDuration!,
      child: SafeArea(
        bottom: false,
        child: Dismissible(
          key: UniqueKey(),
          direction: widget.configuration!.dismissible!
              ? widget.configuration!.dismissDirection!
              : DismissDirection.none,
          onDismissed: (direction) {
            if (widget.configuration!.persistent!) {
              widget.onDismissed.call();
            }
          },
          child: Container(
            margin: widget.style!.margin,
            width: MediaQuery.of(context).size.width -
                widget.style!.margin!.left -
                widget.style!.margin!.right,
            decoration: BoxDecoration(
                color: widget.style!.backgroundColor,
                borderRadius: widget.style!.radius,
                boxShadow: [widget.style!.shadow!]),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                widget.configuration!.showLoadingBar!
                    ? SizedBox(
                        height: widget.style!.loadingBarHeight,
                        child: ClipRRect(
                          borderRadius: widget.style!.loadingBarRadius,
                          clipBehavior: Clip.antiAlias,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                widget.style!.loadingBarColor),
                            minHeight: widget.style!.loadingBarHeight,
                            backgroundColor: widget.style!.loadingBarRailColor,
                          ),
                        ))
                    : Container(),
                Container(
                  padding: widget.style!.padding,
                  child: Material(
                    color: Colors.transparent,
                    child: widget.child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
