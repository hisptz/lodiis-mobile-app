import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/organisation_unit_list.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/services/program_service.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class OrganisationUnitTreeList extends StatefulWidget {
  const OrganisationUnitTreeList({
    Key? key,
    required this.organisationUnitIds,
    required this.labelColor,
    required this.allowedSelectedLevels,
    this.filteredPrograms = const [],
  }) : super(key: key);

  final List? organisationUnitIds;
  final Color? labelColor;
  final List<int?>? allowedSelectedLevels;
  final List<String>? filteredPrograms;

  @override
  _OrganisationUnitTreeListState createState() =>
      _OrganisationUnitTreeListState();
}

class _OrganisationUnitTreeListState extends State<OrganisationUnitTreeList> {
  bool isLoading = true;
  late List<OrganisationUnit> organisationUnits;

  @override
  void initState() {
    super.initState();
    discoveringOrganisationUnits(widget.organisationUnitIds!);
  }

  void discoveringOrganisationUnits(List organisationUnitIds) async {
    var data = await OrganisationUnitService()
        .getOrganisationUnits(organisationUnitIds);
    if (widget.filteredPrograms!.length > 0) {
      List<String?> programsOrganisationUnits = [];
      for (String program in widget.filteredPrograms!) {
        List<String?> organisationUnits =
            await ProgramService().getOfflineProgramOrganisationUnits(program);
        programsOrganisationUnits.addAll(organisationUnits);
      }
      data.removeWhere(
          (ou) => !programsOrganisationUnits.toSet().toList().contains(ou.id));
    }

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
                          filteredPrograms: widget.filteredPrograms,
                          allowedSelectedLevels: widget.allowedSelectedLevels,
                        ))
                    .toList(),
              ),
            ),
    );
  }
}
