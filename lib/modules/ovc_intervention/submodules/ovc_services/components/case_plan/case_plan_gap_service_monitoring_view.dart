import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/case_plan_gap_service_monitoring_event.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_case_plan_util.dart';
import 'package:provider/provider.dart';

class CasePlanGapServiceMonitoringView extends StatefulWidget {
  const CasePlanGapServiceMonitoringView({
    Key? key,
    required this.domainId,
    required this.formSectionColor,
    required this.casePlanGap,
    required this.isHouseholdCasePlan,
    required this.hasEditAccess,
    required this.onEditCasePlanServiveMonitoring,
    required this.onViewCasePlanServiveMonitoring,
  }) : super(key: key);

  final String domainId;
  final Color formSectionColor;
  final Map casePlanGap;
  final bool isHouseholdCasePlan;
  final bool hasEditAccess;

  final Function onEditCasePlanServiveMonitoring;
  final Function onViewCasePlanServiveMonitoring;

  @override
  State<CasePlanGapServiceMonitoringView> createState() =>
      _CasePlanGapServiceMonitoringViewState();
}

class _CasePlanGapServiceMonitoringViewState
    extends State<CasePlanGapServiceMonitoringView> {
  String casePlanGapToServiceMonitoringLinkage = '';
  String programStage = '';
  bool _isViewReady = false;

  @override
  void initState() {
    super.initState();
    _setViewMetadata();
  }

  _setViewMetadata() {
    programStage = widget.isHouseholdCasePlan
        ? OvcHouseholdCasePlanConstant.casePlanGapServiceMonitoringProgramStage
        : OvcChildCasePlanConstant.casePlanGapServiceMonitoringProgramStage;
    casePlanGapToServiceMonitoringLinkage = widget
            .casePlanGap[OvcCasePlanConstant.casePlanGapToMonitoringLinkage] ??
        '';
    _isViewReady = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      String currentLanguage = languageTranslationState.currentLanguage!;
      return Consumer<ServiceEventDataState>(
          builder: (context, serviceEventDataState, child) {
        bool isLoading = serviceEventDataState.isLoading;
        List<CasePlanGapServiceMonitoringEvent> casePlanServiceMonitorings =
            OvcCasePlanUtil.getCasePlanGapServiceMonitoringEvents(
                eventListByProgramStage:
                    serviceEventDataState.eventListByProgramStage,
                programStageIds: [programStage],
                casePlanGapToServiceMonitoringLinkage:
                    casePlanGapToServiceMonitoringLinkage);
        return isLoading || !_isViewReady
            ? const CircularProcessLoader(
                color: Colors.blueGrey,
              )
            : Container(
                margin: const EdgeInsets.symmetric(),
                child: Text('$currentLanguage : $casePlanServiceMonitorings'),
              );
      });
    });
  }
}
