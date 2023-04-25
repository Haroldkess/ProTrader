import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/controller/notifications/notifications_request.dart';
import 'package:crypto_credit/models/notifications_model/notifications_model.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/home_page/notification/notification_description.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/icons_circle.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({Key? key, this.notificationsModel})
      : super(key: key);

  final NotificationsModel? notificationsModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Slidable(
      key: Key(notificationsModel!.id.toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (c) async {
              var url = NetworkConstants.markAsRead(
                  notificationsModel!.id.toString());
              var e = await get(
                      context: context, url: url, token: $user.accessToken)
                  .then((e) {
                fetchAllNotifications();
                showToast(context, "Mark As Read");
              });
            },
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            icon: Icons.done,
            label: 'Mark as read',
          )
        ],
      ),
      child: InkWell(
        onTap: () async {
          var link = notificationsModel!.link!;
          var start = link.lastIndexOf('=') + 1;
          var extract = link.substring(start);
          print(extract.toString());
          if (notificationsModel!.category! == "close_position") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationDescription(
                          positionName: extract,
                          id: notificationsModel!.id!,
                        )));
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(color: theme.colorScheme.secondary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleIcon(
                size: 42,
                color: primaryColor,
                iconData: Icons.arrow_downward,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notificationsModel!.title.toString(),
                    style: appTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: theme.textTheme.titleLarge!.color),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    notificationsModel!.message.toString(),
                    style: appTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff69587F)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    (notificationsModel!.createdAt.toString()),
                    style: appTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff69587F)),
                  ),
                ],
              ),
              const Spacer(),
              Visibility(
                  visible: notificationsModel!.read == "false",
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: primaryColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
