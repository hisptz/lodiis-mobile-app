import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/app_info_state/app_info_state.dart';
import 'package:kb_mobile_app/modules/about_app/utils/about_page_util.dart';
import 'package:provider/provider.dart';

class AppInfoContainer extends StatelessWidget {
  const AppInfoContainer({
    Key? key,
    required this.currentLanguage,
  }) : super(key: key);

  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AppInfoState>(
      builder: (context, appInfoState, child) {
        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: size.width * 0.1,
                backgroundColor: Color(0xFFF3F3F3),
                backgroundImage: AssetImage('assets/logos/app-logo.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text(
                "App Info",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Table(
                    defaultColumnWidth: FixedColumnWidth(size.width * 0.3),
                    children: [
                      AboutPageUtil.getTableRowContent(
                        this.currentLanguage == 'lesotho'
                            ? 'Lebitso la App'
                            : 'App Name',
                        appInfoState.currentAppName,
                      ),
                      AboutPageUtil.getTableRowContent(
                        'App Version',
                        appInfoState.currentAppVersion,
                      ),
                      AboutPageUtil.getTableRowContent(
                        'App Id',
                        appInfoState.currentAppId,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
