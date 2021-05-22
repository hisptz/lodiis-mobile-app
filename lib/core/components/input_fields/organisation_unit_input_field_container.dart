import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/core/components/organisation_unit_tree_list.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class OrganisationUnitInputFieldContainer extends StatefulWidget {
  const OrganisationUnitInputFieldContainer({
    Key key,
    @required this.inputField,
    @required this.onInputValueChange,
    @required this.currentUserCountryLevelReferences,
    this.inputValue,
    this.filteredPrograms,
  }) : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final List<String> currentUserCountryLevelReferences;
  final String inputValue;
  final List<String> filteredPrograms;

  @override
  _OrganisationUnitInputFieldContainerState createState() =>
      _OrganisationUnitInputFieldContainerState();
}

class _OrganisationUnitInputFieldContainerState
    extends State<OrganisationUnitInputFieldContainer> {
  TextEditingController organisationUnitController;
  List userOrganisationUnits = [];
  bool isLoading = true;
  bool valueCleared = false;
  String _value;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => getUserOrganisationunits(),
    );
  }

  @override
  void didUpdateWidget(
      covariant OrganisationUnitInputFieldContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.inputValue != widget.inputValue) {
      if (widget.inputValue == null || widget.inputValue == '') {
        setOrganisationunit('');
      }
    }
  }

  void getUserOrganisationunits() async {
    CurrentUser user = await UserService().getCurrentUser();
    userOrganisationUnits = user.userOrgUnitIds;
    discoveringSelectedOrganisationUnit();
  }

  void discoveringSelectedOrganisationUnit() async {
    if (widget.inputField != null) {
      List<OrganisationUnit> ous = await OrganisationUnitService()
          .getOrganisationUnits([widget.inputValue]);
      String value = ous.length > 0 ? ous[0].name : null;
      setOrganisationunit(value);
    }
  }

  void setOrganisationunit(String value) {
    organisationUnitController = TextEditingController(text: value);
    _value = value;
    isLoading = false;
    try {
      setState(() {});
    } catch (e) {}
  }

  void openOrganisationUnit(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    double height = size.height * 0.6;
    Widget modal = Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration:
          BoxDecoration(color: widget.inputField.labelColor.withOpacity(0.05)),
      child: SingleChildScrollView(
        child: OrganisationUnitTreeList(
          organisationUnitIds:
              widget.currentUserCountryLevelReferences.length > 0 &&
                      widget.inputField.showCountryLevelTree
                  ? widget.currentUserCountryLevelReferences
                  : userOrganisationUnits,
          labelColor: widget.inputField.labelColor,
          allowedSelectedLevels: widget.inputField.allowedSelectedLevels,
          filteredPrograms: widget.filteredPrograms,
        ),
      ),
    );
    OrganisationUnit organisationUnit =
        await AppUtil.showPopUpModal(context, modal, false);
    if (organisationUnit != null) {
      setOrganisationunit(organisationUnit.name);
      widget.onInputValueChange(organisationUnit.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: isLoading
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: CircularProcessLoader(
                      color: widget.inputField.labelColor,
                    ),
                  )
                : TextFormField(
                    controller: organisationUnitController,
                    style: TextStyle().copyWith(
                      color: widget.inputField.inputColor,
                    ),
                    onTap: () => widget.inputField.isReadOnly
                        ? null
                        : openOrganisationUnit(context),
                    readOnly: true,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorText: null,
                    ),
                  ),
          ),
          InputCheckedIcon(
            showTickedIcon: _value != null && _value != '',
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}
