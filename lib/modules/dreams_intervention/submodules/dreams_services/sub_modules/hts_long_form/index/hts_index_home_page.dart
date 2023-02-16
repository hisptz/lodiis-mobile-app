import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_card_bottom_content.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_index_positive_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_index_information_about_pos_client.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_card_body.dart';

class HTSIndexHomePage extends StatefulWidget {
  const HTSIndexHomePage({
    Key? key,
    required this.htsIndexLinkage,
    this.people,
  }) : super(key: key);

  final String? htsIndexLinkage;
  final IndexContact? people;

  @override
  State<HTSIndexHomePage> createState() => _HTSIndexHomePageState();
}

class _HTSIndexHomePageState extends State<HTSIndexHomePage> {
  final String label = 'Index';
  final bool canExpand = true;
  final bool canEdit = true;
  final bool canView = true;

  String? toggleCardId = '';

  void onCardToggle(String? cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onAddIndexInfo(BuildContext context, AgywDream? agywDream) {
    updateFormState(context, true, null);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
        AgywDreamsHTSLongFormConstant.htsToIndexLinkage,
        widget.htsIndexLinkage);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsIndexInfoAboutPosClient(),
      ),
    );
  }

  List<String> programStageIds = [
    AgywDreamsIndexPositiveConstant.programStage,
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsBeneficiarySelectionState>(
      builder: (context, dreamBeneficiarySelectionState, child) {
        return Consumer<ServiceEventDataState>(
          builder: (context, serviceEventDataState, child) {
            AgywDream? agywDream =
                dreamBeneficiarySelectionState.currentAgywDream;
            Map<String?, List<Events>> eventListByProgramStage =
                serviceEventDataState.eventListByProgramStage;
            List<Events> events = TrackedEntityInstanceUtil
                .getAllEventListFromServiceDataStateByProgramStages(
                    eventListByProgramStage, programStageIds);
            List<AgywDreamsIndexInfoEvent> indexEvents = events
                .map((Events eventData) =>
                    AgywDreamsIndexInfoEvent().fromTeiModel(eventData))
                .toList()
                .where((element) =>
                    element.htsIndexLinkage == widget.htsIndexLinkage)
                .toList();
            AgywDreamsIndexInfoEvent? indexEvent =
                indexEvents.isNotEmpty ? indexEvents[0] : null;
            return Column(
              children: [
                DreamsHTSIndexCard(
                  event: indexEvent,
                  canExpand: canExpand &&
                      indexEvent != null &&
                      indexEvent.consent == 'true',
                  canEdit: canEdit,
                  canView: canView,
                  isExpanded:
                      indexEvent != null && indexEvent.id == toggleCardId,
                  onCardToggle: indexEvent == null
                      ? null
                      : () {
                          onCardToggle(indexEvent.id);
                        },
                  cardBody: DreamsHTSIndexCardBody(event: indexEvent),
                  cardButtonActions: Visibility(
                    visible: indexEvent == null,
                    child: ClipRRect(
                      borderRadius:
                          indexEvent != null && indexEvent.id == toggleCardId
                              ? BorderRadius.zero
                              : const BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFFF1FAFF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () =>
                                    onAddIndexInfo(context, agywDream),
                                child: Text(
                                  'REGISTER INDEX',
                                  style: const TextStyle().copyWith(
                                    fontSize: 12.0,
                                    color: const Color(0xFF258DCC),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  cardButtonContent: DreamsHTSIndexCardButtonContent(
                    event: indexEvent,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
