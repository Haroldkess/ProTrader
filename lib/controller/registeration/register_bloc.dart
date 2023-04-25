import 'package:crypto_credit/controller/field_validations/validations.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with FieldValidation {
  final _name = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _referrerCode = BehaviorSubject<String>();

  final _termsAndConditions = BehaviorSubject<bool>();

  Stream<String> get email => _email.stream.transform(emailValidation);
  addEmail(String? e) => _email.sink.add(e!);

  Stream<String> get password => _password.stream.transform(passwordValidation);
  addPassword(String? e) => _password.sink.add(e!);
  String get getInputtedPassword => _password.value;

  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(passwordValidation).doOnData(
        (String? value) {
          if (0 != getInputtedPassword.compareTo(value!)) {
            _confirmPassword.addError("Both Passwords must match");
          }
        },
      );
  addConfirmPassword(String? e) => _confirmPassword.sink.add(e!);

  Stream<String> get username => _username.stream.transform(validInput);
  addUsername(String? e) => _username.sink.add(e!);

  Stream<String> get name => _name.stream.transform(validInput);
  addName(String? e) => _name.sink.add(e!);

  Stream<bool> get termsAndCondition =>
      _termsAndConditions.stream.transform(termsAndConditionValidation);
  void checkTermsAndCondition(bool? e) => _termsAndConditions.sink.add(e!);

  Stream<String> get referrerCode => _referrerCode.stream.transform(validInput);
  addReferrerCode(String? e) => _referrerCode.sink.add(e!);

  Stream<bool> get canRegister => Rx.combineLatest6(
      email,
      password,
      name,
      _password,
      _confirmPassword,
      termsAndCondition,
      (
        a,
        b,
        c,
        d,
        e,
        f,
      ) =>
          true);

  get body => {
        "name": _name.value,
        "username": _username.value,
        "email": _email.value,
        "password": _password.value,
        "password_confirmation": _confirmPassword.value,
        "referrered_by_id": _referrerCode.valueOrNull
      };

  dispose() async {
    _confirmPassword.close();
    confirmPassword.drain();
    _password.close();
    _email.close();
    _username.close();
    _name.close();
    _termsAndConditions.value = false;
    _referrerCode.close();
  }
}
