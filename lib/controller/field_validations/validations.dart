import 'dart:async';

mixin FieldValidation {
  StreamTransformer<String, String> validInput =
      StreamTransformer.fromHandlers(handleData: (data, sink) {
    data = data.trim();
    if (data.isEmpty) {
      sink.addError("Field Cannot Be Empty");
    } else {
      sink.add(data);
    }
  });

  StreamTransformer<bool, bool> termsAndConditionValidation =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (terms, sink) {
    if (terms != true) {
      sink.addError("Please accept terms and conditions to proceed");
    } else {
      sink.add(terms);
    }
  });

  StreamTransformer<String, String> passwordValidation =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    password = password.trim();
    if (password.isEmpty || password.length < 8) {
      sink.addError("Password Must contain 8 Characters or more");
    } else if (!password.contains(RegExp("^(?=.*[0-9])"))) {
      sink.addError("Password Must Contain at least one number");
    } else if (!password.contains(RegExp("(?=.*[a-z])"))) {
      sink.addError("Password Must contain one Lower case letter");
    } else if (!password.contains(RegExp("(?=.*[A-Z])"))) {
      sink.addError("Password Must contain one Upper case letter");
    } else if (!password.contains(RegExp(r"(?=.*?[#?!@$%^&*-])"))) {
      sink.addError("Password Must contain one Special character");
    } else {
      sink.add(password.toString().trim());
    }
  });

  StreamTransformer<String, String> emailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    email = email.trim();
    if (email.isEmpty ||
        !email.contains(RegExp(
            r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"))) {
      sink.addError("Enter a valid email address");
    } else {
      sink.add(email);
    }
  });

  StreamTransformer<String, String> phoneNumberValidation =
      StreamTransformer.fromHandlers(handleData: (data, sink) {
    data = data.trim();
    if (data.isEmpty) {
      sink.addError("Field Cannot Be Empty");
    } else if (data.length != 11) {
      sink.addError("Enter A Valid Phone Number");
    } else {
      sink.add(data);
    }
  });
}
