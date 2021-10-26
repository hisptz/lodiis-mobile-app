import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_list_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/bursary_attendance_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_attendance_form_page.dart';
import 'package:provider/provider.dart';

class EducationBursarySchoolAttendance extends StatefulWidget {
  const EducationBursarySchoolAttendance({Key? key}) : super(key: key);

  @override
  _EducationBursarySchoolAttendanceState createState() =>
      _EducationBursarySchoolAttendanceState();
}

class _EducationBursarySchoolAttendanceState
    extends State<EducationBursarySchoolAttendance> {
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

  void redirectToAttendanceForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EducationBursaryAttendanceFormPage(isSchoolAttendance: true);
        },
      ),
    );
  }

  onViewAttendance(
    BuildContext context,
    Events eventData,
  ) {
    bool isEditableMode = false;
    updateFormState(context, isEditableMode, eventData);
    redirectToAttendanceForm(context);
  }

  onAddAttendance(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
  ) async {
    bool isEditableMode = true;
    String? beneficiaryId = educationBeneficiary.id;
    String eventId = '';
    String formAutoSaveId =
        "${BursaryRoutesConstant.schoolsAttendancePageModule}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, isEditableMode, null);
      // Assign current date as event date
      Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
          'eventDate',
          '${AppUtil.formattedDateTimeIntoString(DateTime.now())}');
      redirectToAttendanceForm(context);
    }
  }

  onEditAttendance(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
    Events eventData,
  ) async {
    bool isEditableMode = true;
    String? beneficiaryId = educationBeneficiary.id;
    String eventId = eventData.event!;
    String formAutoSaveId =
        "${BursaryRoutesConstant.schoolsAttendancePageModule}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave,
            beneficiaryName: educationBeneficiary.toString());
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, isEditableMode, eventData);
      redirectToAttendanceForm(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      BursaryInterventionConstant.schoolAttendanceProgramStage
    ];

    return Container(
      child: Consumer<EducationInterventionCurrentSelectionState>(
        builder: (context, educationInterventionCurrentSelectionState, child) {
          return Consumer<ServiceEventDataState>(
            builder: (context, serviceEventDataState, child) {
              EducationBeneficiary? bursaryBeneficiary =
                  educationInterventionCurrentSelectionState
                      .currentBeneficiciary;
              bool isLoading = serviceEventDataState.isLoading;
              Map<String?, List<Events>> eventListByProgramStage =
                  serviceEventDataState.eventListByProgramStage;
              List<Events> events = TrackedEntityInstanceUtil
                  .getAllEventListFromServiceDataStateByProgramStages(
                      eventListByProgramStage, programStageIds);

              List<BursaryAttendanceEvent> attendances = events
                  .map((Events event) =>
                      BursaryAttendanceEvent().fromTeiModel(event))
                  .toList();
              return Container(
                child: Column(
                  children: [
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
                                          'There is no school attendance at a moment',
                                        )
                                      : Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 5.0,
                                            horizontal: 13.0,
                                          ),
                                          child: Column(
                                            children: attendances.map(
                                                (BursaryAttendanceEvent
                                                    attendance) {
                                              return EducationListCard(
                                                date: attendance.date!,
                                                title: attendance.attended
                                                    ? 'Attended'
                                                    : 'Not Attended',
                                                onEdit: () => onEditAttendance(
                                                  context,
                                                  bursaryBeneficiary!,
                                                  attendance.eventData!,
                                                ),
                                                onView: () => onViewAttendance(
                                                  context,
                                                  attendance.eventData!,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                ),
                                EntryFormSaveButton(
                                  label: 'ADD SCHOOL ATTENDANCE',
                                  labelColor: Colors.white,
                                  buttonColor: Color(0xFF009688),
                                  fontSize: 15.0,
                                  onPressButton: () => onAddAttendance(
                                      context, bursaryBeneficiary!),
                                ),
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
    );
  }
}
