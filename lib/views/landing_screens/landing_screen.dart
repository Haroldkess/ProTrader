import 'package:crypto_credit/controller/deposit/deposit_request.dart';
import 'package:crypto_credit/controller/robot_settings/robot_settings_request.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/icons/app_icons_widget.dart';
import 'package:crypto_credit/views/landing_screens/currency/currency_select.dart';
import 'package:crypto_credit/views/landing_screens/home_page/home_page.dart';
import 'package:crypto_credit/views/landing_screens/settings/settings.dart';
import 'package:crypto_credit/views/landing_screens/settings/trade_settings.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/sideNav/side_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/dashboard_data/dashboard_data_request.dart';
import '../../controller/positions/positions_requests.dart';
import '../../controller/scaff_bloc.dart';
import '../../controller/theme_modes/theme_controller.dart';
import '../../controller/top_coins/top_coins_request.dart';
import '../constants/textDecoration/text_decoration.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Widget>? body;
  final List<String> _pageTitles = ['Overview', '', 'Settings'];
  GlobalKey<ScaffoldState> s = GlobalKey();
  ScaffBloc? scaffBloc = locator.get<ScaffBloc>();

  @override
  void initState() {
    ProjectOperations.checkUserInfo(
        context); // storing and updating userinfo locally and on ui
    super.initState();
    body = [const HomePage(), const CurrencySelect(), const TradeSettings()];
    scaffBloc!.addKey(s);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  bool _backButtonPressedOnce = false;

  @override
  Widget build(BuildContext context) {
    // getAllTopCoins();
    fetchPositions(
        mode: $dashboardDataBloc.getDashboardData.mode == "LIVE"
            ? "LIVE"
            : "DEMO");

    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      items: [
        BottomNavigationBarItem(
            label: _pageTitles[0],
            icon: _selectedIndex == 0
                ? const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppIcons(
                      icons: "overview",
                      size: 25,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppIcons(
                      icons: "overview",
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme!
                          .color!,
                      size: 25,
                    ),
                  )),
        BottomNavigationBarItem(
            label: _pageTitles[1],
            icon: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff6236FF)),
                  child: Center(
                      child: AppIcons(
                    icons: "arrow_up",
                    color: appWhite,
                  ))),
            )),
        BottomNavigationBarItem(
            label: _pageTitles[2],
            icon: _selectedIndex == 2
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: AppIcons(
                      icons: "new_settings",
                      color: primaryColor,
                      size: 25,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppIcons(
                      icons: "new_settings",
                      color: Colors.grey,
                      size: 25,
                    ),
                  )),
      ],
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 24),
      selectedLabelStyle: appTextStyle.copyWith(color: appWhite, fontSize: 8),
      selectedFontSize: 8,
      unselectedFontSize: 8,
      unselectedLabelStyle: appTextStyle.copyWith(color: appBlack, fontSize: 8),
      onTap: _onItemTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      elevation: 0,
    );

    return Scaffold(
      key: s,
      backgroundColor: appBgColor,
      drawer: const Drawer(
        child: SideNav(),
      ),
      body: WillPopScope(onWillPop: _onWillPop, child: body![_selectedIndex]),
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 7,
              width: MediaQuery.of(context).size.width / _pageTitles.length,
              color: Colors.red,
            ),
          ),
          bottomNavBar,
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_backButtonPressedOnce) {
      // If the user has already pressed the back button once, exit the app
      SystemNavigator.pop();
      return true;
    }
    setState(() {
      _backButtonPressedOnce = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 10.0,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 3),
      content: Row(
        children: [
          Text(
            "Press again to Exit",
            style: appTextStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: appWhite.withOpacity(.8)),
          ),
        ],
      ),
      backgroundColor: primaryColor.withOpacity(.7),
      action:
          SnackBarAction(label: "Ok", textColor: appWhite, onPressed: () {}),
    ));

    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _backButtonPressedOnce = false;
    });

    return false;
  }
}
