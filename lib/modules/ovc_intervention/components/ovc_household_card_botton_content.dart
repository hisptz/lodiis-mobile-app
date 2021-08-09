import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_child_edit_view_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/ovc_child_exit_home.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/ovc_child_referral_home.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/ovc_child_service_home.dart';
import 'package:provider/provider.dart';

class OvcHouseholdCardButtonContent extends StatelessWidget {
  const OvcHouseholdCardButtonContent({
    Key key,
    @required this.ovcHousehold,
    @required this.canAddChild,
    @required this.canViewChildInfo,
    @required this.canViewChildService,
    @required this.canViewChildReferral,
    @required this.canViewChildExit,
    @required this.canEditChildInfo,
    @required this.currentLanguage,
  }) : super(key: key);

  final OvcHousehold ovcHousehold;
  final String currentLanguage;
  final bool canAddChild;
  final bool canViewChildInfo;
  final bool canEditChildInfo;
  final bool canViewChildService;
  final bool canViewChildReferral;
  final bool canViewChildExit;

  void updateEnrollmentFormStateData(
    BuildContext context,
    OvcHouseholdChild child,
    bool isEditableMode,
  ) {
    TrackedEntityInstance teiData = child.teiData;
    // Set hidden fields for editing
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('parentTrackedEntityInstance', ovcHousehold.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', child.orgUnit);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollmentDate', child.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('incidentDate', child.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('trackedEntityInstance', child.id);

    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    for (Map attributeObj in teiData.attributes) {
      if (attributeObj['value'] != '' && '${attributeObj['value']}' != 'null') {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
  }

  void setOvcHouseholdCurrentSelection(
      BuildContext context, OvcHouseholdChild child) {
    Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
        .setCurrentHousehold(ovcHousehold);
    if (child != null) {
      Provider.of<ServiceEventDataState>(context, listen: false)
          .resetServiceEventDataState(child.id);
      Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
          .setCurrentHouseholdChild(child);
    }
  }

  void onEditChildInfo(BuildContext context, OvcHouseholdChild child) {
    setOvcHouseholdCurrentSelection(context, child);
    updateEnrollmentFormStateData(context, child, true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcEnrollmentChildEditViewForm(),
      ),
    );
  }

  void onViewChildInfo(BuildContext context, OvcHouseholdChild child) {
    setOvcHouseholdCurrentSelection(context, child);
    updateEnrollmentFormStateData(context, child, false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcEnrollmentChildEditViewForm(),
      ),
    );
  }

  void onAddNewChild(
    BuildContext context,
  ) {
    setOvcHouseholdCurrentSelection(context, null);
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('parentTrackedEntityInstance', ovcHousehold.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', ovcHousehold.orgUnit);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcEnrollmentChildEditViewForm(),
      ),
    );
  }

  void onViewChildService(BuildContext context, OvcHouseholdChild child) {
    setOvcHouseholdCurrentSelection(context, child);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcChildServiceHome(),
      ),
    );
  }

  void onViewChildReferral(BuildContext context, OvcHouseholdChild child) {
    setOvcHouseholdCurrentSelection(context, child);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcChildReferralHome(),
      ),
    );
  }

  void onViewChildExit(BuildContext context, OvcHouseholdChild child) {
    setOvcHouseholdCurrentSelection(context, child);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcChildExitHome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    child:
                        SvgPicture.asset('assets/icons/children_ovc_icon.svg')),
                Expanded(
                  child: Container(
                    child: Text(
                      currentLanguage == 'lesotho'
                          ? 'Lethathamo la bana'
                          : 'Children List',
                      style: TextStyle().copyWith(
                        fontSize: 14.0,
                        color: Color(0xFF536852),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 10.0,
            ),
            child: Column(
              children: ovcHousehold.children.map(
                (OvcHouseholdChild child) {
                  int index = ovcHousehold.children.indexOf(child) + 1;
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            '$index. ${child.toString()}',
                            style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: Color(0xFF536852),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: canViewChildService ||
                                canViewChildInfo ||
                                canViewChildExit,
                            child: Container(
                              child: InkWell(
                                onTap: () => canViewChildExit
                                    ? onViewChildExit(context, child)
                                    : canViewChildInfo
                                        ? onViewChildInfo(context, child)
                                        : canViewChildService
                                            ? onViewChildService(context, child)
                                            : null,
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'VIEW',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      color: Color(0xFF4B9F46),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: canViewChildReferral,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: InkWell(
                                onTap: () =>
                                    onViewChildReferral(context, child),
                                child: Container(
                                  padding: EdgeInsets.all(
                                    10.0,
                                  ),
                                  child: Text(
                                    'REFERRAL',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      color: Color(0xFF4B9F46),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: canEditChildInfo,
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: InkWell(
                                onTap: () => onEditChildInfo(context, child),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'EDIT',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      color: Color(0xFF4B9F46),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              ).toList(),
            ),
          ),
          Visibility(
              visible: canAddChild,
              child: Container(
                child: LineSeparator(
                  color: Color(0xFFECF5EC),
                ),
              )),
          Visibility(
            visible: canAddChild,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: InkWell(
                onTap: () => onAddNewChild(context),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    currentLanguage == 'lesotho'
                        ? 'Kenya ngoana e mong'.toLowerCase()
                        : 'ADD CHILD',
                    style: TextStyle().copyWith(
                      fontSize: 12.0,
                      color: Color(0xFF4B9F46),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}