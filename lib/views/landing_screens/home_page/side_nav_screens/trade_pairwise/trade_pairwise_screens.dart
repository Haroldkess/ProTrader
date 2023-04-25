// ignore_for_file: must_be_immutable

import 'package:crypto_credit/controller/top_trades/top_trades_request.dart';
import 'package:crypto_credit/views/widgets/empty_list.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_shimmer.dart';
import 'package:crypto_credit/views/widgets/trade_pairwise_card.dart';
import 'package:flutter/material.dart';
import '../../../../../models/top_trades/top_trades_model.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../constants/textDecoration/text_decoration.dart';

class TradePairScreen extends StatelessWidget {
  TradePairScreen({Key? key}) : super(key: key);

  ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        body: PageWithBackButton(
            title: "TRADE PAIRWISE",
            body: Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: DefaultTabController(
                    length: 5,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  theme.colorScheme.secondary.withOpacity(0.6),
                            ),
                            child: TabBar(
                              onTap: (value) {
                                page.value = value;
                              },
                              tabs: [
                                Text(
                                  "Today",
                                  style: tabTextStyle,
                                ),
                                Text(
                                  "Y",
                                  style: tabTextStyle,
                                ),
                                Text(
                                  "W",
                                  style: tabTextStyle,
                                ),
                                Text(
                                  "M",
                                  style: tabTextStyle,
                                ),
                                Text(
                                  "Total",
                                  style: tabTextStyle,
                                ),
                              ],
                              unselectedLabelColor: lightTextColor,
                              labelColor: theme.textTheme.titleLarge!.color,
                              indicator: BoxDecoration(
                                color: theme.colorScheme.secondary,
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
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ValueListenableBuilder<int>(
                          valueListenable: page,
                          builder: (context, value, snapshot) {
                            print(value);
                            return Expanded(
                              child: IndexedStack(
                                index: value,
                                children: const [
                                  TradePairwiseIntervals(
                                    interval: "Today",
                                  ),
                                  TradePairwiseIntervals(
                                    interval: "Yesterday",
                                  ),
                                  TradePairwiseIntervals(
                                    interval: "Week",
                                  ),
                                  TradePairwiseIntervals(
                                    interval: "Month",
                                  ),
                                  TradePairwiseIntervals(
                                    interval: "",
                                  ),
                                ],
                              ),
                            );
                          })
                    ])),
              ),
            )));
  }
}

class TradePairwiseIntervals extends StatelessWidget {
  const TradePairwiseIntervals({super.key, this.interval});
  final String? interval;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FutureBuilder<TopTradeStats>(
              future: getAllTopTradesStats(interval),
              builder: (context, snapshot) {
                while (!snapshot.hasData) {
                  return const EarningShimmer();
                }
                return TradePairWiseSummaryCard(
                  profitValue: snapshot.data!.profit.toString(),
                  profitTrade: snapshot.data!.profitTrade.toString(),
                  profitWin: snapshot.data!.profitPercent.toString(),
                  lossLoss: snapshot.data!.lossPercent.toString(),
                  lossTrade: snapshot.data!.lossTrade.toString(),
                  lossValue: snapshot.data!.loss.toString(),
                );
              }),
          const SizedBox(
            height: 25,
          ),
          FutureBuilder<List<TopTradesModel>>(
              future: getAllTopTradesList(interval),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: EarningShimmer(),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const EmptyList();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trade Pairwise",
                      style: appTextStyle.copyWith(
                          color: theme.textTheme.titleLarge!.color,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 7),
                    ...snapshot.data!.map((e) {
                      return TradePairWiseCard(
                        topTradesModel: e,
                      );
                    }).toList()
                  ],
                );
              }),
        ]),
      ),
    );
  }
}
