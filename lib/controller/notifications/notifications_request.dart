import 'package:crypto_credit/controller/network_logic/apis.dart';
import 'package:crypto_credit/controller/network_logic/network_calls.dart';
import 'package:crypto_credit/models/notifications_model/notifications_model.dart';
import 'package:crypto_credit/service_locator.dart';

fetchAllNotifications() async {
  var url = NetworkConstants.notifications;
  var response = await get(
    token: $user.accessToken,
    url: url,
  );

  List<NotificationsModel> notifications;
  notifications = response['data']['data'].map<NotificationsModel>((e) {
    return NotificationsModel.fromJson(e);
  }).toList();
  $notificationsBloc.addNotifcations(notifications);
  int unreadCount = notifications.where((n) => n.read == 'false').length;
  $notificationsBloc.addNotifcationsCount(unreadCount.toString());
}
