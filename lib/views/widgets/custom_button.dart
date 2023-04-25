import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import '../constants/textDecoration/text_decoration.dart';

class CustomMidButton extends StatelessWidget {
  const CustomMidButton(
      {Key? key,
      this.text,
      this.width,
      this.onTap,
      this.borderR,
      this.color,
      this.height,
      this.textColor,
      this.fontSize,
      this.borderColor})
      : super(key: key);

  final String? text;
  final Function()? onTap;
  final double? width, borderR, fontSize, height;
  final Color? color, textColor, borderColor;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height ?? 28,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: width ?? 1.0,
                    color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(borderR ?? 1),
              ),
              textStyle: appTextStyle.copyWith(color: textColor),
              backgroundColor: color ?? secondaryColor),
          onPressed: onTap ?? () {},
          child: Text("$text",
              style: appTextStyle.copyWith(
                  color: textColor,
                  fontSize: fontSize ?? 8,
                  fontWeight: FontWeight.w500))),
    );

    // return Container(
    //     height: 24,
    //     width: 80,
    //     decoration:
    //         BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    //     child: Center(
    //       child: Text(
    //         "$text",
    //         style: appTextStyle.copyWith(
    //             fontSize: 8,
    //             fontWeight: FontWeight.w500,
    //             color: const Color(0xffE5E5E5)),
    //       ),
    //     ));
  }
}



Widget customButton(
    {bool? enabled = true,
    VoidCallback? function,
    String? text,
    double? height,
    Color? backgroundColor,
    double? width}) {
  return InkWell(
    splashColor: Colors.white,
    onTap: enabled ?? false ? function : null,
    child: Container(
      height: 52,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (enabled ?? false ? primaryColor : primaryColor.withOpacity(.5)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        // border: backgroundColor != null
        //     ? Border.all(color: const Color(0xffE9ECEF), width: 2)
        //     : null,
      ),
      child: Center(
          child: Text(
        "$text",
        style: appTextStyle.copyWith(
            color: enabled == true ? appWhite : appWhite.withOpacity(.5),
            fontSize: 15,
            fontWeight: FontWeight.w500),
      )),
    ),
  );
}


Widget modalButton(
    {bool? enabled = true,
    VoidCallback? function,
    String? text,
    double? height,
    Color? backgroundColor,
    double? width}) {
  return Container(
    height: 52,
    decoration: BoxDecoration(
      color: backgroundColor ??
          (enabled ?? false ? primaryColor : primaryColor.withOpacity(.5)),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      // border: backgroundColor != null
      //     ? Border.all(color: const Color(0xffE9ECEF), width: 2)
      //     : null,
    ),
    child: Center(
        child: Text(
      "$text",
      style: appTextStyle.copyWith(
          color: enabled == true ? appWhite : appWhite.withOpacity(.5),
          fontSize: 15,
          fontWeight: FontWeight.w500),
    )),
  );
}
