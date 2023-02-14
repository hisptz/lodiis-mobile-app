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
    Key? key,
    required this.inputField,
    required this.onInputValueChange,
    required this.currentUserCountryLevelReferences,
    required this.isEditableMode,
    this.inputValue,
    this.filteredPrograms,
  }) : super(key: key);

  final InputField inputField;
  final bool isEditableMode;
  final Function onInputValueChange;
  final List<String?> currentUserCountryLevelReferences;
  final String? inputValue;
  final List<String>? filteredPrograms;

  @override
  _OrganisationUnitInputFieldContainerState createState() =>
      _OrganisationUnitInputFieldContainerState();
}

class _OrganisationUnitInputFieldContainerState
    extends State<OrganisationUnitInputFieldContainer> {
  TextEditingController? organisationUnitController;
  List? userOrganisationUnits = [];
  bool isLoading = true;
  bool valueCleared = false;
  String? _value;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => getUserOrganisationUnits(),
    );
  }

  @override
  void didUpdateWidget(
      covariant OrganisationUnitInputFieldContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.inputValue != widget.inputValue) {
      if (widget.inputValue == null || widget.inputValue == '') {
        setOrganisationUnit('');
      }
    }
  }

  void getUserOrganisationUnits() async {
    CurrentUser? user = await (UserService().getCurrentUser());
    userOrganisationUnits = user!.userOrgUnitIds;
    discoveringSelectedOrganisationUnit();
  }

  void discoveringSelectedOrganisationUnit() async {
    List<OrganisationUnit> ous = await OrganisationUnitService()
        .getOrganisationUnits([widget.inputValue]);
    String? value = ous.isNotEmpty
        ? ous[0].name
        : !widget.isEditableMode
            ? widget.inputValue
            : null;
    setOrganisationUnit(value);
  }

  void setOrganisationUnit(String? value) {
    organisationUnitController = TextEditingController(text: value);
    _value = value;
    isLoading = false;
    try {
      setState(() {});
    } catch (e) {
      //
    }
  }

  void openOrganisationUnit(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    double height = size.height * 0.6;
    Widget modal = Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration:
          BoxDecoration(color: widget.inputField.labelColor!.withOpacity(0.05)),
      child: SingleChildScrollView(
        child: OrganisationUnitTreeList(
          organisationUnitIds:
              widget.currentUserCountryLevelReferences.isNotEmpty &&
                      widget.inputField.showCountryLevelTree!
                  ? widget.currentUserCountryLevelReferences
                  : userOrganisationUnits,
          labelColor: widget.inputField.labelColor,
          allowedSelectedLevels: widget.inputField.allowedSelectedLevels,
          filteredPrograms: widget.filteredPrograms,
        ),
      ),
    );
    OrganisationUnit? organisationUnit =
        await AppUtil.showPopUpModal(context, modal, false);
    if (organisationUnit != null) {
      setOrganisationUnit(organisationUnit.name);
      widget.onInputValueChange(organisationUnit.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: isLoading
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CircularProcessLoader(
                    color: widget.inputField.labelColor,
                  ),
                )
              : TextFormField(
                  controller: organisationUnitController,
                  style: const TextStyle().copyWith(
                    color: widget.inputField.inputColor,
                  ),
                  onTap: () =>
                      widget.inputField.isReadOnly! || !widget.isEditableMode
                          ? null
                          : openOrganisationUnit(context),
                  readOnly: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    errorText: null,
                  ),
                ),
        ),
        InputCheckedIcon(
          showTickedIcon:
              _value != null && _value != '' && widget.isEditableMode,
          color: widget.inputField.inputColor,
        )
      ],
    );
  }
}
