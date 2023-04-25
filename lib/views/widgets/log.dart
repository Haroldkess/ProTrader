import 'package:flutter/material.dart';

log(Object? data) {
  assert(() {
    debugPrint("======================================================");
    debugPrint("Protrader Log:$data");
    debugPrint("======================================================");
    return true;
  }());
}
