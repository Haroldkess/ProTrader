import 'package:crypto_credit/models/notifications_model/notifications_model.dart';
import 'package:rxdart/rxdart.dart';

class NotifcationsBLoc {
  final BehaviorSubject<List<NotificationsModel>> _notifications =
      BehaviorSubject<List<NotificationsModel>>();

  final BehaviorSubject<String> _notifcationUnreadCount =
      BehaviorSubject<String>();

  Stream<List<NotificationsModel>> get notification => _notifications.stream;
  addNotifcations(List<NotificationsModel>? e) => _notifications.sink.add(e!);

  Stream<String> get count => _notifcationUnreadCount.stream;
  addNotifcationsCount(String? e) => _notifcationUnreadCount.sink.add(e!);

  dispose() {
    _notifications.drain([]);
    _notifications.done;
  }
}
