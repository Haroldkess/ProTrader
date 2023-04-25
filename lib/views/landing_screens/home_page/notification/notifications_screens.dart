import 'package:crypto_credit/controller/notifications/notifications_request.dart';
import 'package:crypto_credit/controller/notifications/read_all_notification/read_all_controller.dart';
import 'package:crypto_credit/models/notifications_model/notifications_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/empty_list.dart';
import 'package:crypto_credit/views/widgets/notifications_card.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/shimmers/earnings_trades_shimmer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key, this.noti}) : super(key: key);

  List<NotificationsModel>? noti;

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _showText = true;

  @override
  void initState() {
    super.initState();

    // Hide the text after 2 seconds
    Future.delayed(const Duration(seconds: 12)).then((_) {
      setState(() {
        _showText = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchAllNotifications();
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: theme.scaffoldBackgroundColor,
      body: PageWithBackButton(
        title: "Notifications",
        action: InkWell(
          onTap: () async {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 10.0,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 3),
              content: Row(
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    color: appWhite,
                    //    size: 28,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Mark all as read?",
                    style: appTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: appWhite.withOpacity(.8)),
                  ),
                ],
              ),
              backgroundColor: primaryColor.withOpacity(.7),
              action: SnackBarAction(
                  label: "Ok",
                  textColor: appWhite,
                  onPressed: () async {
                    await ReadAllController.readAll(context);
                    fetchAllNotifications();
                  }),
            ));
          },
          child: Icon(
            Icons.mark_email_read_outlined,
            color: primaryColor,
            size: 25,
          ),
        ),
        // color: theme.colorScheme.secondary,
        body: Expanded(
          child: SingleChildScrollView(
            child: StreamBuilder<List<NotificationsModel>>(
                stream: $notificationsBloc.notification,
                builder: (context, snapshot) {
                  while (!snapshot.hasData) {
                    return ListShimmer();
                  }
                  while (snapshot.data!.isEmpty) {
                    return const EmptyList();
                  }

                  return Column(
                    children: [
                      AnimatedOpacity(
                          opacity: _showText ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 8, bottom: _showText ? 8 : 0),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Swipe left to read',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: theme.textTheme.titleLarge!.color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          )),
                      ...snapshot.data!.map((e) {
                        return NotificationsCard(
                          notificationsModel: e,
                        );
                      }).toList()
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
