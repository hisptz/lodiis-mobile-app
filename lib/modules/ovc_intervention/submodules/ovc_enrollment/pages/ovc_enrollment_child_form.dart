import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/add_child_confirmation.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_house_hold_form.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentChildForm extends StatefulWidget {
  const OvcEnrollmentChildForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentChildFormState createState() => _OvcEnrollmentChildFormState();
}

class _OvcEnrollmentChildFormState extends State<OvcEnrollmentChildForm> {
  final List<FormSection> formSections = OvcEnrollmentChild.getFormSections();
  final String label = 'Child form';
  final List<Map> childMapObjects = [];
  bool isLoading = true;
  Map childMapObject;
  final List<String> mandatoryFields = OvcEnrollmentChild.getMandatoryField();
  final Map mandatoryFieldObject = Map();

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
    });
    resetMapObject(childMapObject);
  }

  void resetMapObject(Map map) {
    setState(() {
      if (map != null) {
        childMapObjects.add(map);
      }
      childMapObject = Map();
      isLoading = false;
    });
  }

  void onSaveAndContinue(BuildContext context) async {
    String name = childMapObject['s1eRvsL2Ly4'] ?? '';
    Widget modal = AddChildConfirmation(name: name);
    bool response = await AppUtil.showPopUpModal(context, modal);
    if (response != null) {
      if (response) {
        setState(() {
          isLoading = true;
        });
        Timer(
            Duration(milliseconds: 500), () => resetMapObject(childMapObject));
      } else {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState('children', childMapObjects);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OvcEnrollmentHouseHoldForm(),
            ));
      }
    }
  }

  void onInputValueChange(String id, dynamic value) {
    childMapObject[id] = value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: Consumer<IntervetionCardState>(
                builder: (context, intervetionCardState, child) {
                  InterventionCard activeInterventionProgram =
                      intervetionCardState.currentIntervetionProgram;
                  return SubPageAppBar(
                    label: label,
                    activeInterventionProgram: activeInterventionProgram,
                  );
                },
              ),
            ),
            body: SubPageBody(
              body: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
                  child: isLoading
                      ? Column(
                          children: [
                            Center(
                              child: CircularProcessLoader(
                                color: Colors.blueGrey,
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              child: EntryFormContainer(
                                formSections: formSections,
                                mandatoryFieldObject: mandatoryFieldObject,
                                dataObject: childMapObject,
                                onInputValueChange: onInputValueChange,
                              ),
                            ),
                            OvcEnrollmentFormSaveButton(
                              label: 'Save and Continue',
                              labelColor: Colors.white,
                              buttonColor: Color(0xFF4B9F46),
                              fontSize: 15.0,
                              onPressButton: () => onSaveAndContinue(context),
                            )
                          ],
                        )),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
