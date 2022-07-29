import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_case_plan_util.dart';
import 'package:provider/provider.dart';

class CasePlanHomeContainer extends StatelessWidget {
  const CasePlanHomeContainer({
    Key? key,
    required this.programStageIds,
    required this.enrollmentOuAccessible,
    required this.isHouseholdCasePlan,
  }) : super(key: key);

  final List<String> programStageIds;
  final bool enrollmentOuAccessible;
  final bool isHouseholdCasePlan;

  void onAddNewCasePlan(BuildContext context) {
    print('addd new case plans');
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
          Map<String, List<Events>> casePlanByDate =
              OvcCasePlanUtil.getCasePlanByDates(
                  eventListByProgramStage:
                      serviceEventDataState.eventListByProgramStage,
                  programStageIds: programStageIds);
          List<String> assessmentDates = casePlanByDate.keys.toList();
          int assessementIndex = casePlanByDate.keys.toList().length;
          return isLoading
              ? const CircularProgressIndicator(
                  color: Colors.blueGrey,
                )
              : Column(
                  children: [
                    Visibility(
                      visible: casePlanByDate.keys.toList().isEmpty,
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
                      visible: casePlanByDate.keys.toList().isNotEmpty,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 17.0,
                        ),
                        child: Text("$assessmentDates"),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical:
                              casePlanByDate.keys.toList().isEmpty ? 5.0 : 10.0,
                        ),
                        child: EntryFormSaveButton(
                          label: 'NEW CASE PLAN',
                          labelColor: Colors.white,
                          fontSize: 14.0,
                          buttonColor: const Color(0xFF4B9F46),
                          onPressButton: () => onAddNewCasePlan(
                            context,
                          ),
                        ))
                  ],
                );
        },
      ),
    );
  }
}
