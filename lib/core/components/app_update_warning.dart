import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/app_info_state/app_info_state.dart';
import 'package:provider/provider.dart';

class AppUpdateWarning extends StatelessWidget {
  const AppUpdateWarning({Key? key}) : super(key: key);

  void launchPlayStoreUrl() {
    print('Updating the app');
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.amberAccent;
    double iconHeight = 20.0;
    bool shouldUpdateApp =
        Provider.of<AppInfoState>(context, listen: false).shouldUpdateTheApp ||
            Provider.of<AppInfoState>(context, listen: false)
                .showWarningToAppUpdate;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: shouldUpdateApp
          ? GestureDetector(
              onTap: launchPlayStoreUrl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New App Update Available! Tap to update',
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                  Icon(
                    Icons.system_security_update,
                    color: color,
                    size: iconHeight,
                  )
                ],
              ),
            )
          : Container(),
    );
  }
}
