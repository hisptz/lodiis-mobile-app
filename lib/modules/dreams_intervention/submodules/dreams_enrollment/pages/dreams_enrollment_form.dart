import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class DreamsEnrollmentForm extends StatelessWidget {
  const DreamsEnrollmentForm({Key key}) : super(key: key);

  final String label = 'Enrollement';

  @override
  Widget build(BuildContext context) {
    List<InputFieldOption> options = [
      // InputFieldOption(code: 'one', name: 'One'),
      // InputFieldOption(code: 'two', name: 'Two'),
      // InputFieldOption(code: 'three', name: 'Three'),
      // InputFieldOption(code: 'four', name: 'Four'),
      // InputFieldOption(code: 'five', name: 'Five')
    ];
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
                  child: MaterialCard(
                    body: InputFieldContainer(
                      inputField: InputField(
                          id: 'id',
                          name: 'Label one',
                          color: Colors.amberAccent,
                          description: 'hint for the input field',
                          valueType: 'BOOLEAN',
                          hasSubInputField: false,
                          options: options),
                    ),
                  )),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
