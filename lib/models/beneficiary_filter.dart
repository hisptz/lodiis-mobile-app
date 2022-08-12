import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/beneficiary_filter_state/beneficiary_filter_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
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

  static void onUpdateFilter(BuildContext context,
      InterventionCard currentIntervention, String id, String? value) {
    String interventionId = currentIntervention.id!;
    InterventionBottomNavigation interventionBottomNavigation =
        Provider.of<InterventionBottomNavigationState>(context, listen: false)
            .getCurrentInterventionBottomNavigation(currentIntervention);
    String programId = interventionId == 'education'
        ? interventionBottomNavigation.id!
        : interventionId;
    Provider.of<BeneficiaryFilterState>(context, listen: false)
        .addOrUpdateFilter(programId, id, value);
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

  static dynamic getFilterValue(
      BuildContext context,
      InterventionCard currentIntervention,
      InterventionBottomNavigation currentBottomNavigation,
      String id) {
    String interventionId = currentIntervention.id!;
    InterventionBottomNavigation interventionBottomNavigation =
        Provider.of<InterventionBottomNavigationState>(context, listen: false)
            .getCurrentInterventionBottomNavigation(currentIntervention);

    String programId = interventionId == 'education'
        ? interventionBottomNavigation.id!
        : interventionId;
    return Provider.of<BeneficiaryFilterState>(context, listen: false)
        .getFilterValue(programId, id);
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
                Consumer<InterventionBottomNavigationState>(
                    builder: (context, bottomNavigationState, child) {
                  InterventionBottomNavigation interventionBottomNavigation =
                      bottomNavigationState
                          .getCurrentInterventionBottomNavigation(
                              currentIntervention);
                  String implementingPartner = getFilterValue(
                      context,
                      currentIntervention,
                      interventionBottomNavigation,
                      implementingPartnerInput.id);

                  return SelectInputField(
                    hiddenInputFieldOptions: const {},
                    selectedOption: implementingPartner,
                    isReadOnly: false,
                    currentLanguage: languageTranslationState.currentLanguage,
                    color: currentInterventionProgram.primaryColor,
                    renderAsRadio: implementingPartnerInput.renderAsRadio,
                    onInputValueChange: (dynamic value) => onUpdateFilter(
                        context,
                        currentInterventionProgram,
                        implementingPartnerInput.id,
                        value),
                    options: implementingPartnerInput.options,
                  );
                }),
                LineSeparator(
                    color: currentInterventionProgram.primaryColor!
                        .withOpacity(0.3)),
              ]);
        },
      );
    });
  }

  static Widget getHouseholdCategorizationInput(
      InterventionCard currentIntervention) {
    InputField householdCategorizationInput = InputField(
        id: 'householdCategorization',
        name: 'Select Household Categorization/Prioritization',
        valueType: 'TEXT',
        options: [
          InputFieldOption(
            code: 'Red: HH visited/monitored regularly',
            name: 'Red: HH visited/monitored regularly',
          ),
          InputFieldOption(
            code: 'Yellow: HH visited/monitored monthly',
            name: 'Yellow: HH visited/monitored monthly',
          ),
          InputFieldOption(
            code: 'Green: HH visited/monitored quarterly',
            name: 'Green: HH visited/monitored quarterly',
          ),
        ]);

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
                        text: householdCategorizationInput.name,
                        style: TextStyle(
                          color: householdCategorizationInput.labelColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.normal,
                        ))),
                Consumer<InterventionBottomNavigationState>(
                    builder: (context, bottomNavigationState, child) {
                  InterventionBottomNavigation interventionBottomNavigation =
                      bottomNavigationState
                          .getCurrentInterventionBottomNavigation(
                              currentIntervention);
                  String householdCategorization = getFilterValue(
                      context,
                      currentIntervention,
                      interventionBottomNavigation,
                      householdCategorizationInput.id);

                  return SelectInputField(
                    hiddenInputFieldOptions: const {},
                    selectedOption: householdCategorization,
                    isReadOnly: false,
                    currentLanguage: languageTranslationState.currentLanguage,
                    color: currentInterventionProgram.primaryColor,
                    renderAsRadio: householdCategorizationInput.renderAsRadio,
                    onInputValueChange: (dynamic value) => onUpdateFilter(
                        context,
                        currentInterventionProgram,
                        householdCategorizationInput.id,
                        value),
                    options: householdCategorizationInput.options,
                  );
                }),
                LineSeparator(
                    color: currentInterventionProgram.primaryColor!
                        .withOpacity(0.3)),
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
            id: 'grade',
            name: 'Select Grade',
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

            String grade = getFilterValue(context, currentIntervention,
                interventionBottomNavigation, gradeInput.id);

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
                  SelectInputField(
                    hiddenInputFieldOptions: const {},
                    selectedOption: grade,
                    isReadOnly: false,
                    currentLanguage: languageTranslationState.currentLanguage,
                    color: currentInterventionProgram.primaryColor,
                    renderAsRadio: gradeInput.renderAsRadio,
                    onInputValueChange: (dynamic value) => onUpdateFilter(
                        context,
                        currentInterventionProgram,
                        gradeInput.id,
                        value),
                    options: gradeInput.options,
                  ),
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
        id: 'sex',
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
          Consumer<InterventionBottomNavigationState>(
              builder: (context, bottomNavigationState, child) {
            InterventionBottomNavigation interventionBottomNavigation =
                bottomNavigationState.getCurrentInterventionBottomNavigation(
                    currentIntervention);
            String sex = getFilterValue(context, currentIntervention,
                interventionBottomNavigation, sexInput.id);
            return SelectInputField(
              hiddenInputFieldOptions: const {},
              selectedOption: sex,
              isReadOnly: false,
              currentLanguage: languageTranslationState.currentLanguage,
              color: currentInterventionProgram.primaryColor,
              renderAsRadio: sexInput.renderAsRadio,
              onInputValueChange: (dynamic value) => onUpdateFilter(
                  context, currentInterventionProgram, sexInput.id, value),
              options: sexInput.options,
            );
          }),
          LineSeparator(
              color: currentInterventionProgram.primaryColor!.withOpacity(0.3)),
        ]);
      });
    });
  }

  static Widget getSchoolFilterInput(InterventionCard currentIntervention) {
    InputField schoolInput = InputField(
      id: 'schoolName',
      name: 'School name',
      inputColor: currentIntervention.primaryColor,
      valueType: 'TEXT',
    );
    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      return Consumer<InterventionCardState>(
          builder: (context, interventionCardState, child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Consumer<InterventionBottomNavigationState>(
              builder: (context, bottomNavigationState, child) {
            InterventionBottomNavigation interventionBottomNavigation =
                bottomNavigationState.getCurrentInterventionBottomNavigation(
                    currentIntervention);
            String school = getFilterValue(context, currentIntervention,
                interventionBottomNavigation, schoolInput.id);
            Map dataObject = {schoolInput.id: school};
            return InputFieldContainer(
              currentUserCountryLevelReferences: const [],
              hiddenFields: const {},
              inputField: schoolInput,
              hiddenInputFieldOptions: const {},
              currentLanguage: languageTranslationState.currentLanguage,
              isEditableMode: true,
              showClearIcon: false,
              mandatoryFieldObject: const {},
              dataObject: dataObject,
              onInputValueChange: (String id, dynamic value) => onUpdateFilter(
                  context, currentIntervention, schoolInput.id, value),
            );
          }),
        ]);
      });
    });
  }

  static Widget getAgeFilterInput(InterventionCard currentIntervention) {
    InputField ageInput = InputField(
      id: 'age',
      name: 'Age',
      inputColor: currentIntervention.primaryColor,
      valueType: 'NUMBER',
    );
    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      return Consumer<InterventionCardState>(
          builder: (context, interventionCardState, child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Consumer<InterventionBottomNavigationState>(
              builder: (context, bottomNavigationState, child) {
            InterventionBottomNavigation interventionBottomNavigation =
                bottomNavigationState.getCurrentInterventionBottomNavigation(
                    currentIntervention);
            String age = getFilterValue(context, currentIntervention,
                interventionBottomNavigation, ageInput.id);
            Map dataObject = {ageInput.id: age};
            // ignore: avoid_unnecessary_containers
            return Container(
              child: InputFieldContainer(
                currentUserCountryLevelReferences: const [],
                hiddenFields: const {},
                inputField: ageInput,
                hiddenInputFieldOptions: const {},
                currentLanguage: languageTranslationState.currentLanguage,
                isEditableMode: true,
                showClearIcon: false,
                mandatoryFieldObject: const {},
                dataObject: dataObject,
                onInputValueChange: (String id, dynamic value) =>
                    onUpdateFilter(
                        context, currentIntervention, ageInput.id, value),
              ),
            );
          }),
        ]);
      });
    });
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
          id: 'age',
          name: 'Age',
          interventions: ['ogac', 'education', 'pp_prev', 'dreams'],
          filterInput: getAgeFilterInput(currentIntervention)),
      BeneficiaryFilter(
          id: 'sex',
          name: 'Sex',
          interventions: ['ogac', 'education', 'pp_prev', 'dreams'],
          filterInput: getSexFilterInput(currentIntervention)),
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
        filterInput: getSchoolFilterInput(currentIntervention),
      ),
      BeneficiaryFilter(
        id: 'householdCategorization',
        name: 'Household Categorization',
        interventions: ['ovc'],
        filterInput: getHouseholdCategorizationInput(currentIntervention),
      ),
    ];
  }
}
