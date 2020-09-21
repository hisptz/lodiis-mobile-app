import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/organisation_popUpMenu.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/organisation_unit_recursive_util.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OrganisationUnitInputFieldContainer extends StatelessWidget {
  const OrganisationUnitInputFieldContainer(
      {Key key, @required this.inputField, @required this.onInputValueChange})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: [
            Expanded(child: Text(inputField.valueType)),
            InputCheckedIcon(
              showTickedIcon: false,
              color: inputField.background,
            )
          ],
        ),
      ),
      onTap: () async {
        var modal = OrganisationUnitPopUpMenu();
        var response = await OrganisationUtil.showPopUpModal(context, modal);

        if (response != null) {
          inputField.valueType = response.name;
        }
        (context as Element).markNeedsBuild();
      },
    );
  }
}
