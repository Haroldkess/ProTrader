import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension WidgetExtension on Widget {
  Widget onTap(BuildContext context, Widget? widget) {
    return GestureDetector(
      onTap: () {
        navigateToPage(context, widget);
      },
      child: this,
    );
  }

  Widget expanded() {
    return Expanded(child: this);
  }
}

convertToCurrency(String e) {
  String newStr = e.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[0]},");
  return newStr;
}

void navigateToPage(BuildContext? context, Widget? page) {
  Navigator.push(
    context!,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => page!,
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    ),
  );
}

extension CurrencyFormatter on String {
  String convertToCurrency() {
    String formattedString = replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[0]},");

    if (formattedString.contains('.')) {
      formattedString = formattedString.replaceAll(RegExp(r'0*$'), '');
      formattedString = formattedString.replaceAll(RegExp(r'\.$'), '');
    }

    return formattedString;
  }
}

extension NumberShortener on String {
  String shorten() {
    String numberString = toString();
    int length = numberString.length;
    if (length <= 3) {
      return numberString; // Leave as-is
    } else if (length <= 7) {
      return numberString.substring(0, length - 3); // Add 'k' for thousands
    } else if (length <= 10) {
      return numberString.substring(0, length - 6); // Add 'm' for millions
    } else {
      return numberString.substring(
          0, length - 9); // Add 'b' for billions or more
    }
  }
}

formatDate(String dateToConvert) {
  DateTime date = DateTime.parse(dateToConvert);
  String formattedDate = DateFormat.MMMEd().format(date);
  return (formattedDate);
}

formatCoinImage(String? coinSymbol) {
  String coinName = coinSymbol!;
  String modifiedName = '${coinName.replaceAll('USDT', '')}.png';
  String coinImageUrl =
      'https://app.bizzatrader.com/assets/crypto/${modifiedName.toLowerCase()}';
  return coinImageUrl;
}
