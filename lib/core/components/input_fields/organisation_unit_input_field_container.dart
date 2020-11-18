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
  const OrganisationUnitInputFieldContainer(
      {Key key,
      @required this.inputField,
      @required this.onInputValueChange,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String inputValue;

  @override
  _OrganisationUnitInputFieldContainerState createState() =>
      _OrganisationUnitInputFieldContainerState();
}

class _OrganisationUnitInputFieldContainerState
    extends State<OrganisationUnitInputFieldContainer> {
  TextEditingController organisationUnitController;
  List userOrganisationUnits = [];
  bool isLoading = true;
  String _value;

  @override
  void initState() {
    super.initState();
    getUserOrganisationunits();
  }

  void getUserOrganisationunits() async {
    CurrentUser user = await UserService().getCurrentUser();
    setState(() {
      userOrganisationUnits = user.userOrgUnitIds;
    });
    Timer(
      Duration(seconds: 1),
      () {
        discoveringSelectedOrganisationUnit();
      },
    );
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
    setState(() {
      organisationUnitController = TextEditingController(text: value);
      _value = value;
      isLoading = false;
    });
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
            organisationUnitIds: userOrganisationUnits,
            labelColor: widget.inputField.labelColor,
            allowedSelectedLevels: widget.inputField.allowedSelectedLevels),
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
                      style: TextStyle()
                          .copyWith(color: widget.inputField.labelColor),
                      onTap: () => widget.inputField.isReadOnly
                          ? null
                          : openOrganisationUnit(context),
                      readOnly: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorText: null,
                      ))),
          InputCheckedIcon(
            showTickedIcon: _value != null,
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}
