import 'package:crypto_credit/controller/top_traders/top_traders_request.dart';
import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/empty_list.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_trades_shimmer.dart';
import 'package:crypto_credit/views/widgets/top_traders_card.dart';
import 'package:flutter/material.dart';

import '../../../icons/app_icons_widget.dart';
import '../notification/notifications_screens.dart';

class TopTradersScreen extends StatelessWidget {
  const TopTradersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    getAllTopTraders();

    return Scaffold(
      body: PageWithBackButton(
        title: "TOP TRADERS",
        action: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NotificationsScreen();
            }));
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: const [
              // const AppIcons(
              //   icons: "notification_bell",
              //   size: 24,
              // ),
              // Positioned(
              //   right: 0,
              //   top: 10,
              //   child: Container(
              //     padding: const EdgeInsets.all(1),
              //     decoration: const BoxDecoration(
              //       color: Color(0xffFF396F),
              //       shape: BoxShape.circle,
              //     ),
              //     constraints: const BoxConstraints(
              //       minWidth: 16,
              //       minHeight: 16,
              //     ),
              //     child: const Center(
              //       child: Text(
              //         '1',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 8,
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        body: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StreamBuilder<List<TopTradersModel>>(
                  stream: $topTraders.topTraders,
                  builder: (context, snapshot) {
                    while (!snapshot.hasData) {
                      return ListShimmer();
                    }

                    while (snapshot.data!.isEmpty) {
                      return const EmptyList();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOP TRADERS",
                          style: appTextStyle.copyWith(
                              color: theme.textTheme.titleLarge!.color,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        ...snapshot.data!
                            .map((e) => TopTradersCard(
                                  topTradersModel: e,
                                ))
                            .toList()
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
