import 'package:crypto_credit/controller/bind_api/bind_provider.dart';
import 'package:crypto_credit/controller/dashboard_data/dashboard_data_request.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/all_trades.dart';
import 'package:crypto_credit/views/landing_screens/home_page/bind_api/bind_apis.dart';
import 'package:crypto_credit/views/landing_screens/home_page/earnings/earnings.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/my_network_screen.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/personal_wallet/personal_wallet_screen.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/signal_analysis/signal_analysis_screen.dart';
// import 'package:crypto_credit/views/landing/_screens/home_page/side_nav_screens/signal_analysis_screen.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/top_coins_screens.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/top_traders_screen.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/trade_pairwise/trade_pairwise_screens.dart';
import 'package:crypto_credit/views/landing_screens/settings/settings.dart';
import 'package:crypto_credit/views/widgets/settings_card.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:crypto_credit/views/widgets/sideNav/balance_header_card.dart';
import 'package:crypto_credit/views/widgets/sideNav/menu_items.dart';
import 'package:crypto_credit/views/widgets/sideNav/side_nav_title.dart';
import 'package:crypto_credit/views/widgets/sideNav/user_header.dart';
import 'package:crypto_credit/views/widgets/toggles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    BindWare stream = context.watch<BindWare>();

    return Container(
      decoration: BoxDecoration(color: theme.colorScheme.secondary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const UserHeader(),
          const BalanceHeaderCard(),
          Expanded(
              child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SideNavTitle(
                    title: "Menu",
                  ),
                  StreamBuilder<DashboardData>(
                      stream: $dashboardDataBloc.dashBoardData,
                      builder: (context, snapshot) {
                        while (!snapshot.hasData) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: snapshot.data!.mode == "LIVE"
                                        ? appGreen
                                        : appRedColor,
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 3),
                              child: Text(
                                snapshot.data!.mode == "LIVE"
                                    ? "LIVE"
                                    : snapshot.data!.mode!,
                                style: appTextStyle.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: snapshot.data!.mode == "LIVE"
                                        ? appGreen
                                        : appRedColor),
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              const NavItems(icon: "overview", size: 18, title: "Overview"),
              // ).animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              NavItems(
                icon: "pairwise",
                size: 12,
                onTap: TradePairScreen(),
                title: "Pairwise",
              ),
                NavItems(
                icon: "pairwise",
                size: 12,
                onTap: AllTradesScreen(),
                title: "Positions",
              ),
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              NavItems(
                icon: "bind",
                size: 14,
                onTap: BindAPIScreen(
                  public: stream.publicKey,
                  secret: stream.secretKey,
                ),
                title: "Bind API",
              )

              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              NavItems(
                icon: "top_coins",
                onTap: TopCoinsScreens(),
                title: "Top Coins",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              const NavItems(
                onTap: TopTradersScreen(),
                icon: "top_traders",
                title: "Top Traders",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              NavItems(
                onTap: SignalAnalysisScreen(),
                icon: "signals",
                title: "Signals",
                size: 14,
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              NavItems(
                icon: "trades_1",
                onTap: EarningsScreen(),
                title: "Earnings",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              const NavItems(
                onTap: MyNetworkScreen(),
                icon: "trades",
                title: "My Network",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              const SizedBox(
                height: 8,
              ),

              const NavItems(
                onTap: PersonalWalletScreen(),
                icon: "trades_1",
                title: "Wallet",
              ),
              const SizedBox(
                height: 8,
              ),
              const SideNavTitle(
                title: "Others",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              const NavItems(
                icon: "support",
                title: "How to Start",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              NavItems(
                onTap: UserSettings(
                  automaticallyImplyLeading: true,
                ),
                icon: "settings",
                title: "Profile Settings",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              const NavItems(
                icon: "help",
                title: "Support",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              NavItems(
                icon: "help",
                route: () async {
                  await closeAll(context);
                  initializesingletons();
                },
                title: "Log out",
              )
              // .animate(delay: 200.ms)
              //     .fadeIn(duration: 700.ms, delay: 100.ms)
              //     .shimmer(blendMode: BlendMode.lighten, color: Colors.white12)
              //     .move(
              //         begin: const Offset(16, -10), curve: Curves.decelerate),
              ,
              const SizedBox(
                height: 20,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
