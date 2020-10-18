import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/pages/agyw_dreams_index_contact.dart';
import 'package:provider/provider.dart';

class DreamsHTSIndexCardBottonContent extends StatefulWidget {
  const DreamsHTSIndexCardBottonContent({
    Key key,
    @required this.eventData,
    // @required this.canAddChild,
    // @required this.canViewChildInfo,
    // @required this.canViewChildService,
    // @required this.canViewChildReferral,
    // @required this.canViewChildExit,
    // @required this.canEditChildInfo,
  }) : super(key: key);

  final Events eventData;

  @override
  _DreamsHTSIndexCardBottonContentState createState() => _DreamsHTSIndexCardBottonContentState();
}

class _DreamsHTSIndexCardBottonContentState extends State<DreamsHTSIndexCardBottonContent> {
   
   @override
   void initState() {
    super.initState();
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(
            Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
                .currentAgywDream
                .id);
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

  void onEditChildInfo(BuildContext context, OvcHouseHoldChild child) {
    // setOvcHouseHoldCurrentSelection(context, child);
    // updateEnrollmentFormStateData(context, child, true);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => OvcEnrollmentChildEditViewForm(),
    //     ));
  }

  void onViewChildInfo(BuildContext context, OvcHouseHoldChild child) {
    // setOvcHouseHoldCurrentSelection(context, child);
    // updateEnrollmentFormStateData(context, child, false);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => OvcEnrollmentChildEditViewForm(),
    //     ));
  }

  void onAddNewIndex(
    BuildContext context,
    AgywDream agywDream,
  ) {
  //   setOvcHouseHoldCurrentSelection(context, null);
  //   Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
  //   Provider.of<EnrollmentFormState>(context, listen: false)
  //       .setFormFieldState('parentTrackedEntityInstance', ovcHouseHold.id);
  //   Provider.of<EnrollmentFormState>(context, listen: false)
  //       .setFormFieldState('orgUnit', ovcHouseHold.orgUnit);
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => OvcEnrollmentChildEditViewForm(),
  //       ));
   updateFormState(context, true, null);
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamsIndexContact()));
  }

  @override
  Widget build(BuildContext context) {
    AgywDream agywDream;
        return Container(
          child: Column(
            children: [
              LineSeperator(
                color: Color(0xFFECF5EC),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child:
                            SvgPicture.asset(
                              'assets/icons/children_ovc_icon.svg',
                              color: Color(0xFF258DCC),)
                            ),
                    Expanded(
                      child: Container(
                        child: Text('Index List',
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
              //   child: Column(
              //     children: 
              //     ovcHouseHold.children.map((OvcHouseHoldChild child) {
              //       int index = ovcHouseHold.children.indexOf(child) + 1;
              //       return Row(
              //         children: [
              //           Expanded(
              //             child: Container(
              //               child: Text(
              //                 '$index. ${child.toString()}',
              //                 style: TextStyle().copyWith(
              //                     fontSize: 14.0,
              //                     color: Color(0xFF536852),
              //                     fontWeight: FontWeight.w500),
              //               ),
              //             ),
              //           ),
              //           Row(mainAxisSize: MainAxisSize.min, children: [
              //             Visibility(
              //               visible: canViewChildService ||
              //                   canViewChildInfo ||
              //                   canViewChildExit,
              //               child: Container(
              //                   child: InkWell(
              //                       onTap: () => canViewChildExit
              //                           ? onViewChildExit(context, child)
              //                           : canViewChildInfo
              //                               ? onViewChildInfo(context, child)
              //                               : canViewChildService
              //                                   ? onViewChildService(context, child)
              //                                   : null,
              //                       child: Container(
              //                         padding: EdgeInsets.all(10.0),
              //                         child: Text(
              //                           'VIEW',
              //                           style: TextStyle().copyWith(
              //                             fontSize: 12.0,
              //                             color: Color(0xFF258DCC),
              //                             fontWeight: FontWeight.w500,
              //                           ),
              //                         ),
              //                       ))),
              //             ),
              //             Visibility(
              //               visible: canViewChildReferral,
              //               child: Container(
              //                   margin: EdgeInsets.only(left: 10.0),
              //                   child: InkWell(
              //                       onTap: () =>
              //                           onViewChildReferral(context, child),
              //                       child: Container(
              //                         padding: EdgeInsets.all(10.0),
              //                         child: Text(
              //                           'REFERRAL',
              //                           style: TextStyle().copyWith(
              //                             fontSize: 12.0,
              //                             color: Color(0xFF258DCC),
              //                             fontWeight: FontWeight.w500,
              //                           ),
              //                         ),
              //                       ))),
              //             ),
              //             Visibility(
              //               visible: canEditChildInfo,
              //               child: Container(
              //                   margin: EdgeInsets.only(left: 10.0),
              //                   child: InkWell(
              //                       onTap: () => onEditChildInfo(context, child),
              //                       child: Container(
              //                         padding: EdgeInsets.all(10.0),
              //                         child: Text(
              //                           'EDIT',
              //                           style: TextStyle().copyWith(
              //                             fontSize: 12.0,
              //                             color: Color(0xFF258DCC),
              //                             fontWeight: FontWeight.w500,
              //                           ),
              //                         ),
              //                       ))),
              //             )
              //           ])
              //         ],
              //       );
              //     }).toList(),
              //   ),
               ),
              Visibility(
                 // visible: canAddChild,
                  child: Container(
                    child: LineSeperator(
                      color: Color(0xFFECF5EC),
                    ),
                  )),
              Visibility(
                  //visible: canAddChild,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: InkWell(
                        onTap: () => onAddNewIndex(context,agywDream),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'ADD INDEX',
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
