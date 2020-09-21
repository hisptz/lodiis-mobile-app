import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/organisation_unit_tree_list.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class OrganisationUnitList extends StatefulWidget {
  const OrganisationUnitList(
      {Key key, @required this.organisationUnit, @required this.labelColor})
      : super(key: key);

  final OrganisationUnit organisationUnit;
  final Color labelColor;

  @override
  _OrganisationUnitListState createState() => _OrganisationUnitListState();
}

class _OrganisationUnitListState extends State<OrganisationUnitList> {
  bool isExpanded = false;
  bool hasChildren = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      hasChildren = widget.organisationUnit.children.length > 0;
    });
  }

  void toggleOrganisationUnit() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void onSelectOrganisationUnit(
    BuildContext context,
    OrganisationUnit organisationUnit,
  ) {
    Navigator.pop(context, organisationUnit);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.0, left: 10.0, bottom: 3.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 25.0,
                  child: Visibility(
                      visible: hasChildren,
                      child: InkWell(
                        onTap: toggleOrganisationUnit,
                        child: Icon(
                          isExpanded
                              ? Icons.remove_circle_outline
                              : Icons.add_circle_outline,
                          color: widget.labelColor,
                        ),
                      )),
                ),
                Expanded(
                    child: InkWell(
                  onTap: () => onSelectOrganisationUnit(
                      context, widget.organisationUnit),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                      child: Text(widget.organisationUnit.name)),
                )),
              ],
            ),
          ),
          Visibility(
              visible: hasChildren && isExpanded,
              child: Container(
                child: OrganisationUnitTreeList(
                    labelColor: widget.labelColor,
                    organisationUnitIds: widget.organisationUnit.children),
              ))
        ],
      ),
    );
  }
}
