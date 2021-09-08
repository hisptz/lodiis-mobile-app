import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:provider/provider.dart';

class AccessToDataEntryWarning extends StatelessWidget {
  const AccessToDataEntryWarning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CurrentUserState>(
        builder: (context, currentUserState, child) {
          CurrentUser? currentUser = currentUserState.currentUser;
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: Text(
                      "You have no access to do data entry => ${currentUser.toString()}",
                      style: TextStyle().copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFAFAFA),
                      )),
                ),
                Container(
                  child: Text("${currentUser.toString()}",
                      style: TextStyle().copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFAFAFA),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
