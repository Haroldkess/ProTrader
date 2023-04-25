import 'package:crypto_credit/models/user_model/user_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/dashboard_data/dashboard_data_model.dart';

class UserBloc {
  final BehaviorSubject<User> _users = BehaviorSubject<User>();
  Stream<User> get users => _users.stream;
  addUsers(User? e) => _users.sink.add(e!);

  User get user => _users.value;
  String? accessToken;
  addAccessToken(String? a) => accessToken = a;

  String? refreshToken;
  addRefereshToken(String? a) => refreshToken = a;

  dispose() {
    _users.drain("");
  }
}
