import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/core/components/organisation_unit_tree_list.dart';
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

  @override
  void initState() {
    super.initState();
    // Todo set initial value
    getUserOrganisationunits();
  }

  void getUserOrganisationunits() async {
    CurrentUser user = await UserService().getCurrentUser();
    setState(() {
      userOrganisationUnits = user.userOrgUnitIds;
      isLoading = false;
    });
  }

  void setOrganisationunit(String value) {
    setState(() {
      organisationUnitController = TextEditingController(text: value);
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
        ),
      ),
    );
    OrganisationUnit organisationUnit =
        await AppUtil.showPopUpModal(context, modal);
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
                      onTap: () => openOrganisationUnit(context),
                      readOnly: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorText: null,
                      ))),
          InputCheckedIcon(
            showTickedIcon: false,
            color: widget.inputField.background,
          )
        ],
      ),
    );
  }
}
