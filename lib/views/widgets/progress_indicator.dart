import 'dart:ui';

import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

progressIndicator(BuildContext? context, {String? message}) {
  showGeneralDialog(
    context: context!,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return FadeTransition(
          opacity: animation,
          child: OverlayWidget(
            message: message ?? "Loading",
          ));
    },
  );
}

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  final countdown = ValueNotifier<int>(60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () async => true,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: Colors.white10,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(alignment: Alignment.center, children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          )),
                      Center(
                          child: AppIcons(
                        icons: "splash",
                        size: 25,
                        color: primaryColor,
                      )),
                    ]),
                    const SizedBox(height: 10.0),
                    Text("${widget.message}")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
