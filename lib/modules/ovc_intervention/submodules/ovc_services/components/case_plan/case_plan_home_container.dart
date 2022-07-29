import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan/case_plan_home_list.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/ovc_case_plan_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_case_plan_util.dart';
import 'package:provider/provider.dart';

class CasePlanHomeContainer extends StatelessWidget {
  const CasePlanHomeContainer({
    Key? key,
    required this.enrollmentOuAccessible,
    required this.isHouseholdCasePlan,
    required this.casePlanProgram,
    required this.casePlanProgramStage,
    required this.casePlanGapProgramStage,
    required this.casePlanServiceProgramStage,
    required this.casePlanMonitoringProgramStage,
    required this.isOnCasePlanPage,
    required this.isOnCasePlanServiceProvision,
    required this.isOnCasePlanServiceMonitoring,
  }) : super(key: key);

  final String casePlanProgram;
  final String casePlanProgramStage;
  final String casePlanGapProgramStage;
  final String casePlanServiceProgramStage;
  final String casePlanMonitoringProgramStage;
  final bool enrollmentOuAccessible;
  final bool isHouseholdCasePlan;
  final bool isOnCasePlanPage;
  final bool isOnCasePlanServiceProvision;
  final bool isOnCasePlanServiceMonitoring;

  void _updateFormState(
      List<Events> casePlanEvents,
      List<String> casePlanDates,
      BuildContext context,
      bool isEditMode,
      Map<String?, List<Events>> eventListByProgramStage) {
    String eventDate = AppUtil.formattedDateTimeIntoString(DateTime.now());
    if (casePlanEvents.isEmpty && casePlanDates.contains(eventDate)) {
      AppUtil.showToastMessage(
        message: 'There is exiting case plan that has already created',
      );
    } else {
      Provider.of<ServiceFormState>(context, listen: false).resetFormState();
      Provider.of<ServiceFormState>(context, listen: false)
          .updateFormEditabilityState(isEditableMode: isEditMode);
      Map casePlanDataObject = {};
      if (casePlanEvents.isNotEmpty) {
        eventDate = casePlanEvents.first.eventDate ?? eventDate;
        List<Events> casePlanGapsEvents =
            eventListByProgramStage[casePlanGapProgramStage] ?? [];
        casePlanDataObject = OvcCasePlanUtil.getMappedCasePlanWithGapsByDomain(
          casePlanEvents: casePlanEvents,
          casePlanGapsEvents: casePlanGapsEvents,
        );
      }
      for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
        String formSectionId = formSection.id!;
        Map map = casePlanDataObject.containsKey(formSectionId)
            ? casePlanDataObject[formSectionId]
            : {};
        map['gaps'] = map['gaps'] ?? [];
        map['eventDate'] = map['eventDate'] ?? eventDate;
        map[OvcCasePlanConstant.casePlanToGapLinkage] =
            map[OvcCasePlanConstant.casePlanToGapLinkage] ?? AppUtil.getUid();
        map[OvcCasePlanConstant.casePlanDomainType] = formSectionId;
        Provider.of<ServiceFormState>(context, listen: false)
            .setFormFieldState(formSectionId, map);
      }
    }
  }

  onManageCasePlan({
    required BuildContext context,
    required List<String> casePlanDates,
    bool isEditMode = true,
    List<Events> casePlanEvents = const [],
    Map<String?, List<Events>> eventListByProgramStage = const {},
  }) {
    _updateFormState(casePlanEvents, casePlanDates, context, isEditMode,
        eventListByProgramStage);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcCasePlanForm(
            casePlanLabel: isHouseholdCasePlan
                ? 'Household Case Plan Form'
                : 'Child Case Plan Form',
            isOnCasePlanPage: isOnCasePlanPage,
            isOnCasePlanServiceMonitoring: isOnCasePlanServiceMonitoring,
            isOnCasePlanServiceProvision: isOnCasePlanServiceProvision,
            hasEditAccess: OvcCasePlanUtil.hasAccessToEdit(casePlanEvents),
            isHouseholdCasePlan: isHouseholdCasePlan,
            casePlanProgram: casePlanProgram,
            casePlanProgramStage: casePlanProgramStage,
            casePlanGapProgramStage: casePlanGapProgramStage,
            casePlanServiceProgramStage: casePlanServiceProgramStage,
            casePlanMonitoringProgramStage: casePlanMonitoringProgramStage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: Consumer<ServiceEventDataState>(
        builder: (context, serviceEventDataState, child) {
          bool isLoading = serviceEventDataState.isLoading;
          Map<String, List<Events>> casePlanByDates =
              OvcCasePlanUtil.getCasePlanByDates(
                  eventListByProgramStage:
                      serviceEventDataState.eventListByProgramStage,
                  programStageIds: [casePlanProgramStage]);
          List<String> casePlanDates = casePlanByDates.keys.toList();
          return isLoading
              ? const CircularProgressIndicator(
                  color: Colors.blueGrey,
                )
              : Column(
                  children: [
                    Visibility(
                      visible: casePlanByDates.keys.toList().isEmpty,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 17.0,
                        ),
                        child: const Center(
                          child: Text('There is no case plan at moment'),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: casePlanByDates.keys.toList().isNotEmpty,
                      child: CasePlanHomeList(
                        casePlanByDates: casePlanByDates,
                        onViewCasePlan: (List<Events> casePlanEvents) =>
                            onManageCasePlan(
                                context: context,
                                casePlanDates: casePlanDates,
                                eventListByProgramStage: serviceEventDataState
                                    .eventListByProgramStage,
                                isEditMode: false,
                                casePlanEvents: casePlanEvents),
                        onEditCasePlan: (List<Events> casePlanEvents) =>
                            onManageCasePlan(
                                context: context,
                                casePlanDates: casePlanDates,
                                eventListByProgramStage: serviceEventDataState
                                    .eventListByProgramStage,
                                casePlanEvents: casePlanEvents),
                      ),
                    ),
                    Visibility(
                      visible: enrollmentOuAccessible,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: casePlanByDates.keys.toList().isEmpty
                              ? 5.0
                              : 10.0,
                        ),
                        child: EntryFormSaveButton(
                          label: 'NEW CASE PLAN',
                          labelColor: Colors.white,
                          fontSize: 14.0,
                          buttonColor: const Color(0xFF4B9F46),
                          onPressButton: () => onManageCasePlan(
                            context: context,
                            casePlanDates: casePlanDates,
                          ),
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
