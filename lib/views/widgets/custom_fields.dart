import 'package:crypto_credit/controller/toggle_password_visibility/toggle_password_visibility_bloc.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PlainPasswordField extends StatelessWidget {
  const PlainPasswordField(
      {Key? key,
      this.hint,
      this.label,
      this.stream,
      this.onchanged,
      this.number,
      this.leading,
      this.controller})
      : super(key: key);

  final String? label;
  final String? hint;
  final Stream? stream;
  final Function(String e)? onchanged;
  final bool? number;
  final Widget? leading;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    TogglePasswordVisibilityBloc togglePasswordVisibilityBloc =
        TogglePasswordVisibilityBloc();
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: label != null,
              child: Text(
                "$label",
                style: appTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: theme.primaryTextTheme.titleLarge!.color),
              )),
          Visibility(
            visible: label != null,
            child: const SizedBox(
              height: 9,
            ),
          ),
          StreamBuilder(
              stream: stream,
              builder: (context, s) {
                return StreamBuilder<bool>(
                    initialData: true,
                    stream: togglePasswordVisibilityBloc.showPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: controller,
                        obscureText: snapshot.data ?? true,
                        onChanged: onchanged,
                        keyboardType: number == true
                            ? const TextInputType.numberWithOptions()
                            : null,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: TextStyle(
                              color: theme.primaryTextTheme.titleLarge!.color),
                          suffix: StreamBuilder<bool>(
                              initialData: true,
                              stream:
                                  togglePasswordVisibilityBloc.passwordShown,
                              builder: (context, snapshot) {
                                return InkWell(
                                    onTap: () => togglePasswordVisibilityBloc
                                        .toggleShowPassword(),
                                    // ignore: unrelated_type_equality_checks
                                    child: snapshot.data!
                                        ? Icon(
                                            Icons.visibility_off,
                                            size: 20,
                                            color: primaryColor,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            size: 20,
                                            color: primaryColor,
                                          ));
                              }),
                          errorText: s.hasError ? s.error.toString() : null,
                        ),
                      );
                    });
              })
        ],
      ),
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField(
      {Key? key,
      this.hint,
      this.label,
      this.stream,
      this.onchanged,
      this.number,
      this.leading,
      this.controller})
      : super(key: key);

  final String? label;
  final String? hint;
  final Stream? stream;
  final Function(String e)? onchanged;
  final bool? number;
  final Widget? leading;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: label != null,
            child: Text(
              "$label",
              style: appTextStyle.copyWith(fontSize: 15, color: lightTextColor),
            ),
          ),
          Visibility(
            visible: label != null,
            child: const SizedBox(
              height: 9,
            ),
          ),
          StreamBuilder(
              stream: stream,
              builder: (context, s) {
                return StreamBuilder<bool>(
                    initialData: true,
                    stream: $passwordToggle.showPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: controller,
                        obscureText: snapshot.data ?? true,
                        onChanged: onchanged,
                        keyboardType: number == true
                            ? const TextInputType.numberWithOptions()
                            : null,
                        decoration: InputDecoration(
                          hintText: hint,
                          prefixIcon: leading == null
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                    top: 15,
                                    bottom: 15,
                                  ),
                                  child: leading,
                                ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: StreamBuilder<bool>(
                                initialData: false,
                                stream: $passwordToggle.passwordShown,
                                builder: (context, snapshot) {
                                  return InkWell(
                                      onTap: () =>
                                          $passwordToggle.toggleShowPassword(),
                                      // ignore: unrelated_type_equality_checks
                                      child: snapshot.data!
                                          ? Icon(
                                              Icons.visibility_off,
                                              size: 20,
                                              color: primaryColor,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              size: 20,
                                              color: primaryColor,
                                            ));
                                }),
                          ),
                          errorText: s.hasError ? s.error.toString() : null,
                        ),
                      );
                    });
              })
        ],
      ),
    );
  }
}

