import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/non_agyw_hts_client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/non_agyw_hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/none_agyw_enrollment_prep_screening_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/skip_logics/none_agyw_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class NonAgywDreamsHTSRegisterForm extends StatefulWidget {
  NonAgywDreamsHTSRegisterForm({Key key, this.isComingFromPrep})
      : super(key: key);
  final bool isComingFromPrep;

  @override
  _NonAgywDreamsHTSRegisterFormState createState() =>
      _NonAgywDreamsHTSRegisterFormState();
}

class _NonAgywDreamsHTSRegisterFormState
    extends State<NonAgywDreamsHTSRegisterForm> {
  final String label = 'HTS Register';
  List<FormSection> formSections;
  final List<String> mandatoryFields = NonAgywHTSRegister.getMandatoryFields();
  final List<String> indicationForPrEPFields =
      NonAgywHTSClientInformation.getIndicationsForPrep();
  final Map mandatoryFieldObject = Map();
  bool isFormReady = false;
  bool isSaving = false;
  bool isComingFromPrep;
  List<FormSection> allFormSections = [];
  List unFilledMandatoryFields = [];
  final String trackedEntityInstance = AppUtil.getUid();

  @override
  void initState() {
    super.initState();
    isComingFromPrep = widget.isComingFromPrep;
    formSections = NonAgywHTSRegister.getFormSections();
    allFormSections.addAll(formSections);
    allFormSections.addAll(NonAgywHTSClientInformation.getFormSections());

    for (String id in mandatoryFields) {
      mandatoryFieldObject[id] = true;
    }
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await NoneAgywEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  void onSaveForm(BuildContext context, Map dataObject) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      try {
        if (dataObject[NonAgywDreamsHTSConstant.hivResultStatus] ==
            'Negative') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoneAgywEnrollmentPrepScreeningForm()));
        } else {
          setState(() {
            isSaving = true;
          });
          CurrentUser user = await UserService().getCurrentUser();
          dataObject['PN92g65TkVI'] = dataObject['PN92g65TkVI'] ?? 'Active';
          dataObject['klLkGxy328c'] =
              dataObject['klLkGxy328c'] ?? user.implementingPartner;
          List<String> hiddenFields = [
            BeneficiaryIdentification.beneficiaryId,
            BeneficiaryIdentification.beneficiaryIndex,
            'PN92g65TkVI',
            'klLkGxy328c',
          ];
          String orgUnit = dataObject['location'];
          await NoneAgywDreamEnrollmentService().savingNonAgwyBeneficiary(
            dataObject,
            trackedEntityInstance,
            orgUnit,
            null,
            null,
            null,
            hiddenFields,
          );
          Provider.of<DreamsInterventionListState>(context, listen: false)
              .onNonAgywBeneficiaryAdd();
          Timer(
            Duration(seconds: 1),
            () {
              if (Navigator.canPop(context)) {
                setState(() {
                  isSaving = false;
                });
                String currentLanguage = Provider.of<LanguageTranslationState>(
                        context,
                        listen: false)
                    .currentLanguage;
                AppUtil.showToastMessage(
                  message: currentLanguage == 'lesotho'
                      ? 'Fomo e bolokeile'
                      : 'Form has been saved successfully',
                  position: ToastGravity.TOP,
                );
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
          );
        }
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least one form field',
          position: ToastGravity.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(child: Consumer<EnrollmentFormState>(
            builder: (context, enrollmentFormState, child) {
              return Container(
                child: Column(
                  children: [
                    !isFormReady
                        ? Container(
                            child: CircularProcessLoader(
                              color: Colors.blueGrey,
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10.0,
                                  left: 13.0,
                                  right: 13.0,
                                ),
                                child: EntryFormContainer(
                                  hiddenFields:
                                      enrollmentFormState.hiddenFields,
                                  hiddenSections:
                                      enrollmentFormState.hiddenSections,
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  isEditableMode:
                                      enrollmentFormState.isEditableMode,
                                  dataObject: enrollmentFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                  unFilledMandatoryFields:
                                      unFilledMandatoryFields,
                                ),
                              ),
                              Visibility(
                                visible: enrollmentFormState.isEditableMode,
                                child: EntryFormSaveButton(
                                  label: isSaving
                                      ? 'Saving ...'
                                      : 'Save and Continue',
                                  labelColor: Colors.white,
                                  buttonColor: Color(0xFF258DCC),
                                  fontSize: 15.0,
                                  onPressButton: () => onSaveForm(
                                      context, enrollmentFormState.formState),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              );
            },
          )),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
