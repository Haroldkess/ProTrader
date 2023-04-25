import 'package:crypto_credit/controller/biometrics/biometrics.dart';
import 'package:crypto_credit/models/dashboard_data/dashboard_data_model.dart';
import 'package:crypto_credit/models/top_traders/top_traders_models.dart';
import 'package:crypto_credit/service_locator.dart';
import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/constants/textDecoration/text_decoration.dart';
import 'package:crypto_credit/views/landing_screens/landing_screen.dart';
import 'package:crypto_credit/views/landing_screens/settings/two_factor/two_factor.dart';
import 'package:crypto_credit/views/widgets/kDivider.dart';
import 'package:crypto_credit/views/widgets/log.dart';
import 'package:crypto_credit/views/widgets/modals/update_password_modal.dart.dart';
import 'package:crypto_credit/views/widgets/page_with_nav.dart';
import 'package:crypto_credit/views/widgets/profile_pics.dart';
import 'package:crypto_credit/views/widgets/settings_card.dart';
import 'package:crypto_credit/views/widgets/settings_container.dart';
import 'package:crypto_credit/views/widgets/toggles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/theme_modes/theme_provider.dart';
import '../../../controller/update_user_info/update_address/address_provider.dart';
import '../../../controller/update_user_info/update_phone/phone_provider.dart';
import '../../../controller/update_user_info/update_username/username_provider.dart';
import '../../widgets/modals/update_address.dart';
import '../../widgets/modals/update_phone_modal.dart';
import '../../widgets/modals/update_username.dart';
import '../home_page/notification/notifications_screens.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key, this.automaticallyImplyLeading = false})
      : super(key: key);

  final bool? automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ThemeAndUtilsProvider stream = context.watch<ThemeAndUtilsProvider>();
    UsernameWare usernameWare = context.watch<UsernameWare>();
    PhoneWare phoneWare = context.watch<PhoneWare>();
    AddressWare addressWare = context.watch<AddressWare>();
    return Scaffold(
      body: PageWithBackButton(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: "Settings",
        action: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NotificationsScreen();
            }));
          },
          child: Icon(
            Icons.notifications_outlined,
            size: 28,
            color: primaryColor,
          ),
        ),
        color: theme.colorScheme.secondary,
        body: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfilePics(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SettingsTitle(
                    title: "App Mode",
                  ),
                  SettingsContainer(children: [
                    StreamBuilder<DashboardData>(
                        stream: $dashboardDataBloc.dashBoardData,
                        builder: (context, snapshot) {
                          while (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }
                          return SettingsCard(
                            title: snapshot.data == null
                                ? ""
                                : snapshot.data!.mode == "LIVE"
                                    ? "LIVE"
                                    : snapshot.data!.mode,
                            trailing: snapshot.data == null
                                ? null
                                : appModeToggle(snapshot.data!.mode!),
                          );
                        }),
                  ]),
                  const SettingsTitle(
                    title: "Theme",
                  ),
                  SettingsContainer(children: [
                    SettingsCard(
                      title: "Dark mode",
                      trailing: themeToggle(context, stream.isDark),
                    ),
                  ]),
                  const SettingsTitle(
                    title: "Notifications",
                  ),
                  SettingsContainer(children: [
                    SettingsCard(
                      title: "Payment Alert",
                      subTitle: "Send notification when new payment receiveds",
                      trailing: toggle(),
                    ),
                    const KDivider(),
                    SettingsCard(
                        title: "Notification Sound",
                        trailing: notificationToggle(context, stream.isShow)),
                  ]),
                  const SettingsTitle(
                    title: "Profile Settings",
                  ),
                  SettingsContainer(children: [
                    InkWell(
                      onTap: () => updateUsernameModal(
                          context, usernameWare.username, usernameWare.name),
                      child: SettingsCard(
                        title: "Change Username",
                        subTitle: usernameWare.username.isEmpty
                            ? null
                            : usernameWare.username,
                      ),
                    ),
                    const KDivider(),
                    InkWell(
                      onTap: () => updatePhoneModal(context, phoneWare.phone),
                      child: SettingsCard(
                        title: "Update Phone",
                        subTitle:
                            phoneWare.phone.isEmpty ? null : phoneWare.phone,
                      ),
                    ),
                    const KDivider(),
                    InkWell(
                      onTap: () async {
                        updateAdressModals(context);
                      },
                      child: SettingsCard(
                        // trailing: Text("Edit"),
                        title: "Address",
                        subTitle: addressWare.country.isEmpty ||
                                addressWare.state.isEmpty
                            ? null
                            : "${addressWare.state} - ${addressWare.country}",
                      ),
                    ),
                    const KDivider(),
                    SettingsCard(
                      trailing: toggle(),
                      title: "Private Profile",
                    ),
                  ]),
                  const SettingsTitle(
                    title: "Security",
                  ),
                  SettingsContainer(children: [
                    InkWell(
                      onTap: () => updatePasswordModal(context),
                      child: SettingsCard(
                        title: "Update Password",
                      ),
                    ),
                    const KDivider(),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TwoFactor())),
                      child: SettingsCard(
                        title: "2FA",
                      ),
                    ),
                    const KDivider(),
                    SettingsCard(
                      trailing: toggle(),
                      title: "2 Step Verification",
                    ),
                    FutureBuilder(
                        future: isDeviceSupported(),
                        builder: (context, ss) {
                          return Visibility(
                            visible: ss.data == true,
                            child: Column(
                              children: [
                                const KDivider(),
                                SettingsCard(
                                  trailing: biometrictoggle(),
                                  title: "Biometric Authentication",
                                ),
                              ],
                            ),
                          );
                        }),
                    const KDivider(),
                    SettingsCard(
                      tap: () async {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          elevation: 10.0,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 3),
                          content: Row(
                            children: [
                              Text(
                                "You will be signed out, proceed?",
                                style: appTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: appWhite.withOpacity(.8)),
                              ),
                            ],
                          ),
                          backgroundColor: primaryColor.withOpacity(.7),
                          action: SnackBarAction(
                              label: "Yes",
                              textColor: appWhite,
                              onPressed: () async {
                                await closeAll(context);
                                initializesingletons();
                              }),
                        ));
                      },
                      title: "Log out",
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
