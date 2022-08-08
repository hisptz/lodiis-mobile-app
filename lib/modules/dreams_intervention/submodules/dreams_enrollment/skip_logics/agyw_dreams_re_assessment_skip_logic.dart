import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class AgywDreamsReAssessmentSkipLogic {
  static Map hiddenFields = {};
  static Map hiddenSections = {};
  static Map hiddenInputFieldOptions = {};

  static Future evaluateSkipLogic(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    Map hiddenOptions = {};
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();

    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';

      //  TODO Add  re-assessment skip logic

      // TODO Add re-enrollment skip logic
      if (inputFieldId == 'vg7BIorWZ90' && value != 'Other') {
        hiddenFields['PnAde2Zsx8w'] = true;
      }
      if (inputFieldId == 'JRnOh92xlFB' && value != 'true') {
        hiddenFields['w5d5ThKRBC6'] = true;
      }
      if (inputFieldId == 'IH2D6jn62eY' && value != 'true') {
        hiddenFields['RrKSLZXhIJJ'] = true;
      }
      if (inputFieldId == 'ohUySrvz9JD' && value != 'Yes') {
        hiddenFields['nQrhKlq91sr'] = true;
      }
      if (inputFieldId == 'TWvKsmKyCSc') {
        assignInputFieldValue(context, 'jO5PbtUYCue', value);
      }
      if (inputFieldId == 'uuQMZpqNURW' && value != 'Primary level') {
        hiddenFields['SYoIimrc8A9'] = true;
      }
      if (inputFieldId == 'uuQMZpqNURW' && value != 'Secondary level') {
        hiddenFields['VJitBCt6qZ3'] = true;
      }
      if (inputFieldId == 'uuQMZpqNURW' && value != 'Other') {
        hiddenFields['k9bRQv9sF8j'] = true;
      }
      if (inputFieldId == 'BDz4rlupffk' && value != 'true') {
        hiddenFields['eyNmhYeAipl'] = true;
      }
      if (inputFieldId == 'vsusuuCpGYV' && value != 'true') {
        hiddenFields['B8PRxprZkaR'] = true;
        hiddenFields['TJd7YYN1jeH'] = true;
      }
      if (inputFieldId == 'vsusuuCpGYV' && value != 'false') {
        hiddenFields['IzfGgfP8lNH'] = true;
        hiddenFields['UUEeO12S3Q5'] = true;
        hiddenFields['sQ5q1EmZq4V'] = true;
        hiddenFields['z5Rcs0hwM3f'] = true;
        hiddenFields['GyqA4M4s9Jy'] = true;
        hiddenFields['I27rCOmCnlM'] = true;
        hiddenFields['LkAVZJku1bf'] = true;
        hiddenFields['W9n87DM5ZKh'] = true;
      }
      if (inputFieldId == 'edK6Y5C1VHN' && value != 'true') {
        hiddenFields['iNDDGvgNHwb'] = true;
      }
      if (inputFieldId == 'nSh4v0iBjKW' && value != 'Yes') {
        hiddenFields['fINHdGnfAMA'] = true;
      }
      if (inputFieldId == 'fINHdGnfAMA' && value != 'true') {
        hiddenFields['LHf5EZmkZ5q'] = true;
      }
      if (inputFieldId == 'VTCiGG3UqI0' && value != 'true') {
        hiddenFields['CZcaiGJsBiZ'] = true;
        hiddenFields['BbAer5joCHv'] = true;
        hiddenFields['S3y6E3zHKOI'] = true;
        hiddenFields['liDqlsV4OmD'] = true;
        hiddenFields['ePkOvv6DUq9'] = true;
        hiddenFields['smu54AunmQw'] = true;
        hiddenFields['RvLNRYLMdLL'] = true;
        hiddenFields['csZyQAY9BNH'] = true;
      }
      if (inputFieldId == 'csZyQAY9BNH' && value != 'true') {
        hiddenFields['qliQfYk36Qe'] = true;
        hiddenFields['OHMTDYj2AsD'] = true;
        hiddenFields['ZsKGtSMwYqb'] = true;
        hiddenFields['dnyQhtEZluG'] = true;
        hiddenFields['MFVj9vKwKAe'] = true;
      }
      if (inputFieldId == 'csZyQAY9BNH' && value != 'false') {
        hiddenFields['v6xma7NoXJf'] = true;
      }
      if (inputFieldId == 'V8ziLwhPA05' && value != 'true') {
        hiddenFields['bcLRyBt45xX'] = true;
      }
      if (inputFieldId == 'zO2wRePjGvO' && value != 'true') {
        hiddenFields['pVEjKAzj7mA'] = true;
      }
      if (inputFieldId == 'FMT17u0pJ7o' && value != 'true') {
        hiddenFields['QxYCweHXR8r'] = true;
      }
      if (inputFieldId == 'BaG3QTzCdrm' && value != 'true') {
        hiddenFields['QxYCweHXR8r'] = true;
      }
      if (inputFieldId == 'jeb1PlPmJHD' && value != 'true') {
        hiddenFields['dAlwALiZxnT'] = true;
      }
      if (inputFieldId == 'rfwvxFDyLnN' && value != 'true') {
        hiddenFields['K0r3yA6oi3F'] = true;
      }
      if (inputFieldId == 'dvT9e6eeNsE' && value != 'true') {
        hiddenFields['B1hsntcuB5q'] = true;
      }
      if (inputFieldId == 'mZXrTDoaBqp' && value != 'true') {
        hiddenFields['FGiKknNPkbh'] = true;
      }
      if (inputFieldId == 'WMjfK2Fl7d6' && value != 'true') {
        hiddenFields['ZX7jaEWS5Tu'] = true;
        hiddenFields['ozZOGSNP0ZL'] = true;
        hiddenFields['VgaY6FIuggs'] = true;
        hiddenFields['pkc3tHTirOj'] = true;
        hiddenFields['VdnWjzKyMkj'] = true;
        hiddenFields['ZQ48ocoJoZD'] = true;
        hiddenFields['W8ChrDLO18b'] = true;
        hiddenFields['OUOVMpCkOOr'] = true;
        hiddenFields['aSCE8aW4BKK'] = true;
        hiddenFields['UtTKoXNvsnt'] = true;
        hiddenFields['SeAKGquzcZs'] = true;
      }
      if (inputFieldId == 'ICt3HySVpyI' && value != 'true') {
        hiddenFields['gwxgoK1SiG7'] = true;
      }
      if (inputFieldId == 'flG4KJIt01K' && value != 'true') {
        hiddenFields['Qw4If3g2ZTk'] = true;
        hiddenFields['DYlMEu5l6qL'] = true;
        hiddenFields['HchL5WVGByq'] = true;
        hiddenFields['z6R0L8rrp37'] = true;
        hiddenFields['nTWvhUFVpA9'] = true;
        hiddenFields['PPdHrhOS0py'] = true;
        hiddenFields['tUM0QoCh8qb'] = true;
        hiddenFields['dEjPMMghD1I'] = true;
      }
      if (inputFieldId == 'tUM0QoCh8qb' && value != 'true') {
        hiddenFields['dEjPMMghD1I'] = true;
      }
      if (inputFieldId == 'pDKOAGB7LKD' && value != 'true') {
        hiddenFields['A6QAU54w2wy'] = true;
        hiddenFields['uU3uryQGK63'] = true;
        hiddenFields['YTIdNMhrIbT'] = true;
        hiddenFields['PaxU4ausAxY'] = true;
        hiddenFields['AmlsrMQC5e0'] = true;
        hiddenFields['SbH8RKHMdcZ'] = true;
        hiddenFields['LMWLaAgs1Vh'] = true;
        hiddenFields['EoxY8HfFYL6'] = true;
        hiddenFields['EoxY8HfFYL6'] = true;
        hiddenFields['vz0mifjJR9z'] = true;
        hiddenFields['YMfWJFnF0qW'] = true;
      }
    }

    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenInputFieldOptions(context, formSections);
    resetValuesForHiddenSections(context, formSections);
  }

  static resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  static resetValuesForHiddenInputFieldOptions(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenInputFieldOptions(hiddenInputFieldOptions);
  }

  static resetValuesForHiddenSections(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenSections(hiddenSections);
  }

  static assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String? value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
