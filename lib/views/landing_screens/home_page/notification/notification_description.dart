import 'package:crypto_credit/controller/notifications/read_all_notification/read_all_controller.dart';
import 'package:crypto_credit/controller/notifications/read_all_notification/read_all_provider.dart';
import 'package:crypto_credit/models/notifications_model/notifications_model.dart';
import 'package:crypto_credit/models/positions_model/positions_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/notification/description_card.dart';
import 'package:crypto_credit/views/widgets/app_bar.dart';
import 'package:crypto_credit/views/widgets/loaders/progress_loader.dart';
import 'package:crypto_credit/views/widgets/trades/trade_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../controller/notifications/read_all_notification/notification_desc_model.dart';

class NotificationDescription extends StatefulWidget {
  final String positionName;
  final int id;

  const NotificationDescription(
      {super.key, required this.positionName, required this.id});

  @override
  State<NotificationDescription> createState() =>
      _NotificationDescriptionState();
}

class _NotificationDescriptionState extends State<NotificationDescription> {
  @override
  Widget build(BuildContext context) {
    ReadAllWare stream = context.watch<ReadAllWare>();
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.secondary,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: primaryColor)),
        title: Text(
          widget.positionName,
          style: appTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.titleLarge!.color),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  size: 28,
                  color: primaryColor,
                ),
                StreamBuilder<String>(
                    stream: $notificationsBloc.count,
                    builder: (context, snapshot) {
                      return Positioned(
                        right: 2,
                        top: 10,
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
                      );
                    })
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: stream.loadStatus
          ? const Center(child: Loader())
          : ListView.builder(
              itemCount: stream.notifiDesc.data == null
                  ? 0
                  : stream.notifiDesc.data!.length,
              itemBuilder: (context, index) {
                Datum trade = stream.notifiDesc.data![index];

                return DescriptionTradeCard(
                  tradePositions: trade,
                  isClosedScreen: true,
                );
              }),
    );
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await ReadAllController.notificationDesc(
          context, widget.positionName, widget.id);
    });
  }
}
