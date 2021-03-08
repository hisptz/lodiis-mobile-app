import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/app_info_state/app_info_state.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/device_connectivity_state/device_connectivity_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/services/language_selection_service.dart';
import 'package:kb_mobile_app/core/services/user_access.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/modules/intervention_selection/intervention_selection.dart';
import 'package:kb_mobile_app/modules/language_selection/language_selection.dart';
import 'package:kb_mobile_app/modules/login/login.dart';
import 'package:kb_mobile_app/modules/splash/components/splash_implementer_list.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    AppUtil.setStatusBarColor(CustomColor.defaultPrimaryColor);
    checkingLanguageSelectionAndCurrentUser();
  }

  void checkingLanguageSelectionAndCurrentUser() async {
    CurrentUser user = await UserService().getCurrentUser();
    bool isUserLoginIn = user != null ? user.isLogin : false;
    String currentLanguage =
        await LanguageSelectionService.getCurrentLanguageSelection();
    Provider.of<AppInfoState>(context, listen: false).setCurrentAppInfo();
    Provider.of<DeviceConnectivityState>(context, listen: false)
        .initializeConnectionStatus();
    if (currentLanguage != null) {
      Provider.of<LanguageTranslationState>(context, listen: false)
          .setLanguageTranslation(currentLanguage);
      if (isUserLoginIn) {
        var userAccessConfigurations =
            await UserAccess().getSavedUserAccessConfigurations();
        Provider.of<CurrentUserState>(context, listen: false)
            .setCurrentUser(user, userAccessConfigurations);
      }
      setLandingPage(isUserLoginIn);
    } else {
      setLanguageSelectionPage();
    }
  }

  void setLanguageSelectionPage() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LanguageSelection(),
        ),
      ),
    );
  }

  void setLandingPage(bool isUserLoginIn) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isUserLoginIn ? InterventionSelection() : Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomColor.defaultPrimaryColor,
              ),
              height: size.height * 0.83,
              child: CircularProcessLoader(
                color: CustomColor.defaultSecondaryColor,
                size: 2.0,
              ),
            ),
            SplashImplementingPartnerList(),
          ],
        ),
      ),
    );
  }
}
