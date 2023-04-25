// ignore_for_file: depend_on_referenced_packages

import 'package:crypto_credit/controller/field_validations/validations.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with FieldValidation {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validInput);
  addEmail(String? e) => _email.sink.add(e!);

  Stream<String> get password => _password.stream.transform(validInput);
  addPassword(String? e) => _password.sink.add(e!);

  Stream<bool> get canLogin =>
      Rx.combineLatest2(email, password, (a, b) => true);

  get body => {"email": _email.value, "password": _password.value};

  void dispose() {
    email.drain('');
    password.drain('');
    _email.sink.add('');
    _password.sink.add('');
  }
}
