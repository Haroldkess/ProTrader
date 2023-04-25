// ignore_for_file: use_build_context_synchronously

import 'package:crypto_credit/controller/dashboard_data/dashboard_data_request.dart';
import 'package:crypto_credit/controller/notifications/notifications_request.dart';
import 'package:crypto_credit/controller/operations/operation_ware.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/controller/robot_settings/robot_settings_request.dart';
import 'package:crypto_credit/controller/update_user_info/update_avatar/avatar_provider.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';
import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/all_trades.dart';
import 'package:crypto_credit/views/landing_screens/settings/settings.dart';
import 'package:crypto_credit/views/widgets/empty_list.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_shimmer.dart';
import 'package:crypto_credit/views/widgets/sideNav/side_nav.dart';
import 'package:crypto_credit/views/widgets/trades/trade_cards.dart';
import 'package:flutter/material.dart';
import '../../icons/app_icons_widget.dart';
import '../../widgets/grid_card.dart';
import '../../widgets/title_widget.dart';
import 'notification/notifications_screens.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AvatarWare streamAvatar = context.watch<AvatarWare>();
    OperationWare streamFile = context.watch<OperationWare>();
    var theme = Theme.of(context);
    getRobotSettings(context);
    fetchAllNotifications();
    fetchPositions(mode: $dashboardDataBloc.getDashboardData.mode ?? "LIVE");
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotificationsScreen();
              }));
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Icon(
                  Icons.notifications,
                  size: 28,
                ),
                StreamBuilder<String>(
                    stream: $notificationsBloc.count,
                    builder: (context, snapshot) {
                      return Visibility(
                        visible: snapshot.data != "0",
                        child: Positioned(
                          right: 2,
                          top: 10,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: const Color(0xffFF396F),
                            child: Center(
                              child: Text(
                                snapshot.data == null
                                    ? "0"
                                    : snapshot.data.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(streamAvatar.avatarUrl)),
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor),
            ).onTap(
                context,
                const UserSettings(
                  automaticallyImplyLeading: true,
                )),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        backgroundColor: primaryColor,
        title: const AppIcons(
          image: "logo",
          size: 100,
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(child: SideNav()),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          fetchPositions(mode: $dashboardDataBloc.getDashboardData.mode);
          await fetchDashboardData2(
              mode: $dashboardDataBloc.getDashboardData.mode);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget(),
              const SizedBox(
                height: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<DashboardData>(
                      stream: $dashboardDataBloc.dashBoardData,
                      builder: (context, snapshot) {
                        while (!snapshot.hasData) {
                          return const EarningShimmer();
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: GridCard(
                                      title: "Total Earnings",
                                      amount:
                                          "\$${snapshot.data!.totalEarnings}"
                                              .convertToCurrency(),
                                      textColor: const Color(0xff1DCC70),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: GridCard(
                                      title: "Total Profit",
                                      amount: "\$${snapshot.data!.tradeProfit}",
                                      textColor: const Color(0xffFF396F),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GridCard(
                                      title: "Bot Balance",
                                      amount: "\$${snapshot.data!.botBalance}",
                                      textColor:
                                          theme.textTheme.titleLarge!.color,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: GridCard(
                                        title: "Network Income",
                                        amount:
                                            "\$${snapshot.data!.networkIncome}",
                                        textColor:
                                            theme.textTheme.titleLarge!.color),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 22,
                  ),
                  StreamBuilder<List<TradePositions>>(
                      stream: $positions.tradePosition,
                      builder: (context, snapshot) {
                        while (!snapshot.hasData) {
                          return const EarningShimmer();
                        }
                        var filteredList = snapshot.data!
                            .where((element) => element.mode != "CLOSED")
                            .toList();

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const EarningShimmer();
                        } else if (snapshot.data!.isEmpty) {
                          return const EmptyList();
                        }

                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: StreamBuilder<String>(
                                  stream: $positions.count,
                                  builder: (context, s) {
                                    return Visibility(
                                      visible: s.data != "0",
                                      replacement: const EmptyList(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Trades (${s.data ?? "0"})",
                                            style: appTextStyle.copyWith(
                                                color: theme.textTheme
                                                    .titleLarge!.color,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "View All",
                                            style: appTextStyle.copyWith(
                                                color: const Color(0xff958d9e),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ).onTap(
                                              context, const AllTradesScreen()),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var e = filteredList[index];
                                return TradeCard(
                                  tradePositions: e,
                                );
                              },
                            ),
                          ],
                        );
                      }),
                  // StreamBuilder<List<TradePositions>>(
                  //     stream: $positions.tradePosition,
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.waiting) {
                  //         return const EarningShimmer();
                  //       } else if (snapshot.data!.isEmpty) {
                  //         return const SizedBox.shrink();
                  //       }
                  //       return Column(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(horizontal: 16),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   "Trades",
                  //                   style: appTextStyle.copyWith(
                  //                       color: appWhite,
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w600),
                  //                 ),
                  //                 Text(
                  //                   "View All",
                  //                   style: appTextStyle.copyWith(
                  //                       color: const Color(0xff958d9e),
                  //                       fontSize: 13,
                  //                       fontWeight: FontWeight.w500),
                  //                 ).onTap(context, const AllTradesScreen()),
                  //               ],
                  //             ),
                  //           ),
                  //            Expanded(
                  //              child: ListView.builder(
                  //               shrinkWrap: true,
                  //                itemCount: 2,
                  //                itemBuilder: (context, index) {
                  //                  var e = snapshot.data![index];
                  //                  return TradeCard(
                  //                    tradePositions: e,
                  //                  );
                  //                },
                  //              ),
                  //            ),
                  // ...snapshot.data!
                  //     .where((element) => element.mode != "CLOSED")
                  //     .map((e) {
                  //   return TradeCard(
                  //     tradePositions: e,
                  //   );
                  // }).toList()
                  //         ],
                  //       );
                  //     }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
