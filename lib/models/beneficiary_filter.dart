import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/input_fields/select_input_field.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'dart:convert';

import 'package:kb_mobile_app/core/constants/default_implementing_partner_config.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class BeneficiaryFilter {
  String id;
  String name;
  List<String>? interventions;
  Widget filterInput;

  BeneficiaryFilter({
    required this.id,
    required this.name,
    this.interventions = const [],
    required this.filterInput,
  });

  static List<String> getImplementingPartners() {
    String defaultImplementingPartnerConfig =
        DefaultImplementingPartnerConfig.getDefaultConfig();

    Map implementingPartners = json.decode(defaultImplementingPartnerConfig);
    return implementingPartners.keys.toList() as List<String>;
  }

  static Widget getImplementingPartnerFilterInput() {
    List<String> implementingPartners = getImplementingPartners();
    InputField syncActionInput = InputField(
        id: 'ip',
        name: 'Select Implementing partner',
        valueType: 'TEXT',
        options: implementingPartners
            .map((ip) => InputFieldOption(code: ip, name: ip))
            .toList());

    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      return Consumer<InterventionCardState>(
        builder: (context, interventionCardState, child) {
          InterventionCard currentInterventionProgram =
              interventionCardState.currentInterventionProgram;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: syncActionInput.name,
                        style: TextStyle(
                          color: syncActionInput.labelColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.normal,
                        ))),
                Container(
                  child: SelectInputField(
                    hiddenInputFieldOptions: Map(),
                    selectedOption: '',
                    isReadOnly: false,
                    currentLanguage: languageTranslationState.currentLanguage,
                    color: currentInterventionProgram.primaryColor,
                    renderAsRadio: syncActionInput.renderAsRadio,
                    onInputValueChange: (dynamic value) => {
                      // TODO: Implement saving of filter
                    },
                    options: syncActionInput.options,
                  ),
                ),
                LineSeparator(
                    color: currentInterventionProgram.primaryColor!
                        .withOpacity(0.1)),
              ]);
        },
      );
    });
  }

  static List<BeneficiaryFilter> getBeneficiaryFilters() {
    return [
      BeneficiaryFilter(
          id: 'ip',
          name: 'Implementing Partner',
          interventions: ['dreams', 'ovc', 'ogac', 'education', 'pp_prev'],
          filterInput: getImplementingPartnerFilterInput()),
      BeneficiaryFilter(
          id: 'sex',
          name: 'Sex',
          interventions: ['ogac', 'education', 'pp_prev'],
          filterInput: Container(
            child: Text('Sex Filter Here!'),
          )),
      BeneficiaryFilter(
          id: 'age',
          name: 'Age',
          interventions: ['ogac', 'education', 'pp_prev'],
          filterInput: Container(
            child: Text('Age Filter Here!'),
          )),
      BeneficiaryFilter(
          id: 'grade',
          name: 'Grade',
          interventions: [
            'education',
          ],
          filterInput: Container(
            child: Text('Grade Filter Here!'),
          )),
      BeneficiaryFilter(
          id: 'school',
          name: 'School',
          interventions: ['education'],
          filterInput: Container(
            child: Text('School Filter Here!'),
          )),
    ];
  }
}
