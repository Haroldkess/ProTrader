import 'package:crypto_credit/controller/user_referal/referal.controller.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/grid_card.dart';
import 'package:crypto_credit/views/widgets/my_network_card.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../controller/user_referal/referal_provider.dart';

class MyNetworkScreen extends StatefulWidget {
  const MyNetworkScreen({Key? key}) : super(key: key);

  @override
  State<MyNetworkScreen> createState() => _MyNetworkScreenState();
}

class _MyNetworkScreenState extends State<MyNetworkScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      UserReferalsController.retrieveReferals(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ReferalWare stream = context.watch<ReferalWare>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => UserReferalsController.retrieveReferals(context),
        child: PageWithBackButton(
          title: "MY NETWORK",
          body: Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Referrer Info",
                          style: appTextStyle.copyWith(
                              color: theme.textTheme.titleLarge!.color,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Code",
                              style: appTextStyle.copyWith(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: theme.colorScheme.secondary,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SelectableText(
                                      stream.referId,
                                      maxLines: 1,
                                      style: appTextStyle.copyWith(
                                          color: appGreen.withOpacity(.7),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        final data = ClipboardData(
                                            text: "${stream.referId}");
                                        await Clipboard.setData(data);
                                        // ignore: use_build_context_synchronously
                                        showToast(
                                            context, "Code copied to clipboard",
                                            isError: false);
                                      },
                                      icon: const Icon(
                                        Icons.copy,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Link",
                              style: appTextStyle.copyWith(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: theme.colorScheme.secondary,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SelectableText(
                                      "https://app.bizzatrader.com/register?code=${stream.referId}",
                                      maxLines: 1,
                                      style: appTextStyle.copyWith(
                                          color: appGreen.withOpacity(.7),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        final data = ClipboardData(
                                            text:
                                                "https://app.bizzatrader.com/register?code=${stream.referId}");
                                        await Clipboard.setData(data);

                                        // ignore: use_build_context_synchronously
                                        showToast(
                                            context, "Link copied to clipboard",
                                            isError: false);
                                      },
                                      icon: const Icon(
                                        Icons.copy,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .5),
                      child: GridCard(
                        title: "Network Income",
                        amount: stream.userReferrersModel.data == null
                            ? ""
                            : "\$ ${stream.userReferrersModel.data!.stats!.networkIncome!}",
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        Text(
                          stream.userReferrersModel.data == null
                              ? "REFERRALS"
                              : "REFERRALS  ${stream.userReferrersModel.data!.referrals!.length}",
                          style: appTextStyle.copyWith(
                              color: theme.textTheme.titleLarge!.color,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    stream.userReferrersModel.data == null
                        ? const SizedBox.shrink()
                        : Column(
                            children: stream.userReferrersModel.data!.referrals!
                                .map((e) => MyNetworkCard(
                                      date:
                                          "${e.createdAt!.day}-${e.createdAt!.month}-${e.createdAt!.year}",
                                      name: "${e.name}",
                                      tradeAmount: "\$${e.demoBalance}",
                                      imageUrl: e.avatar,
                                      referrerId: "${e.username}",
                                      referralId: " ${e.referreredById}",
                                    ))
                                .toList(),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