class PlainTextField extends StatelessWidget {
  const PlainTextField({
    Key? key,
    this.label,
    this.leading,
    this.trailing,
    this.hint,
    this.info,
    this.stream,
    this.enabled,
    this.onchanged,
    this.maxLines,
    this.controller,
    this.onTap,
    this.readOnly,
    this.number = false,
    this.currency = false,
    this.strictly_string = false,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final Widget? info;
  final Stream? stream;
  final Function(String? e)? onchanged;
  final int? maxLines;
  final bool? enabled, readOnly;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;
  final bool? number;
  final bool? currency;
  final bool strictly_string;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                    visible: label != null,
                    child: Text(
                      "$label",
                      style: appTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: theme.primaryTextTheme.titleLarge!.color),
                    )),
                TextFormField(
                  onTap: onTap,
                  controller: controller,
                  keyboardType: number == true
                      ? const TextInputType.numberWithOptions()
                      : null,
                  inputFormatters: strictly_string
                      ? <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                        ]
                      : number == true
                          ? <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ]
                          : null,
                  enabled: enabled ?? true,
                  readOnly: readOnly ?? false,
                  maxLines: maxLines ?? 1,
                  onChanged: onchanged,
                  decoration: InputDecoration(
                      errorMaxLines: maxLines,
                      hintText: hint,
                      hintStyle: TextStyle(
                          color: theme.primaryTextTheme.titleLarge!.color),
                      prefix: leading,
                      errorText:
                          snapshot.hasError ? snapshot.error.toString() : null),
                ),
              ],
            );
          }),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  RoundedTextField({
    Key? key,
    this.label,
    this.leading,
    this.trailing,
    this.hint,
    this.info,
    this.stream,
    this.enabled,
    this.onchanged,
    this.maxLines,
    this.controller,
    this.remove,
    this.onTap,
    this.readOnly,
    this.number = false,
    this.currency = false,
    this.strictly_string = false,
    this.initialValue,
  }) : super(key: key);

  final String? label, remove;
  final String? hint, initialValue;
  final Widget? info;
  final Stream? stream;
  final Function(String? e)? onchanged;
  final int? maxLines;
  final bool? enabled, readOnly;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;
  final bool? number;
  final bool? currency;
  final bool strictly_string;
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                    visible: label != null,
                    child: Text(
                      "$label",
                      style: appTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.titleLarge!.color),
                    )),
                Visibility(
                    visible: label != null,
                    child: SizedBox(
                      height: 8.7,
                    )),
                Container(
                  child: TextFormField(
                    cursorColor: primaryColor,
                    onTap: onTap,
                    initialValue: initialValue,
                    controller: controller,
                    keyboardType: number == true
                        ? const TextInputType.numberWithOptions()
                        : null,
                    inputFormatters: strictly_string
                        ? <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z]")),
                          ]
                        : number == true
                            ? <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ]
                            : currency == true
                                ? <TextInputFormatter>[
                                    CurrencyTextInputFormatter()
                                  ]
                                : null,
                    enabled: enabled ?? true,
                    readOnly: readOnly ?? false,
                    maxLines: maxLines ?? 1,
                    onChanged: onchanged,
                    decoration: InputDecoration(
                        suffixIcon: trailing,
                        prefixIcon: leading,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff372648)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff372648)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff372648)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff372648)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: hint,
                        hintStyle: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color),
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class CurrencyTextInputFormatter extends TextInputFormatter {
  static const int _defaultFractionDigits = 2;

  final int decimalDigits;
  CurrencyTextInputFormatter({this.decimalDigits = _defaultFractionDigits})
      : assert(decimalDigits >= 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if (text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    double value = double.parse(text);
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      decimalDigits: decimalDigits,
      symbol: '\$',
    );

    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class TextCheckBox extends StatelessWidget {
  const TextCheckBox({Key? key, this.text, this.stream, this.onchanged})
      : super(key: key);

  final Widget? text;
  final Stream<bool>? stream;
  final void Function(bool? e)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<bool>(
              stream: stream,
              builder: (context, snapshot) {
                return GestureDetector(
                  excludeFromSemantics: true,
                  child: Container(
                    height: 22,
                    width: 22,
                    child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        splashRadius: 10,
                        checkColor: appWhite,
                        fillColor: MaterialStateProperty.all(primaryColor),
                        value: snapshot.data ?? false,
                        onChanged: onchanged),
                  ),
                );
              }),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: text!)
        ],
      ),
    );
  }
}

class SelectField extends StatelessWidget {
  const SelectField(
      {Key? key,
      this.hint,
      this.info,
      this.items,
      this.stream,
      this.label,
      this.onchanged})
      : super(key: key);

