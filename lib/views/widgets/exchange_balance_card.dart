// ignore_for_file: depend_on_referenced_packages

import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:crypto_credit/views/landing_screens/home_page/bind_api/bind_apis.dart';
import 'package:crypto_credit/views/landing_screens/home_page/earnings/earnings.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/signal_analysis/signal_analysis_screen.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/trade_pairwise/trade_pairwise_screens.dart';
import 'package:crypto_credit/views/widgets/modals/update_demo_balance.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:crypto_credit/views/widgets/menu_boxes.dart';
import 'package:crypto_credit/views/widgets/modals/live_demo_switch.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:provider/provider.dart';
import 'package:crypto_credit/views/widgets/shimmers/balance_loading_shimmer.dart';
import 'package:flutter/material.dart';
import '../../controller/bind_api/bind_provider.dart';
import '../constants/colors/colors.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    BindWare stream = context.watch<BindWare>();
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 31),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.colorScheme.secondary,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: StreamBuilder<DashboardData>(
                        stream: $dashboardDataBloc.dashBoardData,
                        builder: (context, snapshot) {
                          while (!snapshot.hasData) {
                            return const BalanceShimmer();
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Exchange Balance",
                                    style: appTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            theme.textTheme.titleLarge!.color),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    height: 22,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: snapshot.data!.mode == "DEMO"
                                            ? appRedColor.withOpacity(.1)
                                            : appGreen.withOpacity(.1)),
                                    child: Center(
                                        child: Text(
                                      snapshot.data!.mode.toString(),
                                      style: appTextStyle.copyWith(
                                          color: snapshot.data!.mode == "DEMO"
                                              ? appRedColor
                                              : appGreen,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  )
                                      .animate(delay: 400.ms)
                                      .fadeIn(duration: 700.ms, delay: 100.ms)
                                      .shimmer(
                                          blendMode: BlendMode.srcOver,
                                          color: Colors.white12)
                                      .move(
                                          begin: const Offset(-16, 0),
                                          curve: Curves.easeOutQuad),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 180),
                                      child: Text(
                                        "\$${double.parse("${snapshot.data!.exchangeBalance}").toStringAsFixed(2).convertToCurrency()}",
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: appTextStyle.copyWith(
                                            letterSpacing: 1.1,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                            color: theme
                                                .textTheme.titleLarge!.color),
                                      )
                                          .animate(delay: 600.ms)
                                          .fadeIn(
                                              duration: 900.ms, delay: 300.ms)
                                          .shimmer(
                                              blendMode: BlendMode.srcOver,
                                              color: Colors.white12)
                                          .move(
                                              begin: const Offset(-16, 0),
                                              curve: Curves.easeOutQuad),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Visibility(
                                        visible: snapshot.data!.mode == "DEMO",
                                        child: GestureDetector(
                                            onTap: () {
                                              showDemoUpdateModal(context);
                                            },
                                            child: Icon(Icons.edit,
                                                color: theme.textTheme
                                                    .titleLarge!.color)))
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      showLiveModal(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.disabledColor),
                      height: 64,
                      width: 50,
                      child: Center(
                          child: Icon(Icons.keyboard_arrow_down,
                              color: theme.primaryColorLight)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                child: Divider(
                  color: lightTextColor.withOpacity(.3),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MenuBoxes(
                      route: BindAPIScreen(
                        public: stream.publicKey,
                        secret: stream.secretKey,
                      ),
                      icons: "bind",
                      size: 14,
                      title: "Bind Api",
                    ),
                  ),
                  Expanded(
                    child: MenuBoxes(
                      route: EarningsScreen(),
                      icons: "trades_1",
                      title: "Earnings",
                    ),
                  ),
                  Expanded(
                    child: MenuBoxes(
                      icons: "pairwise",
                      route: TradePairScreen(),
                      title: "Pairwise",
                      size: 14,
                    ),
                  ),
                  Expanded(
                    child: MenuBoxes(
                      icons: "signals",
                      route: SignalAnalysisScreen(),
                      title: "Signals",
                      size: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
