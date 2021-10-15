import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_consent_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_consent_form_edit.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_register_edit.dart';
import 'package:provider/provider.dart';
import 'components/dreams_sub_hts_list_card.dart';
import 'constants/agyw_dreams_hts_constant.dart';
import 'models/dreams_hts_event.dart';
import 'pages/agyw_dreams_hts_client_information_edit.dart';
import 'pages/agyw_dreams_hts_consent_for_release_status.dart';
import 'pages/agyw_dreams_hts_consent_for_release_status_edit.dart';

class HTSSubHomePage extends StatefulWidget {
  HTSSubHomePage({
    Key? key,
    required this.eventId,
    this.htsIndexLinkage,
  }) : super(key: key);

  final String? eventId;
  final DreamsHTSEvent? htsIndexLinkage;

  @override
  _HTSSubHomePageState createState() => _HTSSubHomePageState();
}

class _HTSSubHomePageState extends State<HTSSubHomePage> {
  final String label = 'HTS';
  final bool canExpand = true;
  final bool canEdit = true;
  final bool canView = true;

  String toggleCardId = '';

  void onCardToggle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  List<String> programStageIds = [
    AgywDreamsHTSLongFormConstant.programStage,
  ];

  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    DreamsHTSEvent? eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.date);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.id);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onViewConsent(BuildContext context, DreamsHTSEvent eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsHTSConsentForm()));
  }

  void onEditConsent(BuildContext context, DreamsHTSEvent eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsHTSConsentFormEdit()));
  }

  void onViewIntake(BuildContext context, DreamsHTSEvent eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsHTSClientInformation()));
  }

  void onEditIntake(BuildContext context, DreamsHTSEvent eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsHTSClientInformationEdit()));
  }

  void onViewStatus(BuildContext context, DreamsHTSEvent eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsHTSConsentForReleaseStatus()));
  }

  void onEditStatus(BuildContext context, DreamsHTSEvent eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsHTSConsentForReleaseStatusEdit()));
  }

  void onViewRegister(BuildContext context, DreamsHTSEvent? eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsHTSRegisterForm()));
  }

  void onEditRegister(BuildContext context, DreamsHTSEvent? eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsHTSRegisterFormEdit()));
  }

  DreamsHTSEvent? getHtsRegisterEventData(
      Map<String?, List<Events>> eventListByProgramStage,
      List<DreamsHTSEvent> indexEvents) {
    List<DreamsHTSEvent> events = TrackedEntityInstanceUtil
            .getAllEventListFromServiceDataStateByProgramStages(
                eventListByProgramStage,
                [AgywDreamsHTSLongFormConstant.htsRegisterProgramStage])
        .map((Events eventData) => DreamsHTSEvent().fromTeiModel(eventData))
        .toList();
    List<DreamsHTSEvent> htsRegisterEvents = events
        .where((DreamsHTSEvent dreamsHTSEvent) =>
            indexEvents.indexWhere((DreamsHTSEvent event) =>
                event.htsToHtsRegisterLinkage ==
                dreamsHTSEvent.htsToHtsRegisterLinkage) !=
            -1)
        .toList();
    return htsRegisterEvents.isNotEmpty ? htsRegisterEvents.first : null;
  }

  bool canAccessIndexContactsInformation(
      DreamsHTSEvent? dreamsHtsRegisterEvent) {
    bool canAccessIndexContact = dreamsHtsRegisterEvent != null
        ? dreamsHtsRegisterEvent.dataValues.indexWhere((dataValue) =>
                dataValue['dataElement'] ==
                    AgywDreamsHTSLongFormConstant.hivResultStatus &&
                dataValue['value'] == 'Positive') !=
            -1
        : false;
    return canAccessIndexContact;
  }

  String getHtsRegisterHivStatus(DreamsHTSEvent? dreamsHtsRegisterEvent) {
    if (dreamsHtsRegisterEvent != null) {
      int? dataElementIndex = dreamsHtsRegisterEvent.dataValues.indexWhere(
          (dataValue) =>
              dataValue['dataElement'] ==
              AgywDreamsHTSLongFormConstant.hivResultStatus);
      return dreamsHtsRegisterEvent.dataValues
              .elementAt(dataElementIndex)['value'] ??
          '';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<InterventionCardState>(
            builder: (context, interventionCardState, child) {
              InterventionCard activeInterventionProgram =
                  interventionCardState.currentInterventionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            child: Consumer<DreamsBeneficiarySelectionState>(
              builder: (context, dreamBeneficiarySelectionState, child) {
                return Consumer<ServiceEventDataState>(
                  builder: (context, serviceEventDataState, child) {
                    AgywDream? agywDream =
                        dreamBeneficiarySelectionState.currentAgywDream;
                    bool isLoading = serviceEventDataState.isLoading;
                    Map<String?, List<Events>> eventListByProgramStage =
                        serviceEventDataState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                            .getAllEventListFromServiceDataStateByProgramStages(
                                eventListByProgramStage, programStageIds)
                        .where((Events eventData) =>
                            eventData.event == widget.eventId)
                        .toList();
                    List<DreamsHTSEvent> indexEvents = events
                        .map((Events eventData) =>
                            DreamsHTSEvent().fromTeiModel(eventData))
                        .toList();
                    DreamsHTSEvent? htsRegisterEventData =
                        getHtsRegisterEventData(
                            eventListByProgramStage, indexEvents);
                    bool canAccessIndexContacts =
                        canAccessIndexContactsInformation(htsRegisterEventData);
                    String hivResultStatus =
                        getHtsRegisterHivStatus(htsRegisterEventData);
                    return Container(
                      child: Column(
                        children: [
                          DreamsBeneficiaryTopHeader(
                            agywDream: agywDream,
                          ),
                          Container(
                            child: isLoading
                                ? CircularProcessLoader(
                                    color: Colors.blueGrey,
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: events.length == 0
                                            ? Text(
                                                'There is no details at a moment')
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: indexEvents.map(
                                                    (DreamsHTSEvent eventData) {
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                          bottom: 15.0,
                                                        ),
                                                        child: DreamsSubHTSListCard(
                                                            onEditRegister: () =>
                                                                onEditRegister(
                                                                    context, htsRegisterEventData),
                                                            onViewRegister: () =>
                                                                onViewRegister(
                                                                    context,
                                                                    htsRegisterEventData),
                                                            onEditConsent: () =>
                                                                onEditConsent(
                                                                    context, eventData),
                                                            onViewConsent: () =>
                                                                onViewConsent(
                                                                    context, eventData),
                                                            onEditIntake: () =>
                                                                onEditIntake(
                                                                    context, eventData),
                                                            onViewIntake: () =>
                                                                onViewIntake(context, eventData),
                                                            onEditStatus: () => onEditStatus(context, eventData),
                                                            onViewStatus: () => onViewStatus(context, eventData),
                                                            eventData: eventData,
                                                            canAccessIndexContact: canAccessIndexContacts,
                                                            hivResultStatus: hivResultStatus
                                                            // tbCard:HTSTBHomePage(
                                                            //   htsToTBLinkageValue:eventData.htsTBLinkage,
                                                            // )
                                                            ),
                                                      );
                                                    },
                                                  ).toList(),
                                                ),
                                              ),
                                      )
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
