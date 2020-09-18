import 'package:flutter/widgets.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/organisation_popUpMenu.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/organisation_unit_recursive_util.dart';


class OrganisationUnitUtil {
  static void populateData(BuildContext context) async {
    var modal = OrganisationUnitPopUpMenu();
    var response = await OrganisationUtil.showPopUpModal(context, modal);

    if (response != null) {
      return print(response.name);
    }
    return null;
  }
}
