import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/access_to_data_entry/access_to_data_entry_warning.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/services/reserved_attribute_value_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_container.dart';

class InterventionSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterventionSelectionState();
  }
}

class _InterventionSelectionState extends State<InterventionSelection> {
  List<InterventionCard> interventionPrograms =
      InterventionCard.getInterventions();

  Color? primaryColor = CustomColor.defaultPrimaryColor;

  void onInterventionSelection(InterventionCard interventionProgram) {
    setState(() {
      AppUtil.setStatusBarColor(interventionProgram.primaryColor);
      primaryColor = interventionProgram.primaryColor;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), updateDataStateLoadingStatus);
  }

  updateDataStateLoadingStatus() async {
    try {
      await Provider.of<CurrentUserState>(context, listen: false)
          .getAndSetCurrentUserDataEntryAuthorityStatus();
      await ReservedAttributeValueService().generateReservedAttributeValues();
      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcNumber();
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .refreshBeneficiariesNumber();
      Provider.of<OgacInterventionListState>(context, listen: false)
          .refreshOgacNumber();
      Provider.of<CurrentUserState>(context, listen: false)
          .setCurrentUserLocation();
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(color: primaryColor),
            ),
            Container(
              child: Consumer<OvcInterventionListState>(
                builder: (context, ovcInterventionListState, child) {
                  bool isOvcListLoading = ovcInterventionListState.isLoading;
                  int numberOfHouseholds =
                      ovcInterventionListState.numberOfHouseholds;
                  int numberOfOvcs = ovcInterventionListState.numberOfOvcs;
                  return Consumer<CurrentUserState>(
                      builder: (context, currentUserState, child) {
                    bool hasAccessToDataEntry =
                        currentUserState.canCurrentUserDoDataEntry;
                    return !hasAccessToDataEntry
                        ? Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.12,
                            ),
                            child: AccessToDataEntryWarning(),
                          )
                        : Container(
                            child: Consumer<DreamsInterventionListState>(
                              builder: (context, dreamsInterventionListState,
                                  child) {
                                bool isDreamsListLoading =
                                    dreamsInterventionListState.isLoading;
                                int numberOfAgywDreamsBeneficiaries =
                                    dreamsInterventionListState
                                        .numberOfAgywDreamsBeneficiaries;
                                int numberOfNoneAgywDreamsBeneficiaries =
                                    dreamsInterventionListState
                                        .numberOfNoneAgywDreamsBeneficiaries;
                                return Consumer<OgacInterventionListState>(
                                  builder: (context, ogacInterventionListState,
                                      child) {
                                    int numberOfOgac =
                                        ogacInterventionListState.numberOfOgac;
                                    bool isOgacListLoading =
                                        ogacInterventionListState.isLoading;
                                    return Container(
                                      child: isDreamsListLoading ||
                                              isOvcListLoading ||
                                              isOgacListLoading
                                          ? CircularProcessLoader()
                                          : InterventionSelectionContainer(
                                              interventionPrograms:
                                                  interventionPrograms,
                                              onInterventionSelection:
                                                  onInterventionSelection,
                                              numberOfHouseholds:
                                                  numberOfHouseholds,
                                              numberOfAgywDreamsBeneficiaries:
                                                  numberOfAgywDreamsBeneficiaries,
                                              numberOfNoneAgywDreamsBeneficiaries:
                                                  numberOfNoneAgywDreamsBeneficiaries,
                                              numberOfOvcs: numberOfOvcs,
                                              numberOfOgac: numberOfOgac,
                                            ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
