import 'package:crypto_credit/controller/deposit/deposit_request.dart';
import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/icons_circle.dart';
import 'package:crypto_credit/views/widgets/modals/deposit_modal.dart';
import 'package:crypto_credit/views/widgets/modals/send_money_modal.dart';
import 'package:crypto_credit/views/widgets/modals/withdrawal_modal.dart';
import 'package:crypto_credit/views/widgets/shimmers/balance_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:crypto_credit/extensions/widget_extensions.dart';
import '../../../service_locator.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/colors/colors.dart';

class BalanceHeaderCard extends StatelessWidget {
  const BalanceHeaderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DashboardData>(
        stream: $dashboardDataBloc.dashBoardData,
        builder: (context, snapshot) {
          while (!snapshot.hasData) {
            return const BalanceShimmer();
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
            decoration: BoxDecoration(color: primaryColor),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Balance",
                style: appTextStyle.copyWith(
                    color: appWhite.withOpacity(.6),
                    fontSize: 11,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "\$${"${snapshot.data!.botBalance}".convertToCurrency().shorten()}",
                style: appTextStyle.copyWith(
                    letterSpacing: 1.2,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconsCircle(
                    onTap: () async {
                      Navigator.pop(context);
                      
                      showDepositModal(context);
                    },
                    title: "Deposit",
                    icon: "add",
                  ),
                  IconsCircle(
                    title: "Withdraw",
                    icon: "arrow_down",
                    onTap: () {
                      Navigator.pop(context);
                      showWithdrawalModal(context);
                    },
                  ),
                  IconsCircle(
                    title: "Transfer",
                    icon: "arrow_right",
                    onTap: () {
                      Navigator.pop(context);
                      transferModal(context);
                    },
                  ),
                ],
              )
            ]),
          )
              .animate(delay: 50.ms)
              .fadeIn(
                duration: 300.ms,
              )
              .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
              .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
        });
  }
}
