import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan/case_plan_home_list.dart';
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
  }) : super(key: key);

  final String casePlanProgram;
  final String casePlanProgramStage;
  final String casePlanGapProgramStage;
  final String casePlanServiceProgramStage;
  final String casePlanMonitoringProgramStage;
  final bool enrollmentOuAccessible;
  final bool isHouseholdCasePlan;

  onManageCasePlan({
    required BuildContext context,
    required List<String> casePlanDates,
    bool isEditMode = true,
    List<Events> casePlanEvents = const [],
    Map<String?, List<Events>> eventListByProgramStage = const {},
  }) {
    // checking on adding
    // checking on edit
    // checking on add
    print(isEditMode);
    print(casePlanEvents);
    print(casePlanDates);
    print(eventListByProgramStage);
    print('-------');
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
