import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_caseplan_followup.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_house_hold_caseplan_followup.dart';

class CasePlanFollowUpFormContainer extends StatefulWidget {
  const CasePlanFollowUpFormContainer({
    Key key,
    @required this.dataObject,
    @required this.isCasePlanForHouseHold,
    @required this.domainId,
    @required this.isEditableMode,
  }) : super(key: key);

  final Map dataObject;
  final bool isCasePlanForHouseHold;
  final String domainId;
  final bool isEditableMode;

  @override
  _CasePlanFollowUpFormContainerState createState() =>
      _CasePlanFollowUpFormContainerState();
}

class _CasePlanFollowUpFormContainerState
    extends State<CasePlanFollowUpFormContainer> {
  bool isFormReady = false;
  List<FormSection> formSections;
  Map mandatoryFieldObject;
  Color formSectionColor;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        mandatoryFieldObject = Map();
        formSections = widget.isCasePlanForHouseHold
            ? OvcServicesHouseHoldCasePlanFollowup.getFormSections()
            : OvcServicesChildCasePlanFollowup.getFormSections();
        formSections = formSections
            .where((formSection) => formSection.id == widget.domainId)
            .toList();
        formSectionColor = formSections.length > 0
            ? formSections[0].borderColor
            : Colors.transparent;
        formSections = formSections.map((formSection) {
          formSection.borderColor = Colors.transparent;
          return formSection;
        }).toList();
        isFormReady = true;
      });
    });
  }

  void onSaveGapForm(BuildContext context) {}

  void onInputValueChange(String id, dynamic value) {
    setState(() {
      widget.dataObject[id] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !isFormReady
          ? Container(
              child: CircularProcessLoader(
                color: Colors.blueGrey,
              ),
            )
          : Container(
              child: Column(
                children: [
                  EntryFormContainer(
                    elevation: 0.0,
                    formSections: formSections,
                    mandatoryFieldObject: mandatoryFieldObject,
                    dataObject: widget.dataObject,
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
                              color: formSectionColor,
                              onPressed: () => onSaveGapForm(context),
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 22.0),
                                  child: Text(
                                    'ADD GAP',
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
            ),
    );
  }
}
