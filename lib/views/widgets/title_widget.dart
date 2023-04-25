import 'package:crypto_credit/controller/scaff_bloc.dart';
import 'package:crypto_credit/views/widgets/exchange_balance_card.dart';
import 'package:flutter/material.dart';

import '../../service_locator.dart';
import '../constants/colors/colors.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({Key? key}) : super(key: key);

  ScaffBloc scaffBloc = locator.get<ScaffBloc>();
  showDrawer() async {
    (await scaffBloc.d.first).currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 140,
        color: primaryColor,
      ),
      const BalanceCardWidget(),
    ]);
  }
}
