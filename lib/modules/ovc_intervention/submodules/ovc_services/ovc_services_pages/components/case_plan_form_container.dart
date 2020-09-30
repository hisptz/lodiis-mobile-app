import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan_gaps.dart';

class CasePlanFormContainer extends StatelessWidget {
  const CasePlanFormContainer({
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

  void onAddNewGap(BuildContext contex) {
    List<FormSection> formSections = OvcServicesCasePlanGaps.getFormSections()
        .where((FormSection form) => form.id == formSection.id)
        .toList();
    print(formSections);
  }

  void onValueChange(String id, dynamic value) {
    // do appropriate action on changes on in inputs
    print(dataObject);
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
                  dataObject: Map(),
                  isEditableMode: isEditableMode,
                  onInputValueChange: onValueChange,
                ),
                Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
