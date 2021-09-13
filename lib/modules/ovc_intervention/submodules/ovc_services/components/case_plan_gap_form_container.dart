import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/skip_logics/ovc_case_plan_gap_skip_logic.dart';

class CasePlanGapFormContainer extends StatefulWidget {
  const CasePlanGapFormContainer(
      {Key? key,
      required this.formSections,
      required this.isEditableMode,
      required this.formSectionColor,
      required this.dataObject,
      required this.isCasePlanForHousehold,
      this.currentHouseholdChild})
      : super(key: key);

  final List<FormSection> formSections;
  final bool isEditableMode;
  final Color? formSectionColor;
  final Map dataObject;
  final bool isCasePlanForHousehold;
  final OvcHouseholdChild? currentHouseholdChild;

  @override
  _CasePlanGapFormContainerState createState() =>
      _CasePlanGapFormContainerState();
}

class _CasePlanGapFormContainerState extends State<CasePlanGapFormContainer>
    with OvcCasePlanGapSkipLogic {
  Map mandatoryFieldObject = Map();
  late List mandatoryFields;
  Map? dataObject;
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      mandatoryFields = ['QjlTTO5KAIf'];
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      dataObject = widget.dataObject;
    });
    evaluateSkipLogics(context, widget.formSections, dataObject!,
        currentHouseholdChild: widget.currentHouseholdChild);
    setState(() {});
  }

  onSaveGapForm(BuildContext context) {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject!);
    if (hadAllMandatoryFilled) {
      Navigator.pop(context, dataObject);
    } else {
      setState(() {
        unFilledMandatoryFields =
            AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject!);
      });
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  void onInputValueChange(String id, dynamic value) {
    setState(() {
      dataObject![id] = value;
    });
    evaluateSkipLogics(context, widget.formSections, dataObject!,
        currentHouseholdChild: widget.currentHouseholdChild);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          EntryFormContainer(
            elevation: 0.0,
            formSections: widget.formSections,
            hiddenFields: hiddenFields,
            hiddenSections: hiddenSections,
            mandatoryFieldObject: mandatoryFieldObject,
            dataObject: dataObject,
            isEditableMode: widget.isEditableMode,
            onInputValueChange: onInputValueChange,
            unFilledMandatoryFields: unFilledMandatoryFields,
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
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: widget.formSectionColor,
                      ),
                      onPressed: () => onSaveGapForm(context),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: 22.0,
                        ),
                        child: Text(
                          'ADD GAP',
                          style: TextStyle().copyWith(
                            color: Color(0xFFFAFAFA),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
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
