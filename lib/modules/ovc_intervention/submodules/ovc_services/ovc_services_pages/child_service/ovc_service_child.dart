import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_service/constants/ovc_service_child_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_service/pages/ovc_service_child_form.dart';
import 'package:provider/provider.dart';

class OvcServiceSubPageChildView extends StatefulWidget {
  @override
  _OvcServiceSubPageChildViewState createState() =>
      _OvcServiceSubPageChildViewState();
}

class _OvcServiceSubPageChildViewState
    extends State<OvcServiceSubPageChildView> {
  final String label = 'Child Services';
  final double iconHeight = 20;

  updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(
      isEditableMode: isEditableMode,
    );
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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcServiceChildForm()));
  }

  void onAddNewService(BuildContext context) {
    updateFormState(context, true, null);
  }

  void onViewService(BuildContext context, Events eventData) {
    updateFormState(context, false, eventData);
  }

  void onEditService(BuildContext context, Events eventData) {
    updateFormState(context, true, eventData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(children: [
              OvcChildInfoTopHeader(),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Consumer<ServiveEventDataState>(
                  builder: (context, serviveEventDataState, child) {
                    bool isLoading = serviveEventDataState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviveEventDataState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataState(
                            eventListByProgramStage,
                            [OvcServiceChildConstant.programStage]);
                    int serviceIndex = events.length;
                    return isLoading
                        ? CircularProcessLoader(
                            color: Colors.blueGrey,
                          )
                        : Container(
                            child: Column(
                              children: [
                                Visibility(
                                  visible: events.length == 0,
                                  child: Container(
                                    child: Text(
                                        'There is no service provision at moment'),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: events.map((Events eventData) {
                                      int currentIndex = serviceIndex--;
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 17.0,
                                        ),
                                        child: MaterialCard(
                                          body: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      child: Expanded(
                                                        child: RichText(
                                                          text: TextSpan(
                                                            text:
                                                                '${eventData.eventDate}   ',
                                                            style: TextStyle()
                                                                .copyWith(
                                                              color: Color(
                                                                  0xFF92A791),
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Service Provision $currentIndex',
                                                                style: TextStyle()
                                                                    .copyWith(
                                                                  color: Color(
                                                                      0xFF1A3518),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 5.0,
                                                      ),
                                                      child: InkWell(
                                                          onTap: () =>
                                                              onViewService(
                                                                context,
                                                                eventData,
                                                              ),
                                                          child: Container(
                                                            height: iconHeight,
                                                            width: iconHeight,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        5),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/icons/expand_icon.svg',
                                                              color: Color(
                                                                  0xFF4B9F46),
                                                            ),
                                                          )),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 5.0,
                                                      ),
                                                      child: InkWell(
                                                          onTap: () =>
                                                              onEditService(
                                                                context,
                                                                eventData,
                                                              ),
                                                          child: Container(
                                                            height: iconHeight,
                                                            width: iconHeight,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        5),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/icons/edit-icon.svg',
                                                              color: Color(
                                                                  0xFF4B9F46),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList()
                                      ..add(Container(
                                        child: OvcEnrollmentFormSaveButton(
                                          label: 'NEW SERVICE PROVISION',
                                          labelColor: Colors.white,
                                          fontSize: 10,
                                          buttonColor: Color(0xFF4B9F46),
                                          onPressButton: () => onAddNewService(
                                            context,
                                          ),
                                        ),
                                      )),
                                  ),
                                )
                              ],
                            ),
                          );
                  },
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
