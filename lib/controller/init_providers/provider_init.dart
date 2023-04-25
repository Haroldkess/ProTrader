import 'package:crypto_credit/controller/bind_api/bind_provider.dart';
import 'package:crypto_credit/controller/notifications/read_all_notification/read_all_provider.dart';
import 'package:crypto_credit/controller/theme_modes/theme_provider.dart';
import 'package:crypto_credit/controller/two_fa/two_fa_provider.dart';
import 'package:crypto_credit/controller/update_user_info/update_address/address_provider.dart';
import 'package:crypto_credit/controller/update_user_info/update_password/password_ware.dart';
import 'package:crypto_credit/controller/update_user_info/update_phone/phone_provider.dart';
import 'package:crypto_credit/controller/update_user_info/update_username/username_provider.dart';
import 'package:crypto_credit/controller/user_referal/referal_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../operations/operation_ware.dart';
import '../update_user_info/update_avatar/avatar_provider.dart';

class InitProvider {
  static List<SingleChildWidget> providerInit() {
    final List<SingleChildWidget> provided = [
      ChangeNotifierProvider(
        create: (context) => ThemeAndUtilsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UsernameWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => AddressWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => PhoneWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => OperationWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => BindWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => AvatarWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => PasswordWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => ReferalWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => ReadAllWare(),
      ),
      ChangeNotifierProvider(
        create: (context) => TwoFactorWare(),
      ),
    ];

    return provided;
  }
}
