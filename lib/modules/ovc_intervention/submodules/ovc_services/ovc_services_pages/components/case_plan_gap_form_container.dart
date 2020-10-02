import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class CasePlanGapFormContainer extends StatefulWidget {
  const CasePlanGapFormContainer({
    Key key,
    @required this.formSections,
    @required this.isEditableMode,
    @required this.formSectionColor,
    @required this.dataObject,
    @required this.isCasePlanForHouseHold,
  }) : super(key: key);

  final List<FormSection> formSections;
  final bool isEditableMode;
  final Color formSectionColor;
  final Map dataObject;
  final bool isCasePlanForHouseHold;

  @override
  _CasePlanGapFormContainerState createState() =>
      _CasePlanGapFormContainerState();
}

class _CasePlanGapFormContainerState extends State<CasePlanGapFormContainer> {
  Map mandatoryFieldObject = Map();
  List mandatoryFields;
  Map dataObject;

  @override
  void initState() {
    super.initState();
    setState(() {
      mandatoryFields =
          widget.isCasePlanForHouseHold ? ['m8ujTeOcYO3'] : ['QjlTTO5KAIf'];
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      dataObject = widget.dataObject ?? Map();
    });
  }

  onSaveGapForm(BuildContext context) {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      Navigator.pop(context, dataObject);
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
    }
  }

  void onInputValueChange(String id, dynamic value) {
    setState(() {
      dataObject[id] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          EntryFormContainer(
            elevation: 0.0,
            formSections: widget.formSections,
            mandatoryFieldObject: mandatoryFieldObject,
            dataObject: dataObject,
            isEditableMode: widget.isEditableMode,
            onInputValueChange: onInputValueChange,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            child: Visibility(
              visible: widget.isEditableMode,
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      color: widget.formSectionColor,
                      onPressed: () => onSaveGapForm(context),
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 22.0),
                          child: Text(
                            'Add Gap',
                            style: TextStyle().copyWith(
                              color: Color(0xFFFAFAFA),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
