import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class ReferralOutcomeModal extends StatefulWidget {
  const ReferralOutcomeModal({
    Key key,
    @required this.themeColor,
    @required this.referralOutcomeFormSections,
    @required this.eventData,
    @required this.hiddenFields,
    @required this.referralToFollowUpLinkage,
  }) : super(key: key);

  final Color themeColor;
  final List<FormSection> referralOutcomeFormSections;
  final Events eventData;
  final String referralToFollowUpLinkage;
  final List<String> hiddenFields;

  @override
  _ReferralOutcomeModalState createState() => _ReferralOutcomeModalState();
}

class _ReferralOutcomeModalState extends State<ReferralOutcomeModal> {
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
    Events eventData,
  ) async {
    if (getReferralOutComeStatus(dataObject)) {
      setState(() {
        isSaving = true;
      });
      try {
        dataObject[widget.referralToFollowUpLinkage] =
            dataObject[widget.referralToFollowUpLinkage] ?? AppUtil.getUid();
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          eventData.program,
          eventData.programStage,
          eventData.orgUnit,
          widget.referralOutcomeFormSections,
          dataObject,
          eventData.eventDate,
          eventData.trackedEntityInstance,
          eventData.event,
          widget.hiddenFields,
        );
        Provider.of<ServiveEventDataState>(context, listen: false)
            .resetServiceEventDataState(eventData.trackedEntityInstance);
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
            AppUtil.showToastMessage(
                message: 'Form has been saved successfully',
                position: ToastGravity.TOP);
            Navigator.pop(context);
          });
        });
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
            Navigator.pop(context);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least one form field',
          position: ToastGravity.TOP);
    }
  }

  bool getReferralOutComeStatus(Map dataObject) {
    bool isreferralOutcomeFilled = false;
    List<String> inputFields =
        FormUtil.getFormFieldIds(widget.referralOutcomeFormSections);
    for (String id in inputFields) {
      if (dataObject.containsKey(id) && '${dataObject[id]}'.trim() != '') {
        isreferralOutcomeFilled = true;
      }
    }
    return isreferralOutcomeFilled;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                    formSections: widget.referralOutcomeFormSections,
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
                        child: FlatButton(
                          onPressed: () => isSaving
                              ? null
                              : this.onSaveForm(context,
                                  serviceFormState.formState, widget.eventData),
                          child: Text(
                            isSaving ? 'SAVING OUTCOME ...' : 'SAVE OUTCOME',
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
    );
  }
}
