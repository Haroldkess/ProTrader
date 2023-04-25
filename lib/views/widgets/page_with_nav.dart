import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import '../constants/textDecoration/text_decoration.dart';

class PageWithBackButton extends StatelessWidget {
  const PageWithBackButton(
      {Key? key,
      this.body,
      this.title,
      this.action,
      this.onDispose,
      this.color,
      this.globalKey,
      this.automaticallyImplyLeading})
      : super(key: key);

  final Widget? body;
  final String? title;
  final Color? color;
  final Widget? action;
  final VoidCallback? onDispose;
  final GlobalKey<ScaffoldState>? globalKey;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        color: theme.scaffoldBackgroundColor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 100,
            color: color ?? theme.colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 52, 10, 25),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  automaticallyImplyLeading ?? true
                      ? InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            onDispose != null ? onDispose!() : debugPrint('');
                          },
                          child: Icon(
                            Icons.chevron_left_sharp,
                            color: primaryColor,
                            size: 32,
                          ),
                        )
                      : const SizedBox(),
                  const Spacer(),
                  Visibility(
                      visible: title != null,
                      child: Text("$title",
                          style: appTextStyle.copyWith(
                              color: theme.textTheme.titleLarge!.color,
                              fontSize: 17,
                              fontWeight: FontWeight.w600))),
                  const Spacer(),
                  Visibility(
                    visible: action != null,
                    child: action ?? const SizedBox(),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          body!,
          const SizedBox(
            height: 5,
          ),
        ]),
      ),
    );
  }
}
