import 'package:crypto_credit/controller/biometrics/biometrics.dart';
import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/controller/single_ticker/single_ticker_request.dart';
import 'package:crypto_credit/models/positions_model/single_positions_model.dart';
import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/positions_card.dart';
import 'package:flutter/material.dart';

import '../../../../../models/top_trades/top_trades_model.dart';

class TradePairWiseDetails extends StatelessWidget {
  const TradePairWiseDetails({super.key, this.model});

  final TopTradesModel? model;

  @override
  Widget build(BuildContext context) {
    fetchSymbolicPositions(model!.symbol);
    return Scaffold(
      body: PageWithBackButton(
          title: "${model!.symbol}",
          body: Expanded(
            child: FutureBuilder<List<SinglePostionsModel>>(
                future: fetchSymbolicPositions(model!.symbol),
                builder: (context, snapshot) {
                  while (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...snapshot.data!.map((e) {
                          return PostionsCard(
                            e: e,
                          );
                        }).toList()
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
