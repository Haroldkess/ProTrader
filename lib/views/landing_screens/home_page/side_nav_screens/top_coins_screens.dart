import 'package:crypto_credit/controller/top_coins/top_coins_bloc.dart';
import 'package:crypto_credit/controller/top_coins/top_coins_request.dart';
import 'package:crypto_credit/models/top_coins/top_coins_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_trades_shimmer.dart';
import 'package:crypto_credit/views/widgets/top_coins_card.dart';
import 'package:flutter/material.dart';

import '../../../icons/app_icons_widget.dart';
import '../notification/notifications_screens.dart';

class TopCoinsScreens extends StatelessWidget {
  TopCoinsScreens({
    Key? key,
  }) : super(key: key);

  TopCoinsBloc topCoinsBloc = locator.get<TopCoinsBloc>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    getAllTopCoins();
    return Scaffold(
      body: PageWithBackButton(
        title: "TOP COINS",
        action: GestureDetector(
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
                        top: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Color(0xffFF396F),
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
        body: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StreamBuilder<List<TopCoinsModel>>(
                  stream: topCoinsBloc.topCoins,
                  builder: (context, snapshot) {
                    while (!snapshot.hasData) {
                      return ListShimmer();
                    }
                    List<TopCoinsModel> data = snapshot.data!
                      ..sort((a, b) => double.tryParse(b.percentage)!
                          .compareTo(double.tryParse(a.percentage)!));
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Coins",
                          style: appTextStyle.copyWith(
                              color: theme.textTheme.titleLarge!.color,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        SettingsContainer(
                            children: data.map((e) {
                          return TopCoinsCard(
                            color: appGreen,
                            topCoinsModel: e,
                          );
                        }).toList()),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
