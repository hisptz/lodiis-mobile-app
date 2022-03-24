import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/modules/about_app/utils/about_page_util.dart';
import 'package:provider/provider.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    Key? key,
    required this.currentLanguage,
  }) : super(key: key);

  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<CurrentUserState>(
      builder: (context, currentUserState, child) {
        CurrentUser? currentUser = currentUserState.currentUser;
        String currentUserLocations = currentUserState.currentUserLocations;
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: const Text(
                "User Info",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Table(
                  defaultColumnWidth: FixedColumnWidth(
                    size.width * 0.3,
                  ),
                  children: [
                    AboutPageUtil.getTableRowContent(
                      "Full name",
                      currentUser?.name ?? "",
                    ),
                    AboutPageUtil.getTableRowContent(
                      "username",
                      currentUser?.username ?? "",
                    ),
                    AboutPageUtil.getTableRowContent(
                      "email",
                      currentUser?.email ?? "",
                    ),
                    AboutPageUtil.getTableRowContent(
                      "phone number",
                      currentUser?.phoneNumber ?? "",
                    ),
                    AboutPageUtil.getTableRowContent(
                      "Assigned locations",
                      currentUserLocations,
                    ),
                    AboutPageUtil.getTableRowContent(
                      "Implementing Partner",
                      currentUser?.implementingPartner ?? "",
                    ),
                    AboutPageUtil.getTableRowContent(
                      "Sub implementing Partner",
                      currentUser?.subImplementingPartner ?? "",
                    ),
                    AboutPageUtil.getTableRowContent(
                      "Assigned Roles",
                      currentUser?.userRoles ?? "",
                    ),
                    AboutPageUtil.getTableRowContent(
                      "Assigned Groups",
                      currentUser?.userGroups ?? "",
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
