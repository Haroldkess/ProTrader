import 'package:crypto_credit/controller/bind_api/bind_controller.dart';
import 'package:crypto_credit/controller/bind_api/bind_provider.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/widgets/bind_api_cards.dart';
import 'package:crypto_credit/views/widgets/custom_alerts.dart';
import 'package:crypto_credit/views/widgets/custom_button.dart';
import 'package:crypto_credit/views/widgets/custom_fields.dart';
import 'package:crypto_credit/views/widgets/loaders/progress_loader.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BindAPIScreen extends StatefulWidget {
  final String? secret;
  final String? public;
  const BindAPIScreen({Key? key, required this.public, required this.secret})
      : super(key: key);

  @override
  State<BindAPIScreen> createState() => _BindAPIScreenState();
}

class _BindAPIScreenState extends State<BindAPIScreen> {
  TextEditingController? pubController;
  TextEditingController? secController;
  @override
  void initState() {
    pubController = TextEditingController(text: widget.public ?? "");
    secController = TextEditingController(text: widget.secret ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    BindWare stream = context.watch<BindWare>();

    return Scaffold(
      body: PageWithBackButton(
        title: "Bind API",
        body: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: BindAPiCards(
                          btnColor: Color(0xffFFB400),
                          image: "binance",
                          title: "BINANCE",
                          btnText: "bind api",
                          subTitle: "Exchange the World",
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: BindAPiCards(
                          btnText: "coming soon",
                          btnColor: Color(0xff8494A8),
                          image: "coinbase",
                          title: "COINBASE PRO",
                          subTitle: "Trusted platform",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text("BINANCE Binding",
                      style: appTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: theme.textTheme.titleLarge!.color)),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.colorScheme.secondary),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notice:",
                          style: appTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: theme.textTheme.titleLarge!.color),
                        ),
                        Text(
                          "Confirm that the API Permission has checked \"Enable Spot & Margin Trading\"",
                          style: appTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff8F82A5)),
                        ),
                        Text(
                            "Enter correct API, do not eneter special characters",
                            style: appTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff8F82A5)))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 22),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.colorScheme.secondary),
                    child: Column(
                      children: [
                        BindingTextField(
                          label: "API PUBLIC KEY",
                          controller: pubController,
                        ),
                        BindingTextField(
                          label: "API SECRET KEY",
                          controller: secController,
                        ),
                        stream.loadStatus
                            ? const Loader()
                            : customButton(
                                text: "SAVE",
                                function: () async {
                                  if (pubController!.text.isEmpty ||
                                      secController!.text.isEmpty) {
                                    showToast(context,
                                        "Please add the correct keys",
                                        isError: true);
                                    return;
                                  }
                                  await BindController.attemptBinds(
                                      context,
                                      pubController!.text,
                                      secController!.text,
                                      stream.userId);
                                })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


      // key: UniqueKey(),
      //   direction: DismissDirection.horizontal,
      //   onDismissed: (direction) {
      //     Navigator.pop(context);
      //   },