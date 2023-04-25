import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// ignore: import_of_legacy_library_into_null_safe

showToast(BuildContext? context, String message, {bool isError = false}) {
  showToastWidget(
      SizedBox(
        width: MediaQuery.of(context!).size.width * 0.9,
        child: Material(
          color: isError ? Colors.white : primaryColor,
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isError ? Colors.red : appWhite),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: isError
                      ? Icon(
                          Icons.error,
                          color: appRedColor,
                          size: 42,
                        )
                      : Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: appWhite),
                          child: Center(
                              child: AppIcons(
                            icons: "splash",
                            size: 16,
                            color: primaryColor,
                          )),
                        ),
                ),
                Expanded(
                  child: Text(
                    message,
                    style: appTextStyle.copyWith(
                        color: isError ? appRedColor : appWhite, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      animation: StyledToastAnimation.slideFromTop,
      duration: const Duration(seconds: 4),
      position:
          const StyledToastPosition(align: Alignment.topCenter, offset: 40.0),
      reverseCurve: Curves.easeInCubic,
      context: context);
}

void showSuccessDialog(BuildContext context, String title, String message,
    String actionText,
    {bool hasClose = false, bool? dismissible}) async {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.black54,
      transitionBuilder: (context, a1, a2, widget) => Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                // elevation: ,
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                contentPadding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                content: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        transform: Matrix4.translationValues(13, -13, 0),
                        alignment: Alignment.topRight,
                        child: (!hasClose)
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.close,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 20),
                      Icon(
                        Icons.done_all_outlined,
                        color: appGreen,
                        size: 32,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 5),
//                    color: Colors.orange,
//                    padding: EdgeInsets.(: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 0, top: 10),
                              child: Text(
                                title,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: appTextStyle.copyWith(
                                    fontSize: 14,
                                    wordSpacing: 2,
                                    height: 1,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 15.0,
                                  top: 5),
                              child: Text(
                                message,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    height: 1.3,
                                    wordSpacing: 1.3,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                        child: customButton(
                            text: actionText,
                            function: (() {
                              Navigator.pop(context);
                            })),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: dismissible ?? true,
      barrierLabel: '',
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      });
}

void showErrorDialog(BuildContext context, String title, String message,
    String actionText, VoidCallback onClose,
    {bool hasClose = false}) async {
  showGeneralDialog(
    
      context: context,
      barrierColor: Colors.black54,
      
      
      transitionBuilder: (context, a1, a2, widget) => Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                
                // elevation: ,
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                contentPadding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                content: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        transform: Matrix4.translationValues(13, -13, 0),
                        alignment: Alignment.topRight,
                        child: (!hasClose)
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.close,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 10),
                      Icon(
                        Icons.error,
                        color: appRedColor,
                        size: 58,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 5),
//                    color: Colors.orange,
//                    padding: EdgeInsets.(: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 0, top: 10),
                              child: Text(
                                title,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14,
                                    wordSpacing: 2,
                                    height: 1,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 15.0,
                                  top: 5),
                              child: Text(
                                message,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    height: 1.3,
                                    wordSpacing: 1.3,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                        child:
                            customButton(text: actionText, function: onClose),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      transitionDuration: const Duration(milliseconds: 100),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      });
}

enum DialogType { error, success, warning }

extension DialogTypeEXT on DialogType {
  Icon get String {
    switch (this) {
      case DialogType.error:
        return Icon(
          Icons.error,
          color: appRedColor,
        );
      case DialogType.success:
        return Icon(
          Icons.done_all,
          color: appGreen,
        );
      case DialogType.warning:
        return Icon(
          Icons.warning_amber,
          color: Colors.yellow[200],
        );
    }
  }
}
