import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/input_fields/select_input_field.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/synchronization/constants/synchronization_actions_constants.dart';
import 'package:provider/provider.dart';

class SynchronizationActionForm extends StatefulWidget {
  const SynchronizationActionForm(
      {Key key, this.selectedSyncAction, this.onInitializeSyncAction})
      : super(key: key);

  final String selectedSyncAction;
  final Function(String) onInitializeSyncAction;

  @override
  _SynchronizationActionFormState createState() =>
      _SynchronizationActionFormState();
}

class _SynchronizationActionFormState extends State<SynchronizationActionForm> {
  InputField syncActionInput = InputField(
    id: 'sync',
    name: 'Sync action',
    valueType: 'TEXT',
    options: [
      InputFieldOption(
          code: SynchronizationActionsConstants().download, name: 'Download'),
      InputFieldOption(
        code: SynchronizationActionsConstants().upload,
        name: 'Upload',
      ),
      InputFieldOption(
        code: SynchronizationActionsConstants().downloadAndUpload,
        name: 'Download and Upload',
      ),
    ],
  );
  String selectedSyncAction;

  void onSyncActionSelection(BuildContext context, String value) {
    setState(() {
      selectedSyncAction = value;
    });
  }

  onSyncButtonPress() {
    if (selectedSyncAction != null) {
      widget.onInitializeSyncAction(selectedSyncAction);
    } else if (widget.selectedSyncAction != null) {
      widget.onInitializeSyncAction(widget.selectedSyncAction);
    } else {
      AppUtil.showToastMessage(
          message: 'Please Select Sync Action', position: ToastGravity.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialCard(body: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      return Container(
          padding: EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
                text: TextSpan(
                    text: syncActionInput.name,
                    style: TextStyle(
                      color: syncActionInput.labelColor,
                      fontSize: 13.0,
                      fontWeight: FontWeight.normal,
                    ))),
            Container(
              child: SelectInputField(
                hiddenInputFieldOptions: Map(),
                currentLanguage: languageTranslationState.currentLanguage,
                color:
                    Provider.of<InterventionCardState>(context, listen: false)
                        .currentInterventionProgram
                        .primaryColor,
                isReadOnly: syncActionInput.isReadOnly,
                renderAsRadio: syncActionInput.renderAsRadio,
                onInputValueChange: (dynamic value) =>
                    onSyncActionSelection(context, value),
                options: syncActionInput.options,
                selectedOption: selectedSyncAction ?? widget.selectedSyncAction,
              ),
            ),
            LineSeparator(
                color:
                    Provider.of<InterventionCardState>(context, listen: false)
                        .currentInterventionProgram
                        .primaryColor
                        .withOpacity(0.3)),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: EntryFormSaveButton(
                  label: 'Sync',
                  svgIconPath: selectedSyncAction ==
                              SynchronizationActionsConstants().download ||
                          widget.selectedSyncAction ==
                              SynchronizationActionsConstants().download
                      ? 'assets/icons/incoming-referral-navigation-icon.svg'
                      : selectedSyncAction ==
                                  SynchronizationActionsConstants().upload ||
                              widget.selectedSyncAction ==
                                  SynchronizationActionsConstants().upload
                          ? 'assets/icons/referral-navigation-icon.svg'
                          : selectedSyncAction ==
                                      SynchronizationActionsConstants()
                                          .downloadAndUpload ||
                                  widget.selectedSyncAction ==
                                      SynchronizationActionsConstants()
                                          .downloadAndUpload
                              ? 'assets/icons/sync.svg'
                              : null,
                  svgIconHeight: 15.0,
                  svgIconWidth: 15.0,
                  labelColor: Colors.white,
                  buttonColor:
                      Provider.of<InterventionCardState>(context, listen: false)
                          .currentInterventionProgram
                          .primaryColor,
                  fontSize: 15.0,
                  onPressButton: () => {onSyncButtonPress()},
                ),
              ),
            )
          ]));
    }));
  }
}
