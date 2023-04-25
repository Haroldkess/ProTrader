import 'package:crypto_credit/controller/positions/positions_requests.dart';
import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/empty_list.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/trades/trade_cards.dart';
import 'package:flutter/material.dart';

class AllTradesScreen extends StatefulWidget {
  const AllTradesScreen({super.key});

  @override
  State<AllTradesScreen> createState() => _AllTradesScreenState();
}

class _AllTradesScreenState extends State<AllTradesScreen> {
  String searchQuery = '';
  bool open = false;

  toggle() {
    open = !open;
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // fetchPositions(
    //     mode: $dashboardDataBloc.getDashboardData.mode == "LIVE"
    //         ? "LIVE"
    //         : "DEMO");
    return Scaffold(
      body: PageWithBackButton(
          title: "All Positions",
          action: StatefulBuilder(builder: (context, s) {
            return Visibility(
                visible: open,
                replacement: GestureDetector(
                    onTap: () {
                      s(() {
                        toggle();
                      });
                    },
                    child: const Icon(Icons.search)),
                child: Expanded(
                  flex: 3,
                  child: Container(
                      height: 200,
                      color: null,
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(6),
                            hintText: "Search...",
                            constraints: const BoxConstraints(minHeight: 100),
                            suffixIcon: InkWell(
                                onTap: () {
                                  searchController.clear();
                                  s(
                                    () {
                                      toggle();
                                    },
                                  );
                                },
                                child: const Icon(Icons.close))),
                      )),
                ));
          }),
          body: Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await fetchPositions(
                    mode: $dashboardDataBloc.getDashboardData.mode == "LIVE"
                        ? "LIVE"
                        : "DEMO");
              },
              child: StreamBuilder<List<TradePositions>>(
                  stream: $positions.tradePosition,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    var filteredCoin = snapshot.data!.where((e) {
                      return e.symbol
                          .toString()
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());
                    }).toList();

                    if (filteredCoin.isEmpty) {
                      return const EmptyList();
                    }

                    return ListView.builder(
                        itemCount: filteredCoin.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Visibility(
                            visible: filteredCoin[index].status == "CLOSED"
                                ? false
                                : true,
                            child: TradeCard(
                              tradePositions: filteredCoin[index],
                            ),
                          );
                        });
                  }),
            ),
          )),
    );
  }
}
