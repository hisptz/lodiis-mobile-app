import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/online_beneficiary_search_result_card.dart';
import 'package:kb_mobile_app/core/constants/intervention_program_mapper.dart';
import 'package:kb_mobile_app/core/services/tracked_entity_instance_service.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/online_beneficiary_search_input.dart';
import 'package:kb_mobile_app/models/online_beneficiary_search_result.dart';
import 'package:provider/provider.dart';

class OnlineBeneficiarySearch extends StatefulWidget {
  const OnlineBeneficiarySearch({Key? key}) : super(key: key);

  @override
  _OnlineBeneficiarySearchState createState() =>
      _OnlineBeneficiarySearchState();
}

class _OnlineBeneficiarySearchState extends State<OnlineBeneficiarySearch> {
  Map<String, String> onlineSearchDataObject = Map();
  List<OnlineBeneficiarySearchResult> searchResults = [];
  String searchResultMessage = '';
  bool isSearching = false;
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

  bool isItemSearched(OnlineBeneficiarySearchInput input) {
    var inputId = input.inputField.id;
    var value = onlineSearchDataObject[inputId];
    return value != null && value.isNotEmpty;
  }

  void searchInputChange(String id, String? value) {
    setState(() {
      onlineSearchDataObject[id] = value ?? '';
    });
  }

  void updateSearchState() {
    if (mounted) {
      setState(() {
        isSearching = !isSearching;
      });
    }
  }

  void updateSearchResultMessage(String message) {
    if (mounted) {
      setState(() {
        searchResultMessage = message;
      });
    }
  }

  void updateSearchResults(
      {List<OnlineBeneficiarySearchResult> results = const []}) {
    if (mounted) {
      setState(() {
        searchResults = results;
      });
      updateSearchState();
      if (results.isEmpty) {
        updateSearchResultMessage('No results found');
      } else {
        updateSearchResultMessage('');
      }
    }
  }

  Widget makeFilterDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  String getApiFilterString() {
    // remove empty values
    onlineSearchDataObject.removeWhere((String key, String value) {
      return value.isEmpty;
    });

    List<String> apiFilters = [];
    onlineSearchDataObject.forEach((key, value) {
      apiFilters.add('$key:like:$value');
    });

    return apiFilters.join('&filter=');
  }

  Future<void> onBeneficiarySearch(BuildContext context, String program) async {
    FocusScope.of(context).requestFocus(FocusNode());
    List<OnlineBeneficiarySearchResult> searchedTeis = [];
    updateSearchResults();
    updateSearchResultMessage('');

    String searchFilterUrl = getApiFilterString();

    try {
      List<String> searchablePrograms =
          getSearchableProgramsByUserAccess(context, program);
      if (searchablePrograms.isEmpty) {
        updateSearchResultMessage(
            'You do not have searching access to this intervention');
        return;
      }

      List<dynamic> results = await TrackedEntityInstanceService()
          .discoveringBeneficiaryByFilters(searchablePrograms, searchFilterUrl);
      searchedTeis = results
          .map((result) => OnlineBeneficiarySearchResult().fromJson(result))
          .toList();
    } catch (error) {
      // TODO handle error
    }
    updateSearchResults(results: searchedTeis);
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
            minChildSize: 0.25,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Consumer<LanguageTranslationState>(
                  builder: (context, languageTranslationState, child) {
                return Consumer<InterventionCardState>(
                    builder: (context, interventionCardState, child) {
                  String program =
                      interventionCardState.currentInterventionProgram.id!;
                  var primaryColor = interventionCardState
                      .currentInterventionProgram.primaryColor;
                  var lineColor = interventionCardState
                      .currentInterventionProgram.countLabelColor;
                  var backgroundColor = interventionCardState
                      .currentInterventionProgram.background;
                  return Container(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: Color.alphaBlend(
                            backgroundColor ?? Colors.white, Colors.white)),
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
                                child: isSearching
                                    ? Text('Searching...')
                                    : InkWell(
                                        onTap: () => {
                                          onBeneficiarySearch(context, program)
                                        },
                                        child: Text(
                                          'Search',
                                          style: TextStyle(color: primaryColor),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                        LineSeparator(color: lineColor!),
                        Flexible(
                            child: ListView(
                                controller: scrollController,
                                children: [
                              ...searchInputs
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
                                          left: 16.0,
                                          right: 16.0,
                                        ),
                                        title: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              input.label,
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: isItemSearched(input)
                                                      ? primaryColor
                                                      : null,
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
                                              dataObject:
                                                  onlineSearchDataObject,
                                              onInputValueChange: (String id,
                                                      dynamic value) =>
                                                  searchInputChange(id, value))
                                        ],
                                        iconColor: primaryColor,
                                        textColor: primaryColor,
                                      ),
                                    ));
                              }).toList(),
                              Visibility(
                                  visible: searchResults.isNotEmpty ||
                                      searchResultMessage.isNotEmpty,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            margin:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Text(
                                              'Search Results',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0),
                                            )),
                                        LineSeparator(color: lineColor),
                                      ],
                                    ),
                                  )),
                              Visibility(
                                  child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(bottom: 15.0),
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(searchResultMessage)),
                                  visible: searchResultMessage.isNotEmpty),
                              ...searchResults.map((result) {
                                return OnlineBeneficiarySearchResultCard(
                                  searchResult: result,
                                  primaryColor: primaryColor,
                                  lineColor: lineColor,
                                );
                              }),
                            ])),
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
