import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/login_form_state/login_form_state.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/ovc_service_child_view_page.dart';
import 'package:kb_mobile_app/modules/splash/splash.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IntervetionCardState()),
          ChangeNotifierProvider(create: (_) => LoginFormState()),
          ChangeNotifierProvider(
              create: (_) => InterventionBottomNavigationState()),
          ChangeNotifierProvider(create: (_) => EnrollmentFormState())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Ovc-dreams",
          theme: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
              primaryColor: CustomColor.defaultPrimaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SafeArea(child: Splash()),
        ));
  }
}
