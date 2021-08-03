import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_index_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_index_contact_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact_model.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_index_contact_followup_list.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_index_contact.dart';
import 'package:provider/provider.dart';

class DreamsHTSIndexCardButtonContent extends StatefulWidget {
  const DreamsHTSIndexCardButtonContent({
    Key key,
    this.event,
  }) : super(key: key);

  final AgywDreamsIndexInfoEvent event;

  @override
  _DreamsHTSIndexCardButtonContentState createState() =>
      _DreamsHTSIndexCardButtonContentState();
}

class _DreamsHTSIndexCardButtonContentState
    extends State<DreamsHTSIndexCardButtonContent> {
  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    IndexContactModel eventData,
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

  void onEditIndexContact(BuildContext context, IndexContactModel eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgywDreamsIndexContact(),
        ));
  }

  void onViewIndexContact(BuildContext context, IndexContactModel eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsIndexContact(),
      ),
    );
  }

  void onFollowUpIndexContact(
    BuildContext context,
    IndexContactModel eventData,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsIndexFollowUpList(
          indexContactEvent: eventData,
          indexInfoEvent: widget.event,
        ),
      ),
    );
  }

  void onAddNewIndexContact(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
      AgywDreamsHTSIndexConstant.indexInfoToIndexContactLinkage,
      widget.event.indexInfoToIndexContactLinkage,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsIndexContact(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AgywDream agywDream;
    return Container(
      child: Column(
        children: [
          LineSeparator(
            color: Color(0xFFECF5EC),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      'assets/icons/children_ovc_icon.svg',
                      color: Color(0xFF258DCC),
                    )),
                Expanded(
                  child: Container(
                    child: Text('Index Contact List',
                        style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0xFF536852),
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
            child: Consumer<ServiceEventDataState>(
              builder: (context, serviceEventDataState, child) {
                bool isLoading = serviceEventDataState.isLoading;
                Map<String, List<Events>> eventListByProgramStage =
                    serviceEventDataState.eventListByProgramStage;
                List<Events> events = TrackedEntityInstanceUtil
                    .getAllEventListFromServiceDataStateByProgramStages(
                        eventListByProgramStage,
                        [AgywDreamsIndexConstantConstant.programStage]);
                List<IndexContactModel> indexContactEvents = events
                    .map((Events eventData) =>
                        IndexContactModel().fromTeiModel(eventData))
                    .toList()
                    .where((element) =>
                        widget.event != null &&
                        element.indexInfoToIndexContactLinkage ==
                            widget.event.indexInfoToIndexContactLinkage)
                    .toList();
                return isLoading
                    ? Container(
                        child: CircularProcessLoader(color: Colors.blueGrey))
                    : Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 0.0),
                        child: Column(
                            children: indexContactEvents
                                .map((IndexContactModel eventData) {
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    '${eventData.name.toString()}',
                                    style: TextStyle().copyWith(
                                        fontSize: 14.0,
                                        color: Color(0xFF536852),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Row(mainAxisSize: MainAxisSize.min, children: [
                                Visibility(
                                  // visible: canViewChildService ||
                                  //     canViewChildInfo ||
                                  //     canViewChildExit,
                                  child: Container(
                                      child: InkWell(
                                          onTap: () => onViewIndexContact(
                                              context, eventData),
                                          child: Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'VIEW',
                                              style: TextStyle().copyWith(
                                                fontSize: 12.0,
                                                color: Color(0xFF258DCC),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ))),
                                ),
                                Visibility(
                                  //visible: canEditChildInfo,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10.0),
                                      child: InkWell(
                                          onTap: () => onEditIndexContact(
                                              context, eventData),
                                          child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              'EDIT',
                                              style: TextStyle().copyWith(
                                                fontSize: 12.0,
                                                color: Color(0xFF258DCC),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ))),
                                ),
                                Visibility(
                                  //visible: canFollowUpChildInfo,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10.0),
                                      child: InkWell(
                                          onTap: () => onFollowUpIndexContact(
                                              context, eventData),
                                          child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              'FOLLOWUP',
                                              style: TextStyle().copyWith(
                                                fontSize: 12.0,
                                                color: Color(0xFF258DCC),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ))),
                                )
                              ])
                            ],
                          );
                        }).toList()));
              },
            ),
          ),
          Visibility(
              child: Container(
            child: LineSeparator(
              color: Color(0xFFECF5EC),
            ),
          )),
          Visibility(
              visible: widget.event != null,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: InkWell(
                    onTap: () => onAddNewIndexContact(context, agywDream),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'ADD NEW INDEX CONTACT',
                        style: TextStyle().copyWith(
                          fontSize: 12.0,
                          color: Color(0xFF258DCC),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
