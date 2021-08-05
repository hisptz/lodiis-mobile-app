import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class ReferralOutComeFollowUpModal extends StatefulWidget {
  const ReferralOutComeFollowUpModal({
    Key key,
    @required this.themeColor,
    @required this.referralToFollowUpLinkage,
    @required this.referralOutcomeFollowUpFormSections,
    @required this.beneficiary,
    @required this.referralFollowUpStage,
    @required this.referralProgram,
  }) : super(key: key);

  final Color themeColor;
  final String referralToFollowUpLinkage;
  final List<FormSection> referralOutcomeFollowUpFormSections;
  final TrackedEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralProgram;

  @override
  _ReferralOutComeFollowUpModalState createState() =>
      _ReferralOutComeFollowUpModalState();
}

class _ReferralOutComeFollowUpModalState
    extends State<ReferralOutComeFollowUpModal> {
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      isFormReady = true;
      setState(() {});
    });
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
  ) async {
    if (getReferralOutComeFollowUpStatus(dataObject)) {
      setState(() {
        isSaving = true;
      });
      try {
        dataObject[widget.referralToFollowUpLinkage] =
            dataObject[widget.referralToFollowUpLinkage] ?? '';
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          widget.referralProgram,
          widget.referralFollowUpStage,
          widget.beneficiary.orgUnit,
          widget.referralOutcomeFollowUpFormSections,
          dataObject,
          null,
          widget.beneficiary.trackedEntityInstance,
          null,
          [widget.referralToFollowUpLinkage],
        );
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
            Provider.of<ServiceEventDataState>(context, listen: false)
                .resetServiceEventDataState(
                    widget.beneficiary.trackedEntityInstance);
            String currentLanguage =
                Provider.of<LanguageTranslationState>(context, listen: false)
                    .currentLanguage;
            AppUtil.showToastMessage(
              message: currentLanguage == 'lesotho'
                  ? 'Fomo e bolokeile'
                  : 'Form has been saved successfully',
              position: ToastGravity.TOP,
            );
            Navigator.pop(context);
          });
        });
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
            AppUtil.showToastMessage(
              message: e.toString(),
              position: ToastGravity.BOTTOM,
            );
            Navigator.pop(context);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
        message: 'Please fill at least one form field',
        position: ToastGravity.TOP,
      );
    }
  }

  bool getReferralOutComeFollowUpStatus(Map dataObject) {
    bool isReferralOutcomeFilled = false;
    List<String> inputFields =
        FormUtil.getFormFieldIds(widget.referralOutcomeFollowUpFormSections);
    for (String id in inputFields) {
      if (dataObject.containsKey(id) && '${dataObject[id]}'.trim() != '') {
        isReferralOutcomeFilled = true;
      }
    }
    return isReferralOutcomeFilled;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        child: Consumer<ServiceFormState>(
          builder: (context, serviceFormState, child) {
            return Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.0,
                      left: 13.0,
                      right: 13.0,
                    ),
                    child: EntryFormContainer(
                      elevation: 0.0,
                      formSections: widget.referralOutcomeFollowUpFormSections,
                      mandatoryFieldObject: Map(),
                      dataObject: serviceFormState.formState,
                      isEditableMode: serviceFormState.isEditableMode,
                      onInputValueChange: onInputValueChange,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: widget.themeColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => isSaving
                                ? null
                                : this.onSaveForm(
                                    context,
                                    serviceFormState.formState,
                                  ),
                            child: Text(
                              isSaving
                                  ? 'SAVING FOLLOW UP ...'
                                  : 'SAVE FOLLOW UP',
                              style: TextStyle().copyWith(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
