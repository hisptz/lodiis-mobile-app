import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/beneficiary_filter_state/beneficiary_filter_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/input_fields/select_input_field.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'dart:convert';

import 'package:kb_mobile_app/core/constants/default_implementing_partner_config.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
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

  static void onUpdateFilter(BuildContext context, String id, String value) {
    Provider.of<BeneficiaryFilterState>(context, listen: false)
        .addOrUpdateFilter(id, value);
  }

  static List<String> getImplementingPartners(
      InterventionCard currentIntervention) {
    String defaultImplementingPartnerConfig =
        DefaultImplementingPartnerConfig.getDefaultConfig();
    Map implementingPartners = json.decode(defaultImplementingPartnerConfig);
    implementingPartners.removeWhere((key, value) {
      if (currentIntervention.id == 'dreams') {
        return false;
      } else if (currentIntervention.id == 'education') {
        return key != 'Super user';
      } else {
        return ['EGPAF', 'JHPIEGO', 'EGPAF', 'PSI'].contains(key);
      }
    });
    return implementingPartners.keys
        .toList()
        .where((implementingPartner) => implementingPartner != 'Paralegal')
        .toList() as List<String>;
  }

  static Widget getImplementingPartnerFilterInput(
      InterventionCard currentIntervention) {
    List<String> implementingPartners =
        getImplementingPartners(currentIntervention);
    InputField implementingPartnerInput = InputField(
        id: 'implementingPartner',
        name: 'Select Implementing partner',
        valueType: 'TEXT',
        options: implementingPartners
            .map((implementingPartner) => InputFieldOption(
                code: implementingPartner, name: implementingPartner))
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
                        text: implementingPartnerInput.name,
                        style: TextStyle(
                          color: implementingPartnerInput.labelColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.normal,
                        ))),
                Consumer<BeneficiaryFilterState>(
                    builder: (context, beneficiaryFilterState, child) {
                  String implementingPartner = beneficiaryFilterState
                      .getFilterValue(implementingPartnerInput.id);
                  return Container(
                    child: SelectInputField(
                      hiddenInputFieldOptions: Map(),
                      selectedOption: implementingPartner,
                      isReadOnly: false,
                      currentLanguage: languageTranslationState.currentLanguage,
                      color: currentInterventionProgram.primaryColor,
                      renderAsRadio: implementingPartnerInput.renderAsRadio,
                      onInputValueChange: (dynamic value) => onUpdateFilter(
                          context, implementingPartnerInput.id, value),
                      options: implementingPartnerInput.options,
                    ),
                  );
                }),
                LineSeparator(
                    color: currentInterventionProgram.primaryColor!
                        .withOpacity(0.1)),
              ]);
        },
      );
    });
  }

  static Widget getGradeFilterInput(InterventionCard currentIntervention) {
    return Consumer<InterventionBottomNavigationState>(
      builder: (context, interventionBottomNavigationState, child) {
        InterventionBottomNavigation interventionBottomNavigation =
            interventionBottomNavigationState
                .getCurrentInterventionBottomNavigation(currentIntervention);
        InputField gradeInput = InputField(
            id: 'Sex',
            name: 'Select sex',
            valueType: 'TEXT',
            options: interventionBottomNavigation.id == 'lbse'
                ? [
                    InputFieldOption(
                      code: "Grade 4",
                      name: "Grade 4",
                    ),
                    InputFieldOption(
                      code: "Grade 5",
                      name: "Grade 5",
                    ),
                    InputFieldOption(
                      code: "Grade 6",
                      name: "Grade 6",
                    ),
                    InputFieldOption(
                      code: "Grade 7",
                      name: "Grade 7",
                    ),
                    InputFieldOption(
                      code: "Grade 8",
                      name: "Grade 8",
                    ),
                    InputFieldOption(
                      code: "Grade 9",
                      name: "Grade 9",
                    ),
                    InputFieldOption(
                      code: "Grade 10",
                      name: "Grade 10",
                    ),
                    InputFieldOption(
                      code: "Grade 11",
                      name: "Grade 11",
                    ),
                  ]
                : interventionBottomNavigation.id == 'bursary'
                    ? [
                        InputFieldOption(
                          code: "Grade 8",
                          name: "Grade 8",
                        ),
                        InputFieldOption(
                          code: "Grade 9",
                          name: "Grade 9",
                        ),
                        InputFieldOption(
                          code: "Grade 10",
                          name: "Grade 10",
                        ),
                        InputFieldOption(
                          code: "Grade 11",
                          name: "Grade 11",
                        ),
                      ]
                    : []);
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
                          text: gradeInput.name,
                          style: TextStyle(
                            color: gradeInput.labelColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                          ))),
                  Consumer<BeneficiaryFilterState>(
                      builder: (context, beneficiaryFilterState, child) {
                    String implementingPartner =
                        beneficiaryFilterState.getFilterValue(gradeInput.id);
                    return Container(
                      child: SelectInputField(
                        hiddenInputFieldOptions: Map(),
                        selectedOption: implementingPartner,
                        isReadOnly: false,
                        currentLanguage:
                            languageTranslationState.currentLanguage,
                        color: currentInterventionProgram.primaryColor,
                        renderAsRadio: gradeInput.renderAsRadio,
                        onInputValueChange: (dynamic value) =>
                            onUpdateFilter(context, gradeInput.id, value),
                        options: gradeInput.options,
                      ),
                    );
                  }),
                  LineSeparator(
                      color: currentInterventionProgram.primaryColor!
                          .withOpacity(0.1)),
                ]);
          });
        });
      },
    );
  }

  static Widget getSexFilterInput(InterventionCard currentIntervention) {
    InputField sexInput = InputField(
        id: 'Sex',
        name: 'Select sex',
        valueType: 'TEXT',
        options: currentIntervention.id == 'dreams'
            ? [
                InputFieldOption(code: 'Male', name: 'Male'),
                InputFieldOption(code: 'Female', name: 'Female'),
                InputFieldOption(
                    code: 'Transgender (male to female)',
                    name: 'Transgender (male to female)'),
                InputFieldOption(
                    code: 'Transgender (female to male)',
                    name: 'Transgender (female to male)'),
              ]
            : [
                InputFieldOption(code: 'Male', name: 'Male'),
                InputFieldOption(code: 'Female', name: 'Female'),
              ]);

    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      return Consumer<InterventionCardState>(
          builder: (context, interventionCardState, child) {
        InterventionCard currentInterventionProgram =
            interventionCardState.currentInterventionProgram;

        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
              text: TextSpan(
                  text: sexInput.name,
                  style: TextStyle(
                    color: sexInput.labelColor,
                    fontSize: 13.0,
                    fontWeight: FontWeight.normal,
                  ))),
          Consumer<BeneficiaryFilterState>(
              builder: (context, beneficiaryFilterState, child) {
            String implementingPartner =
                beneficiaryFilterState.getFilterValue(sexInput.id);
            return Container(
              child: SelectInputField(
                hiddenInputFieldOptions: Map(),
                selectedOption: implementingPartner,
                isReadOnly: false,
                currentLanguage: languageTranslationState.currentLanguage,
                color: currentInterventionProgram.primaryColor,
                renderAsRadio: sexInput.renderAsRadio,
                onInputValueChange: (dynamic value) =>
                    onUpdateFilter(context, sexInput.id, value),
                options: sexInput.options,
              ),
            );
          }),
          LineSeparator(
              color: currentInterventionProgram.primaryColor!.withOpacity(0.1)),
        ]);
      });
    });
  }

  static List<Map<String, dynamic>> getBeneficiaryFilterByIntervention(
      BuildContext context, String interventionId) {
    List<Map<String, dynamic>> filtersFromState =
        Provider.of<BeneficiaryFilterState>(context, listen: false).filters;
    InterventionCard currentIntervention =
        Provider.of<InterventionCardState>(context, listen: false)
            .currentInterventionProgram;
    List<String> beneficiaryFilters = getBeneficiaryFilters(currentIntervention)
        .where((BeneficiaryFilter filter) =>
            filter.interventions!.isEmpty ||
            filter.interventions!.contains(interventionId))
        .toList()
        .map((filter) => filter.id)
        .toList();

    return filtersFromState
        .where((Map<String, dynamic> filter) =>
            filter.keys
                .toSet()
                .intersection(beneficiaryFilters.toSet())
                .length >
            0)
        .toList();
  }

  static List<BeneficiaryFilter> getBeneficiaryFilters(
      InterventionCard currentIntervention) {
    return [
      BeneficiaryFilter(
          id: 'implementingPartner',
          name: 'Implementing Partner',
          interventions: ['dreams', 'ovc', 'ogac', 'education', 'pp_prev'],
          filterInput: getImplementingPartnerFilterInput(currentIntervention)),
      BeneficiaryFilter(
          id: 'sex',
          name: 'Sex',
          interventions: ['ogac', 'education', 'pp_prev', 'dreams'],
          filterInput: getSexFilterInput(currentIntervention)),
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
          filterInput: getGradeFilterInput(currentIntervention)),
      BeneficiaryFilter(
          id: 'schoolName',
          name: 'School',
          interventions: ['education'],
          filterInput: Container(
            child: Text('School Filter Here!'),
          )),
    ];
  }
}
