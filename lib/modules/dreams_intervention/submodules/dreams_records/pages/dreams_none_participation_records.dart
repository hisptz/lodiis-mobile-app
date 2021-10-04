import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/none_participation_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_enrollment_none_participation_form.dart';
import 'package:provider/provider.dart';

class DreamsNoneParticipationRecordsPage extends StatefulWidget {
  const DreamsNoneParticipationRecordsPage({Key? key}) : super(key: key);

  @override
  _DreamsNoneParticipationRecordsPageState createState() =>
      _DreamsNoneParticipationRecordsPageState();
}

class _DreamsNoneParticipationRecordsPageState
    extends State<DreamsNoneParticipationRecordsPage> {
  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<EnrollmentFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onViewBeneficiary(
      BuildContext context, NoneParticipationBeneficiary beneficiary) {
    updateFormState(context, false, beneficiary.eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywEnrollmentNoneParticipationForm(),
      ),
    );
  }

  void onEditBeneficiary(
      BuildContext context, NoneParticipationBeneficiary beneficiary) {
    updateFormState(context, true, beneficiary.eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywEnrollmentNoneParticipationForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Consumer<DreamsInterventionListState>(
            builder: (context, ovcInterventionListState, child) {
              String header = 'AGYW/DREAMS none participants'.toUpperCase() +
                  ': ${ovcInterventionListState.numberOfNoneParticipants}';
              return SubModuleHomeContainer(
                header: header,
                bodyContents: _buildBody(currentLanguage),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBody(String? currentLanguage) {
    return Consumer<DreamsInterventionListState>(
      builder: (context, ovcState, child) => CustomPaginatedListView(
        errorWidget: Center(
          child: Text('There is no AGYW/DREAMS none participants at moment'),
        ),
        pagingController: ovcState.noneParticipantsPagingController,
        childBuilder: (context, dreamsNoneParticipant, index) =>
            NoneParticipantBeneficiaryCard(
          beneficiary: dreamsNoneParticipant,
          canEdit: true,
          onViewBeneficiary: () =>
              onViewBeneficiary(context, dreamsNoneParticipant),
          onEditBeneficiary: () =>
              onEditBeneficiary(context, dreamsNoneParticipant),
        ),
        emptyListWidget: Center(
          child: Column(
            children: [
              Text('There is no AGYW/DREAMS none participants at moment')
            ],
          ),
        ),
      ),
    );
  }
}
