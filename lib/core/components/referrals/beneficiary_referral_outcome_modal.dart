import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/skip_logics/dreams_agyw_referral_outcome_skip_logic.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/skip_logics/ovc_referral_outcome.dart';
import 'package:provider/provider.dart';

class ReferralOutcomeModal extends StatefulWidget {
  const ReferralOutcomeModal({
    Key? key,
    required this.themeColor,
    required this.formSections,
    required this.hiddenFields,
    required this.referralOutcomeLinkage,
    required this.referralToFollowUpLinkage,
    required this.mandatoryFields,
    required this.referralEvent,
    required this.isOvcIntervention,
  }) : super(key: key);

  final Color themeColor;
  final List<FormSection> formSections;
  final String referralToFollowUpLinkage;
  final String referralOutcomeLinkage;
  final List<String> hiddenFields;
  final List<String> mandatoryFields;
  final ReferralEvent referralEvent;
  final bool isOvcIntervention;

  @override
  State<ReferralOutcomeModal> createState() => _ReferralOutcomeModalState();
}

class _ReferralOutcomeModalState extends State<ReferralOutcomeModal> {
  bool _isFormReady = false;
  bool _isSaving = false;
  final Map _mandatoryFieldsObject = {};
  List unFilledMandatoryFields = [];
  List<FormSection>? formSections;

  @override
  void initState() {
    super.initState();
    setEntryFormMetadata();
  }

  void setEntryFormMetadata() {
    _mandatoryFieldsObject.clear();
    for (String id in widget.mandatoryFields) {
      _mandatoryFieldsObject[id] = true;
    }
    evaluateSkipLogics();
    Timer(const Duration(milliseconds: 200), () {
      _isFormReady = true;
      setState(() {});
    });
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  evaluateSkipLogics() {
    Timer(
      const Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        if (widget.isOvcIntervention) {
          await OvcReferralOutcomeSkipLogic.evaluateSkipLogics(
            context,
            widget.formSections,
            dataObject,
          );
        } else {
          await DreamsAgywReferralOutcomeSkipLogic.evaluateSkipLogics(
            context,
            widget.formSections,
            dataObject,
          );
        }
      },
    );
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
  ) async {
    _isSaving = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 13.0,
      ),
      child: !_isFormReady
          ? const CircularProcessLoader(
              color: Colors.blueGrey,
            )
          : Container(
              margin: const EdgeInsets.symmetric(),
              child: Consumer<ServiceFormState>(
                builder: (context, serviceFormState, child) {
                  return Column(
                    children: [
                      EntryFormContainer(
                        hiddenSections: serviceFormState.hiddenSections,
                        hiddenFields: serviceFormState.hiddenFields,
                        elevation: 2.0,
                        formSections: widget.formSections,
                        mandatoryFieldObject: _mandatoryFieldsObject,
                        unFilledMandatoryFields: unFilledMandatoryFields,
                        dataObject: serviceFormState.formState,
                        isEditableMode: serviceFormState.isEditableMode,
                        onInputValueChange: onInputValueChange,
                      ),
                      ClipRRect(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          margin: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: widget.themeColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => _isSaving
                                      ? null
                                      : onSaveForm(
                                          context,
                                          serviceFormState.formState,
                                        ),
                                  child: Text(
                                    _isSaving
                                        ? 'SAVING OUTCOME ...'
                                        : 'SAVE OUTCOME',
                                    style: const TextStyle().copyWith(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFFFAFAFA),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
    );
  }
}
