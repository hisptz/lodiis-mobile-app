import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/components/organisation_component.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';


// ignore: must_be_immutable
class OrganisationUnitRecursivePopUpMenu extends StatelessWidget {
  List currentOrganisationId;
  OrganisationUnitRecursivePopUpMenu({this.currentOrganisationId});

  List<OrganisationUnit> organisations = [];

  getCompleteOrganizationUnitOfCurrentUser(
      List currentUserOrganisationId, BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(right: 0, top: 2),
        child: ListView.builder(
            dragStartBehavior: DragStartBehavior.start,
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                getCompleteOrganizationUnitOfCurrentUser(currentOrganisationId, context)
                    .length,
            itemBuilder: (context, index) {
              return ExpandedOrganisationWidgets(
                organisationUnit: getCompleteOrganizationUnitOfCurrentUser(
                    currentOrganisationId, context)[index],
              );
            }),
      ),
    );
  }
}
