import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OrganisationUnitInputFieldContainer extends StatefulWidget {
  const OrganisationUnitInputFieldContainer(
      {Key key, @required this.inputField, @required this.onInputValueChange})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;

  @override
  _OrganisationUnitInputFieldContainerState createState() =>
      _OrganisationUnitInputFieldContainerState();
}

class _OrganisationUnitInputFieldContainerState
    extends State<OrganisationUnitInputFieldContainer> {
  TextEditingController organisationUnitController;

  @override
  void initState() {
    super.initState();
  }

  void setOrganisationunit() {}

  void openOrganisationUnit(BuildContext context) {
    Widget modal = Container(
      child: Text('Hello'),
    );
    var response = AppUtil.showPopUpModal(context, modal);
    if (response != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  controller: organisationUnitController,
                  style:
                      TextStyle().copyWith(color: widget.inputField.labelColor),
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
