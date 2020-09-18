import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_house_hold.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentHouseHoldForm extends StatefulWidget {
  const OvcEnrollmentHouseHoldForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentHouseHoldFormState createState() =>
      _OvcEnrollmentHouseHoldFormState();
}

class _OvcEnrollmentHouseHoldFormState
    extends State<OvcEnrollmentHouseHoldForm> {
  final List<FormSection> formSections =
      OvcEnrollmentHouseHold.getFormSections();
  final String label = 'House Hold form';

  void onInputValueChange(String id, dynamic value) {
    print('id : $id :: value : $value');
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
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
                child: MaterialCard(
                    body: EntryFormContainer(
                  formSections: formSections,
                  onInputValueChange: onInputValueChange,
                )),
              ),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