  final String? label;
  final String? hint;
  final Widget? info;
  final List<String>? items;
  final Stream? stream;
  final void Function(String? e)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
                visible: label != null,
                child: Text("$label",
                    style: appTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: appWhite))),
            Visibility(
              visible: label != null,
              child: const SizedBox(
                height: 6,
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  // Focused Border
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                  // Error Border
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                  // Focused Error Border
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
              isExpanded: true,
              // value: items![0],
              onChanged: onchanged,
              isDense: true,
              items: [
                ...items!
                    .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          enabled: true,
                          value: e,
                          onTap: () => null,
                          child: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                    .toList(),
              ],
              hint: Text(
                "$hint",
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff999999),
                    fontSize: 14),
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedSelectField extends StatelessWidget {
  const RoundedSelectField(
      {Key? key,
      this.hint,
      this.info,
      this.items,
      this.stream,
      this.value,
      this.label,
      this.onchanged})
      : super(key: key);

  final String? label;
  final String? hint;
  final Widget? info;
  final List<String>? items;
  final String? value;
  final Stream? stream;
  final void Function(String? e)? onchanged;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
                visible: label != null,
                child: Text("$label",
                    style: appTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: appWhite))),
            Visibility(
              visible: label != null,
              child: const SizedBox(
                height: 6,
              ),
            ),
            DropdownButtonFormField<String>(
              style: TextStyle(color: theme.textTheme.titleLarge!.color),
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 0)),
              isExpanded: true,
              onChanged: onchanged,
              isDense: true,
              items: [
                ...items!
                    .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          enabled: true,
                          value: e,
                          onTap: () => null,
                          child: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: theme.textTheme.titleLarge!.color),
                          ),
                        ))
                    .toList(),
              ],
              hint: Text(
                hint ?? "",
                style: TextStyle(
                    fontSize: 14, color: theme.textTheme.titleLarge!.color),
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedEditFields extends StatelessWidget {
  RoundedEditFields(
      {Key? key,
      this.label,
      this.leading,
      this.trailing,
      this.hint,
      this.info,
      this.stream,
      this.enabled,
      this.onchanged,
      this.maxLines,
      this.controller,
      this.remove,
      this.onTap,
      this.readOnly,
      this.number = false,
      this.currency = false,
      this.strictly_string = false,
      this.delete,
      this.obscure,
      this.fontSize,
      this.borderColor,
      this.autoFocus,
      this.edit})
      : super(key: key);

  final String? label, remove;
  final String? hint;
  final Widget? info;
  final Stream? stream;
  final Function(String? e)? onchanged;
  final int? maxLines;
  final bool? enabled, readOnly;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap, delete, edit;
  final bool? number;
  final bool? currency;
  final bool strictly_string;
  TextEditingController? controller;
  bool? obscure;
  bool? autoFocus;

  double? fontSize;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: true,
              child: Text(
                "$label",
                style: appTextStyle.copyWith(
                    fontSize: fontSize ?? 11,
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.titleLarge!.color),
              )),
          Visibility(
              visible: true,
              child: SizedBox(
                height: 8.7,
              )),
          Container(
            child: TextFormField(
              autofocus: autoFocus ?? true,
              cursorColor: primaryColor,
              //onTap: onTap,
              controller: controller,
              keyboardType: number == true
                  ? const TextInputType.numberWithOptions()
                  : null,
              // inputFormatters: strictly_string
              //     ? <TextInputFormatter>[
              //         FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
              //       ]
              //     : number == true
              //         ? <TextInputFormatter>[
              //             FilteringTextInputFormatter.digitsOnly,
              //           ]
              //         : null,
              // enabled: enabled ?? true,
              // readOnly: readOnly ?? false,
              maxLines: maxLines ?? 1,
              //onChanged: onchanged,
              obscureText: obscure ?? false,
              decoration: InputDecoration(
                prefixIcon: leading,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: borderColor ?? const Color(0xff372648)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: borderColor ?? const Color(0xff372648)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: hint,
                hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge!.color),
                // errorText: snapshot.hasError
                //     ? snapshot.error.toString()
                //     : null
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BindingTextField extends StatelessWidget {
  const BindingTextField(
      {Key? key,
      this.label,
      this.hint,
      this.info,
      this.stream,
      this.enabled,
      this.maxLines,
      this.controller,
      this.remove,
      this.onTap,
      this.readOnly,
      this.number = false,
      this.currency = false,
      this.strictly_string = false,
      this.initialValue,
      this.delete,
      this.edit})
      : super(key: key);

  final String? label, remove;
  final String? hint, initialValue;
  final Widget? info;
  final Stream? stream;

  final int? maxLines;
  final bool? enabled, readOnly;
  final void Function()? onTap, delete, edit;
  final bool? number;
  final bool? currency;
  final bool strictly_string;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
                visible: label != null,
                child: Text(
                  "$label",
                  style: appTextStyle.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.titleLarge!.color),
                )),
            Visibility(
                visible: label != null,
                child: SizedBox(
                  height: 8.7,
                )),
            Container(
              child: TextFormField(
                cursorColor: primaryColor,
                onTap: onTap,
                initialValue: initialValue,
                controller: controller,
                enabled: enabled ?? true,
                readOnly: readOnly ?? false,
                maxLines: maxLines ?? 1,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xff372648)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: hint,
                  hintStyle:
                      TextStyle(color: theme.textTheme.titleLarge!.color),
                ),
              ),
            ),
          ],
        ));
  }
}
