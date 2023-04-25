import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/signal_analysis/bollinger_tab.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/signal_analysis/rsi_tab.dart';
import 'package:crypto_credit/views/landing_screens/home_page/side_nav_screens/signal_analysis/signals_tab.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:flutter/material.dart';

class SignalAnalysisScreen extends StatelessWidget {
  SignalAnalysisScreen({super.key});

  ValueNotifier<int> page = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        body: PageWithBackButton(
            title: "SIGNAL ANALYSIS",
            body: Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.selectedRowColor.withOpacity(.4),
                        ),
                        child: TabBar(
                          onTap: (value) {
                            page.value = value;
                          },
                          tabs: [
                            Text(
                              "BOLLINGER",
                              style: tabTextStyle,
                            ),
                            Text(
                              "RSI",
                              style: tabTextStyle,
                            ),
                            Text(
                              "SIGNALS",
                              style: tabTextStyle,
                            )
                          ],
                          unselectedLabelColor: lightTextColor,
                          labelColor: theme.textTheme.titleLarge!.color,
                          indicator: BoxDecoration(
                            color: theme.indicatorColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            // overlayColor: MaterialStateProperty.all(Colors.grey),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          isScrollable: false,
                        ),
                      ),
                      // TabBarView(children: [Container(), Container(), Container()])
                      SizedBox(
                        height: 16,
                      ),
                      ValueListenableBuilder<int>(
                          valueListenable: page,
                          builder: (context, value, snapshot) {
                            return Expanded(
                              child: IndexedStack(
                                index: value,
                                children: [
                                  const BollingerTab(),
                                  RSITab(),
                                  SignalsTabs()
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ))));
  }
}
