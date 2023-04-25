import 'package:crypto_credit/controller/field_validations/validations.dart';
import 'package:rxdart/rxdart.dart';

class ForgotPasswordBLoc with FieldValidation {
  final _email = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(emailValidation);
  addEmail(String? e) => _email.sink.add(e!);

  Stream<bool> get canSend => Rx.combineLatest([email], (a) => true);

  get body => {"email": _email.value};
}

class ResetPasswordBLoc with FieldValidation {
  final _token = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _passwordConfirmation = BehaviorSubject<String>();

  Stream<String> get token => _token.stream;
  addToken(String? e) => _token.sink.add(e!);

  Stream<String> get password => _password.stream.transform(passwordValidation);
  addPassword(String? e) => _password.sink.add(e!);
  String get passwordValue => _password.value;

  Stream<String> get passwordConfirm => _passwordConfirmation.stream
          .transform(passwordValidation)
          .doOnData((String? value) {
        if (0 != passwordValue.compareTo(value!)) {
          _passwordConfirmation.addError("Passwords must match");
        }
      });
  addPassowrdConfirmation(String? e) => _passwordConfirmation.sink.add(e!);

  Stream<bool> get canSend =>
      Rx.combineLatest3(token, password, passwordConfirm, (a, b, c) => true);

  get body => {
        "token": _token.value,
        "password": _password.value,
        "password_confirmation": _passwordConfirmation.value
      };
}
