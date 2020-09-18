import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/service/components/organisationPop_MenuService.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

// ignore: must_be_immutable
class OrganisationUnitPopMenu extends StatelessWidget {
  List<dynamic> currentUserOrganisationId = [];

  List<OrganisationUnit> getCompleteOrganisationOfCurrentUser(
      List<dynamic> currentUserOrganisationId) {
    List<OrganisationUnit> organisations = [];

    for (var organisationId in currentUserOrganisationId) {
      OrganisationUnitOffline()
          .getOrganisationUnitById(organisationId)
          .then((value) => {
                value.forEach((organisation) {
                  organisations.add(organisation);
                })
              });
    }

    return organisations;
  }


//  getCompleteOrganisationOfCurrentUser(
//                     CurrentUserServiceState().getCompleteCurrentUser())
//                 .length

// getCompleteOrganisationOfCurrentUser(
//                     CurrentUserServiceState().getCompleteCurrentUser())
  @override
  Widget build(BuildContext context) {
    // return OrganisationExpanded(
    //   length: ,
    //   organisationUnit: ,
         

    // );
  }
}
