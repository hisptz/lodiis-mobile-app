import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_school_attendance.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_school_performance.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_school_top_bar_selection.dart';
import 'package:provider/provider.dart';

class EducationBursarySchoolPage extends StatefulWidget {
  const EducationBursarySchoolPage({Key? key}) : super(key: key);

  @override
  _EducationBursarySchoolPageState createState() =>
      _EducationBursarySchoolPageState();
}

class _EducationBursarySchoolPageState
    extends State<EducationBursarySchoolPage> {
  bool isSchoolPerformanceSelected = false;

  void onChangeTabsSelection(bool schoolPerformance) {
    setState(() {
      isSchoolPerformanceSelected = schoolPerformance;
    });
  }

  @override
  Widget build(BuildContext context) {
    String schoolAttendanceLabel = 'School Attendance';
    String schoolPerformanceLabel = 'School Performance Tracking';
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0),
            child: Consumer<InterventionCardState>(
              builder: (context, interventionCardState, child) {
                InterventionCard activeInterventionProgram =
                    interventionCardState.currentInterventionProgram;
                return SubPageAppBar(
                  label: isSchoolPerformanceSelected
                      ? schoolPerformanceLabel
                      : schoolAttendanceLabel,
                  activeInterventionProgram: activeInterventionProgram,
                );
              },
            ),
          ),
          body: SubPageBody(
            body: Container(
              child: Consumer<EducationInterventionCurrentSelectionState>(
                builder: (context, educationInterventionCurrentSelectionState,
                    child) {
                  return Consumer<ServiceEventDataState>(
                    builder: (context, serviceFormState, child) {
                      EducationBeneficiary? bursaryBeneficiary =
                          educationInterventionCurrentSelectionState
                              .currentBeneficiciary;
                      bool isLoading = serviceFormState.isLoading;
                      return Container(
                        child: Column(
                          children: [
                            EducationBeneficiaryTopHeader(
                              educationBeneficiary: bursaryBeneficiary!,
                            ),
                            Container(
                              child: isLoading
                                  ? CircularProcessLoader(
                                      color: Colors.blueGrey,
                                    )
                                  : Column(
                                      children: [
                                        EducationBursarySchoolTopBarSelection(
                                          isSchoolPerformanceSelected:
                                              isSchoolPerformanceSelected,
                                          selectSchoolPerformance: () =>
                                              onChangeTabsSelection(true),
                                          selectSchoolAttendance: () =>
                                              onChangeTabsSelection(false),
                                        ),
                                        Container(
                                            child: isSchoolPerformanceSelected
                                                ? EducationBursarySchoolPerformance()
                                                : EducationBursarySchoolAttendance())
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
            ),
          ),
          bottomNavigationBar: InterventionBottomNavigationBarContainer()),
    );
  }
}
