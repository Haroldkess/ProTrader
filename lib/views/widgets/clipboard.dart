import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void copyToClipboard(BuildContext? c, String text) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    showToast(c, "$text Copied");
  });
}
