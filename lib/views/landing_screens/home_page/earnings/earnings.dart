import 'package:crypto_credit/controller/earnings/earnings_bloc.dart';
import 'package:crypto_credit/controller/earnings/earnings_request.dart';
import 'package:crypto_credit/models/earning_model/earnings_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/earning_trade_card.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_shimmer.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_trades_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';
import '../../../widgets/grid_card.dart';

class EarningsScreen extends StatelessWidget {
  EarningsScreen({Key? key}) : super(key: key);

  EarningsBloc earningsBloc = locator.get<EarningsBloc>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    fetchEarnings();
    return Scaffold(
        body: PageWithBackButton(
            title: "Earnings",
            body: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder<Earnings>(
                        stream: earningsBloc.earningStats,
                        builder: (context, snapshot) {
                          while (!snapshot.hasData) {
                            return const EarningShimmer();
                          }
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GridCard(
                                        title: "Today's Profit",
                                        amount:
                                            "\$${snapshot.data!.todaysProfit}",
                                        textColor: Color(0xff1DCC70),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: GridCard(
                                        title: "Cumulative Profit",
                                        amount:
                                            "\$${snapshot.data!.cumulativeProfit}",
                                        textColor: Color(0xffFF396F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GridCard(
                                        title: "Total Investment",
                                        amount:
                                            "\$${snapshot.data!.totalInvestment}",
                                        textColor:
                                            theme.textTheme.titleLarge!.color,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: GridCard(
                                          title: "Average Percentage",
                                          amount:
                                              "${snapshot.data!.avgPercentage}%",
                                          textColor: theme
                                              .textTheme.titleLarge!.color),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(
                      height: 22,
                    ),
                    StreamBuilder<List<EarningsPositions>>(
                        stream: earningsBloc.earningPositions,
                        builder: (context, snapshot) {
                          while (!snapshot.hasData) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: EarningShimmer()
                            );
                          }

                          while (snapshot.data!.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Trades",
                                        style: appTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: theme
                                                .textTheme.titleLarge!.color),
                                      ),
                                      Text("",
                                          style: appTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff958d9e)
                                                  .withOpacity(.8)))
                                    ]),
                              ),
                              ...snapshot.data!.map((e) {
                                return EarningsTradeCard(
                                  earningsPositions: e,
                                );
                              }).toList()
                            ],
                          );
                        }),
                  ],
                ),
              ),
            )));
  }
}
