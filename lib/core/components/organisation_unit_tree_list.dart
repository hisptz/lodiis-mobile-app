import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/organisation_unit_list.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class OrganisationUnitTreeList extends StatefulWidget {
  const OrganisationUnitTreeList(
      {Key key, @required this.organisationUnitIds, @required this.labelColor})
      : super(key: key);

  final List organisationUnitIds;
  final Color labelColor;

  @override
  _OrganisationUnitTreeListState createState() =>
      _OrganisationUnitTreeListState();
}

class _OrganisationUnitTreeListState extends State<OrganisationUnitTreeList> {
  bool isLoading = true;
  List<OrganisationUnit> organisationUnits;

  @override
  void initState() {
    super.initState();
    discoveringOrganisatioUnits(widget.organisationUnitIds);
  }

  void discoveringOrganisatioUnits(List organisationUnitids) async {
    var data = await OrganisationUnitService()
        .getOrganisationUnits(organisationUnitids);
    setState(() {
      organisationUnits = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? Container(
              child: CircularProcessLoader(
                color: widget.labelColor,
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: organisationUnits
                    .map((OrganisationUnit organisationUnit) =>
                        OrganisationUnitList(
                          labelColor: widget.labelColor,
                          organisationUnit: organisationUnit,
                        ))
                    .toList(),
              ),
            ),
    );
  }
}
