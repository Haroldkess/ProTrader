import 'package:crypto_credit/models/top_coins/top_coins_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/currency_exchange_card.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/empty_list.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_trades_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../controller/top_coins/top_coins_request.dart';
import '../home_page/notification/notifications_screens.dart';

class CurrencySelect extends StatefulWidget {
  const CurrencySelect({Key? key}) : super(key: key);

  @override
  State<CurrencySelect> createState() => _CurrencySelectState();
}

class _CurrencySelectState extends State<CurrencySelect> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    getAllTopCoins();
    var theme = Theme.of(context);
    return Scaffold(
      body: PageWithBackButton(
        automaticallyImplyLeading: false,
        title: "Currency Exchange",
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

        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [

        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Currency",
                  style: appTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.titleLarge!.color),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedTextField(
                  leading: Icon(
                    Icons.search,
                    color: theme.textTheme.titleLarge!.color,
                    size: 16,
                  ),
                  hint: "Search Coin",
                  onchanged: (e) {
                    setState(() {
                      searchQuery = e!;
                    });
                  },
                ),
                Expanded(
                  child: StreamBuilder<List<TopCoinsModel>>(
                      stream: $topCoins.topCoins,
                      builder: (context, snapshot) {
                        while (!snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListShimmer(),
                          );
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
                          itemBuilder: (context, index) {
                            var e = filteredCoin[index];
                            return CurrencyExchangeCard(
                              topCoinsModel: e,
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
