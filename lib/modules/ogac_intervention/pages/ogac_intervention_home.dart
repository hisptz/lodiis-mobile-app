import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/components/ogac_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/pages/ogac_enrollment_form.dart';
import 'package:provider/provider.dart';

class OgacInterventionHome extends StatelessWidget {
  const OgacInterventionHome({
    Key key,
  }) : super(key: key);

  void onUpdateFormState(
    BuildContext context,
    OgacBeneficiary ogacBeneficary,
    bool isEditableMode,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
        'location',
        isEditableMode ? ogacBeneficary.orgUnit : ogacBeneficary.location);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('trackedEntityInstance', ogacBeneficary.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', ogacBeneficary.orgUnit);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollment', ogacBeneficary.enrollment);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollmentDate', ogacBeneficary.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('incidentDate', ogacBeneficary.createdDate);
    if (ogacBeneficary.trackeEntityInstanceData != null) {
      for (Map attributeObj
          in ogacBeneficary.trackeEntityInstanceData.attributes) {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
    if (ogacBeneficary.eventData != null) {
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('eventDate', ogacBeneficary.eventData.eventDate);
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('eventId', ogacBeneficary.eventData.event);
      for (Map dataValue in ogacBeneficary.eventData.dataValues) {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(dataValue['dataElement'], dataValue['value']);
      }
      //Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(id, value);
    }
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return OgacEnrollemntForm();
      },
    ));
  }

  void onViewBeneficiary(
    BuildContext context,
    OgacBeneficiary ogacBeneficary,
  ) {
    onUpdateFormState(context, ogacBeneficary, false);
  }

  void onEditBeneficiary(
    BuildContext context,
    OgacBeneficiary ogacBeneficary,
  ) {
    onUpdateFormState(context, ogacBeneficary, true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Consumer<OgacInterventionListState>(
          builder: (context, ogacInterventionListState, child) {
            bool isLoading = ogacInterventionListState.isLoading;
            List<OgacBeneficiary> ogacBeneficaries =
                ogacInterventionListState.ogacInterventionList;
            return Container(
              child: isLoading
                  ? Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: CircularProcessLoader(
                        color: Colors.blueGrey,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: ogacBeneficaries.length == 0
                          ? Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'There is no ogac beneficiaries enrolled at moment',
                                ),
                              ),
                            )
                          : Column(
                              children: ogacBeneficaries
                                  .map(
                                    (OgacBeneficiary ogacBeneficary) =>
                                        OgacBeneficiaryCard(
                                      ogacBeneficary: ogacBeneficary,
                                      onEditBeneficiary: () =>
                                          onEditBeneficiary(
                                              context, ogacBeneficary),
                                      onViewBeneficiary: () =>
                                          onViewBeneficiary(
                                              context, ogacBeneficary),
                                    ),
                                  )
                                  .toList(),
                            ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
