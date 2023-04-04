```dart
import 'package:flutter/material.dart';

import './flutter_snackbar_plus.dart';

class FlutterSnackBarPlusDemo extends StatefulWidget {
  const FlutterSnackBarPlusDemo({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  _FlutterSnackBarPlusDemoState createState() =>
      _FlutterSnackBarPlusDemoState();
}

class _FlutterSnackBarPlusDemoState extends State<FlutterSnackBarPlusDemo> {
  @override
  void initState() {
    super.initState();
  }

  _onTap() async {
    FlutterSnackBar.showTemplated(
      context,
      title: 'This is an info title',
      message: "Make Sure to checkout this plugin and see how awesome it is!",
      leading: Icon(
        Icons.info,
        size: 32,
        color: Colors.green[700],
      ),
      trailing: const Text('trailing!'),
      style: FlutterSnackBarStyle(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        radius: BorderRadius.circular(6),
        backgroundColor: Colors.green[400],
        shadow: BoxShadow(
          color: Colors.black.withOpacity(0.55),
          blurRadius: 32,
          offset: const Offset(0, 12),
          blurStyle: BlurStyle.normal,
          spreadRadius: -10,
        ),
        leadingSpace: 22,
        trailingSpace: 12,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        titleStyle: const TextStyle(fontSize: 20, color: Colors.white),
        messageStyle:
            TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
        titleAlignment: TextAlign.start,
        messageAlignment: TextAlign.start,
        loadingBarColor: Colors.yellow,
        loadingBarRailColor: Colors.yellow.withOpacity(0.4),
      ),
      configuration: const FlutterSnackBarConfiguration(
        location: FlutterSnackBarLocation.bottom,
        distance: 35,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 500),
        showDuration: Duration(seconds: 3),
        persistent: true,
        dismissible: true,
        dismissDirection: DismissDirection.down,
        showLoadingBar: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: Colors.amber,
              child: InkWell(
                  onTap: _onTap,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                    child: Text("Create Dismissible SnackBar"),
                  )),
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
    //!SECTION
  }
}
```