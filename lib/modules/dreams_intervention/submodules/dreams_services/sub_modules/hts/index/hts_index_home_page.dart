import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_card_bottom_content.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dreams_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dreams_index_positive_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/models/index_contact_model.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/pages/agyw_dreams_index_information_about_pos_client.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_card_body.dart';

class HTSIndexHomePage extends StatefulWidget {
  HTSIndexHomePage({
    Key key,
    @required this.htsIndexLinkage,
    this.people,
  }) : super(key: key);

  final String htsIndexLinkage;
  final IndexContactModel people;

  @override
  _HTSIndexHomePageState createState() => _HTSIndexHomePageState();
}

class _HTSIndexHomePageState extends State<HTSIndexHomePage> {
  final String label = 'Index';
  final bool canExpand = true;
  final bool canEdit = true;
  final bool canView = true;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
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
    Events eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map datavalue in eventData.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
  }

  void onAddIndexInfo(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
        AgywDreamsHTSConstant.htsToIndexLinkage, widget.htsIndexLinkage);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsIndexInfoAboutPosClient()));
  }

  List<String> programStageids = [
    AgywDreamsIndexPositiveConstant.programStage,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Consumer<DreamBenefeciarySelectionState>(
          builder: (context, dreamBenefeciarySelectionState, child) {
            return Consumer<ServiveEventDataState>(
              builder: (context, serviceFormState, child) {
                AgywDream agywDream =
                    dreamBenefeciarySelectionState.currentAgywDream;
                Map<String, List<Events>> eventListByProgramStage =
                    serviceFormState.eventListByProgramStage;
                List<Events> events = TrackedEntityInstanceUtil
                    .getAllEventListFromServiceDataState(
                        eventListByProgramStage, programStageids);
                List<AgywDreamsIndexInfoEvent> indexEvents = events
                    .map((Events eventData) =>
                        AgywDreamsIndexInfoEvent().fromTeiModel(eventData))
                    .toList()
                    .where((element) =>
                        element.htsIndexLinkage == widget.htsIndexLinkage)
                    .toList();
                AgywDreamsIndexInfoEvent indexEvent =
                    indexEvents.length > 0 ? indexEvents[0] : null;

                return Container(
                    child: Column(children: [
                  Container(
                      child: DreamsHTSIndexCard(
                          event: indexEvent,
                          canExpand: canExpand &&
                              indexEvent != null &&
                              indexEvent.consent == 'true',
                          canEdit: canEdit,
                          canView: canView,
                          isExpanded: indexEvent != null &&
                              indexEvent.id == toggleCardId,
                          onCardToogle: indexEvent == null
                              ? null
                              : () {
                                  onCardToogle(indexEvent.id);
                                },
                          cardBody: DreamsHTSIndexCardBody(event: indexEvent),
                          cardBottonActions: Visibility(
                            visible: indexEvent == null,
                            child: ClipRRect(
                              borderRadius: indexEvent != null &&
                                      indexEvent.id == toggleCardId
                                  ? BorderRadius.zero
                                  : BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                    ),
                              child: Container(
                                decoration:
                                    BoxDecoration(color: Color(0XFFF1FAFF)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: FlatButton(
                                          onPressed: () => onAddIndexInfo(
                                              context, agywDream),
                                          child: Text(
                                            'REGISTER INDEX',
                                            style: TextStyle().copyWith(
                                              fontSize: 12.0,
                                              color: Color(0xFF258DCC),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          cardBottonContent: DreamsHTSIndexCardBottonContent(
                              event: indexEvent)))
                ]));
              },
            );
          },
        ),
      ),
    );
  }
}
