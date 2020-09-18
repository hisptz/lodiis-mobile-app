import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/components/organization_body_content.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

// ignore: must_be_immutable
class ExpandedOrganisationWidgets extends StatelessWidget {
  OrganisationUnit organisationUnit;
  int organisationUnitLegnth = 0;
  bool onExpand = true;
  List<Icon> onExpandIcon = [
    Icon(
      Icons.add,
      size: 16,
    ),
    Icon(
      Icons.minimize,
      size: 16,
    )
  ];

  ExpandedOrganisationWidgets({
    this.organisationUnit,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => {
          // Navigator.pop(context, organisationUnit)
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onExpand = !onExpand;
                   
                    (context as Element).markNeedsBuild();
                  },
                  child: Container(
                      padding: EdgeInsets.only(right: 26),
                      color: Colors.transparent,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: onExpand
                          ? onExpandIcon[0]
                          : onExpandIcon[1]),
                ),
                Expanded(
                  child: Text(
                    organisationUnit.name,
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              child: OrganisationContent(
               onExpandIcon: onExpandIcon,
                organisationUnit: organisationUnit,
                onExpand:onExpand,
              ),
            )

            // Divider()
          ],
        ),
      ),
    );
  }
}
