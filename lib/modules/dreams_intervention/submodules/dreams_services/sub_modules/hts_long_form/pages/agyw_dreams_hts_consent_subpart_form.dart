import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_enrollment_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/hts_consent.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_constant.dart';
import 'package:provider/provider.dart';
import 'agyw_dreams_hts_client_information.dart';

class AgywDreamsHTSConsentFormSubpart extends StatefulWidget {
  AgywDreamsHTSConsentFormSubpart({
    Key? key,
    this.isComingFromPrep,
  }) : super(key: key);

  final bool? isComingFromPrep;

  @override
  _AgywDreamsHTSConsentFormSubpartState createState() =>
      _AgywDreamsHTSConsentFormSubpartState();
}

class _AgywDreamsHTSConsentFormSubpartState
    extends State<AgywDreamsHTSConsentFormSubpart> {
  final String label = 'HTS Consent';
  List<FormSection>? formSections;
  List<FormSection>? defaultFormSections;
  bool isFormReady = false;
  bool isSaving = false;
  bool? isComingFromPrep;
  Map mandatoryFieldObject = Map();
  List<String> mandatoryFields = [];
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    isComingFromPrep = widget.isComingFromPrep;
    setFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
      });
    });
  }

  void setMandatoryFields(Map<dynamic, dynamic> dataObject) {
    unFilledMandatoryFields =
        AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
    setState(() {});
  }

  setFormSections() {
    var agyw =
        Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
            .currentAgywDream!;
    defaultFormSections = HTSConsent.getFormSections();
    if (agyw.enrollmentOuAccessible!) {
      formSections = defaultFormSections;
    } else {
      FormSection serviceProvisionForm =
          AppUtil.getServiceProvisionLocationSection(
        inputColor: AgywDreamsEnrollmentConstant.inputColor,
        labelColor: AgywDreamsEnrollmentConstant.labelColor,
        sectionLabelColor: AgywDreamsEnrollmentConstant.labelColor,
        allowedSelectedLevels:
            AgywDreamsEnrollmentConstant.allowedSelectedLevels,
        program: AgywDreamsEnrollmentConstant.program,
      );
      formSections = [serviceProvisionForm, ...defaultFormSections!];
      mandatoryFields = FormUtil.getFormFieldIds(
        [serviceProvisionForm],
        includeLocationId: true,
      );
      for (String fieldId in mandatoryFields) {
        mandatoryFieldObject[fieldId] = true;
      }
    }
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    onUpdateFormAutoSaveState(context);
  }

  bool isConsentGiven(Map dataObject) {
    List<String> consentFields = [
      'rguXA70zATn',
      'TcN49hQNZiG',
      'HZ4BrWoGNIO',
      'Gl7NGINbUAV',
      'yVYVJe26S4u',
      'B4xx1IVaAnI',
      'rY4ei8RNw6c'
    ];
    return !consentFields.every((field) =>
        '${dataObject[field]}' == 'false' || '${dataObject[field]}' == 'null');
  }

  void onSaveForm(BuildContext context, Map dataObject, AgywDream? agywDream) {
    setMandatoryFields(dataObject);
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      if (isConsentGiven(dataObject)) {
        dataObject[AgywDreamsHTSLongFormConstant.noOfPartnersAttributeKey] =
            getNoOfPartners(agywDream!);
        onUpdateFormAutoSaveState(context, isSaveForm: true);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgywDreamsHTSClientInformation(
              isComingFromPrep: isComingFromPrep,
            ),
          ),
        );
      } else {
        AppUtil.showToastMessage(
          message: 'Cannot proceed without consent',
          position: ToastGravity.TOP,
        );
      }
    } else {
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  getNoOfPartners(AgywDream agywDream) {
    List attributes = agywDream.trackedEntityInstanceData!.attributes ?? [];
    var noOfPartners = attributes.singleWhere(
        (attribute) =>
            attribute['attribute'] ==
            AgywDreamsHTSLongFormConstant.noOfPartnersAttributeKey,
        orElse: () => null); //q8qPtzanSTU
    return noOfPartners != null ? noOfPartners['value'] : '';
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    AgywDream agywDream =
        Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
            .currentAgywDream!;
    String? beneficiaryId = agywDream.id;
    Map dataObject =
        Provider.of<ServiceFormState>(context, listen: false).formState;
    String id =
        "${isComingFromPrep! ? DreamsRoutesConstant.agywDreamsPrEPHTSConsentPage : ''}_$beneficiaryId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: DreamsRoutesConstant.agywDreamsPrEPHTSConsentPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : DreamsRoutesConstant.agywDreamsPrEPHTSConsentNextPage
          : DreamsRoutesConstant.agywDreamsPrEPHTSConsentPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<DreamsBeneficiarySelectionState>(
        builder: (context, dreamsBeneficiarySelectionState, child) {
          AgywDream? agywDream =
              dreamsBeneficiarySelectionState.currentAgywDream;
          return Consumer<ServiceFormState>(
            builder: (context, serviceFormState, child) {
              return Container(
                child: Column(
                  children: [
                    DreamsBeneficiaryTopHeader(
                      agywDream: agywDream,
                    ),
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
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  unFilledMandatoryFields:
                                      unFilledMandatoryFields,
                                  isEditableMode:
                                      serviceFormState.isEditableMode,
                                  dataObject: serviceFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                ),
                              ),
                              Visibility(
                                visible: serviceFormState.isEditableMode,
                                child: EntryFormSaveButton(
                                  label: isSaving
                                      ? 'Saving ...'
                                      : 'Save and Continue',
                                  labelColor: Colors.white,
                                  buttonColor: Color(0xFF258DCC),
                                  fontSize: 15.0,
                                  onPressButton: () => onSaveForm(context,
                                      serviceFormState.formState, agywDream),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
