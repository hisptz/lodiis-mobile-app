import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_gap_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_gap_view_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';

class CasePlanFormContainer extends StatelessWidget {
  CasePlanFormContainer({
    Key key,
    @required this.formSectionColor,
    @required this.formSection,
    @required this.isEditableMode,
    @required this.dataObject,
    this.onInputValueChange,
  }) : super(key: key);

  final Color formSectionColor;
  final FormSection formSection;
  final bool isEditableMode;
  final Map dataObject;
  final Function onInputValueChange;

  final String caseToGapLinkage = OvcCasePlanConstant.casePlanToGapLinkage;

  void onAddNewGap(BuildContext context) async {
    Map gapDataObject = Map();
    gapDataObject[caseToGapLinkage] =
        dataObject[caseToGapLinkage] ?? AppUtil.getUid();
    List<FormSection> formSections = OvcServicesCasePlanGaps.getFormSections()
        .where((FormSection form) => form.id == formSection.id)
        .toList();
    formSections = formSections.map((FormSection form) {
      form.borderColor = Colors.transparent;
      return form;
    }).toList();
    Widget modal = CasePlanGapFormContainer(
      formSections: formSections,
      isEditableMode: isEditableMode,
      formSectionColor: formSectionColor,
      dataObject: gapDataObject,
    );
    Map response = await AppUtil.showPopUpModal(context, modal, true);
    if (response != null) {
      dataObject['gaps'].add(response);
      onValueChange('gaps', dataObject['gaps']);
    }
  }

  void onValueChange(String id, dynamic value) {
    dataObject[id] = value;
    onInputValueChange(dataObject);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          topLeft: Radius.circular(12.0),
        ),
        child: MaterialCard(
          body: Container(
            padding: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(
                color: formSectionColor,
                width: 8.0,
              ),
            )),
            child: Column(
              children: [
                EntryFormContainer(
                  elevation: 0.0,
                  formSections: [formSection],
                  mandatoryFieldObject: Map(),
                  dataObject: dataObject,
                  isEditableMode: isEditableMode,
                  onInputValueChange: onValueChange,
                ),
                CasePlanGapViewContainer(
                  casePlanGaps: dataObject['gaps'],
                  domainId: formSection.id,
                  formSectionColor: formSectionColor,
                ),
                Visibility(
                  visible: isEditableMode,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: FlatButton(
                        onPressed: () => onAddNewGap(context),
                        color: formSectionColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: formSectionColor),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 40.0,
                          ),
                          child: Text('Add Gap',
                              style: TextStyle().copyWith(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              )),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
