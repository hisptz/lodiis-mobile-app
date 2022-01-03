import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/constants/intervention_program_mapper.dart';
import 'package:kb_mobile_app/core/services/tracked_entity_instance_service.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/online_beneficiary_search_input.dart';
import 'package:provider/provider.dart';

class OnlineBeneficiarySearch extends StatefulWidget {
  const OnlineBeneficiarySearch({Key? key}) : super(key: key);

  @override
  _OnlineBeneficiarySearchState createState() =>
      _OnlineBeneficiarySearchState();
}

class _OnlineBeneficiarySearchState extends State<OnlineBeneficiarySearch> {
  Map<String, String> onlineSearchDataObject = Map();
  List<OnlineBeneficiarySearchInput> searchInputs = [
    OnlineBeneficiarySearchInput(
        label: 'First Name',
        inputField: InputField(id: 'WTZ7GLTrE8Q', name: '', valueType: 'TEXT')),
    OnlineBeneficiarySearchInput(
        label: 'Surname',
        inputField: InputField(id: 'rSP9c21JsfC', name: '', valueType: 'TEXT')),
    OnlineBeneficiarySearchInput(
        label: 'Date of Birth',
        inputField: InputField(id: 'qZP982qpSPS', name: '', valueType: 'DATE')),
  ];

  void searchInputChange(String id, String? value) {
    setState(() {
      onlineSearchDataObject[id] = value ?? '';
    });
  }

  Widget makeFilterDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Future<void> onBeneficiarySearch(BuildContext context, String program) async {
    // remove empty values
    onlineSearchDataObject.removeWhere((String key, String value) {
      return value.isEmpty;
    });

    // generate filter url
    List<String> apiFilters = [];
    onlineSearchDataObject.forEach((key, value) {
      apiFilters.add('$key:like:$value');
    });
    String searchFilterUrl = apiFilters.join('&filter=');

    List<String> searchablePrograms =
        getSearchableProgramsByUserAccess(context, program);
    // TODO: Add a check for unavailable searchable programs

    List<dynamic> searchedTeis = await TrackedEntityInstanceService()
        .discoveringBeneficiaryByFilters(searchablePrograms, searchFilterUrl);

    // TODO: sanitize searched teis
    print('results: $searchedTeis');
  }

  List<String> getSearchableProgramsByUserAccess(
      BuildContext context, String intervention) {
    Map<String, List<String>> programMapper =
        InterventionProgramMapper.programs;

    List<String> interventionPrograms = programMapper[intervention] ?? [];
    List userPrograms = Provider.of<CurrentUserState>(context, listen: false)
            .currentUser!
            .programs ??
        [];

    return interventionPrograms
        .where((program) => userPrograms.contains(program))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return makeFilterDismissible(
        child: DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.5,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Consumer<LanguageTranslationState>(
                  builder: (context, languageTranslationState, child) {
                return Consumer<InterventionCardState>(
                    builder: (context, interventionCardState, child) {
                  String program =
                      interventionCardState.currentInterventionProgram.id!;
                  var primaryColor = interventionCardState
                      .currentInterventionProgram.primaryColor;
                  return Container(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    'Online Beneficiary Search',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: InkWell(
                                  onTap: () =>
                                      {onBeneficiarySearch(context, program)},

                                  // TODO add loader when searching and disabled button when data object is empty
                                  child: Text(
                                    'Search',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        LineSeparator(
                            color: interventionCardState
                                .currentInterventionProgram.countLabelColor!),
                        Flexible(
                            child: ListView(
                          padding: EdgeInsets.all(8.0),
                          children: searchInputs
                              .map((OnlineBeneficiarySearchInput input) {
                            InputField inputField = input.inputField;
                            inputField.inputColor = primaryColor;
                            return Container(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    childrenPadding: EdgeInsets.only(
                                        left: 16.0, right: 16.0, bottom: 8.0),
                                    title: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          input.label,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ],
                                    ),
                                    children: [
                                      InputFieldContainer(
                                          currentUserCountryLevelReferences: [],
                                          hiddenFields: Map(),
                                          inputField: inputField,
                                          hiddenInputFieldOptions: Map(),
                                          currentLanguage:
                                              languageTranslationState
                                                  .currentLanguage,
                                          isEditableMode: true,
                                          showClearIcon: true,
                                          mandatoryFieldObject: Map(),
                                          dataObject: onlineSearchDataObject,
                                          onInputValueChange:
                                              (String id, dynamic value) =>
                                                  searchInputChange(id, value))
                                    ],
                                    iconColor: primaryColor,
                                    textColor: primaryColor,
                                  ),
                                ));
                          }).toList(),
                        )),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom))
                      ],
                    ),
                  );
                });
              });
            }));
  }
}
