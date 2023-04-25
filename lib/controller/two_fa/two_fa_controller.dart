import 'package:crypto_credit/controller/two_fa/send_token_model.dart';
import 'package:crypto_credit/controller/two_fa/two_fa_provider.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:provider/provider.dart';

class TwoFactorController {
  static verifyTwoFaToken(context, String tok) async {
    TwoFactorWare ware = Provider.of<TwoFactorWare>(context, listen: false);
    SendTwoFaModel data = SendTwoFaModel(token: tok);

    ware.isLoad(true);

    bool isDone = await ware.verifyTwoFa(data);

    if (isDone) {
      ware.isLoad(false);
      showToast(context, ware.msg);
    } else {
      ware.isLoad(false);
      showToast(context, ware.msg, isError: true);
    }

    ware.isLoad2(false);
  }

  static enableTwoFaToken(context) async {
    TwoFactorWare ware = Provider.of<TwoFactorWare>(context, listen: false);

    ware.isLoad2(true);

    bool isDone = await ware.resetTwoFa();

    if (isDone) {
      ware.isLoad2(false);
      showToast(context, ware.msg2);
    } else {
      ware.isLoad2(false);
      showToast(context, ware.msg2, isError: true);
    }

    ware.isLoad2(false);
  }
}
