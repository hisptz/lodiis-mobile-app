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

    int age = int.parse('${dataObject['age'] ?? '0'}');

    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();

    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'XEZ1waTp18L' && value != 'true') {
        hiddenFields['c9CzrUtn7dh'] = true;
        hiddenFields['m1pw5a6ptnD'] = true;
        hiddenFields['cLtX7aavyWx'] = true;
        hiddenFields['e59e3DpsrfO'] = true;
        hiddenFields['w6aNdM4gwi3'] = true;
        hiddenFields['q5CGrIpgap8'] = true;
        hiddenFields['MyWzaD8N5Mw'] = true;
        hiddenFields['ViUk8fZVrVG'] = true;
        hiddenFields['L8pjmifYu5v'] = true;
        hiddenFields['YTYxoL4uvd2'] = true;
        hiddenFields['XThk8GV71oH'] = true;
        hiddenFields['ldEyTeF48Bn'] = true;
        hiddenFields['NMdPGZbGdrJ'] = true;
      }
      if (inputFieldId == 'w6aNdM4gwi3' && value != 'true') {
        hiddenFields['q5CGrIpgap8'] = true;
      }
      if (inputFieldId == 'WHRJJvbbJV2' && value != 'true') {
        hiddenFields['TW5FP6ua1MY'] = true;
      }
      if (inputFieldId == '' && value != 'true') {
        hiddenFields['WHRJJvbbJV2'] = true;
        hiddenFields['TW5FP6ua1MY'] = true;
      }
      if (inputFieldId == 'XEZ1waTp18L' && value != 'true' && age <= 14) {
        hiddenFields['X0xtgjkUJaK'] = true;
        hiddenFields['BnzM3YGOQRC'] = true;
        hiddenFields['ILSjS6lDvGx'] = true;
        hiddenFields['MrxmSdFauSY'] = true;
      }
      if (inputFieldId == 'a1pS345KP53' && value != 'true') {
        hiddenFields['EniWU07LqXa'] = true;
        hiddenFields['DkstiOjXlSh'] = true;
      }
      if (inputFieldId == 'TWvKsmKyCSc') {
        if (value == 'true') {
          hiddenFields['xj9NOs6FeZw'] = true;
        } else {
          hiddenFields['cv8RKCPOOAo'] = true;
          hiddenFields['LPahlcvriGs'] = true;
        }
      }
      if (inputFieldId == 'G1FpSgvl1kK' && value != 'true') {
        hiddenFields['Qxb7zzJ98HI'] = true;
      }
      if (age >= 15) {
        hiddenFields['G1FpSgvl1kK'] = true;
        hiddenFields['Qxb7zzJ98HI'] = true;
      }
      if (age <= 14) {
        hiddenFields['gN37trYWyOh'] = true;
        hiddenFields['e59e3DpsrfO'] = true;
        hiddenFields['w6aNdM4gwi3'] = true;
        hiddenFields['q5CGrIpgap8'] = true;
      }
      if (age < 20) {
        hiddenFields['LPahlcvriGs'] = true;
      }
      if (inputFieldId == 'a1pS345KP53') {
        if (value == 'true') {
          assignInputFieldValue(context, 'RPqwCtEFza8', 'true');
        } else {
          assignInputFieldValue(context, 'RPqwCtEFza8', '');
        }
      }
      if (inputFieldId == 'G1FpSgvl1kK') {
        if (value == 'true') {
          assignInputFieldValue(context, 'D977px8ADd8', 'true');
        } else {
          assignInputFieldValue(context, 'D977px8ADd8', '');
        }
      }
      if (inputFieldId == 'TWvKsmKyCSc') {
        if (value == 'true') {
          assignInputFieldValue(context, 'K9nfVNC9wQo', 'true');
        } else {
          assignInputFieldValue(context, 'K9nfVNC9wQo', '');
        }
      }
      if (inputFieldId == 'L8pjmifYu5v') {
        if (value == 'true') {
          assignInputFieldValue(context, 'Xij6JPqNHgw', 'true');
        } else {
          assignInputFieldValue(context, 'Xij6JPqNHgw', '');
        }
      }
      if (inputFieldId == 'WHRJJvbbJV2') {
        if (value == 'true') {
          assignInputFieldValue(context, 'LmAeo9S1BFX', 'true');
        } else {
          assignInputFieldValue(context, 'LmAeo9S1BFX', '');
        }
      }
      if (inputFieldId == 'm1pw5a6ptnD') {
        if (value == ' true') {
          assignInputFieldValue(context, 'xqMDWAQ0aST', 'true');
        } else {
          assignInputFieldValue(context, 'xqMDWAQ0aST', '');
        }
      }
      if (inputFieldId == 'MrxmSdFauSY') {
        if (value == 'false') {
          assignInputFieldValue(context, 'O0rgyBGiBpW', 'true');
        } else {
          assignInputFieldValue(context, 'O0rgyBGiBpW', '');
        }
      }
      if (inputFieldId == 'gN37trYWyOh') {
        if (value == 'true') {
          assignInputFieldValue(context, 'pEZU4tCPJ7m', 'true');
        } else {
          assignInputFieldValue(context, 'pEZU4tCPJ7m', '');
        }
      }
      if (inputFieldId == 'a1pS345KP53') {
        if (value == 'true') {
          assignInputFieldValue(context, 'ICt3HySVpyI', 'true');
        } else {
          assignInputFieldValue(context, 'ICt3HySVpyI', 'false');
        }
      }
      if (inputFieldId == 'a1pS345KP53') {
        if (value == 'false') {
          assignInputFieldValue(context, 'ICt3HySVpyI', 'false');
        } else {
          assignInputFieldValue(context, 'ICt3HySVpyI', 'false');
        }
      }
      if (inputFieldId == 'GqOBk3DGpby') {
        if (value == 'true') {
          assignInputFieldValue(context, 'JRnOh92xlFB', 'true');
        } else {
          assignInputFieldValue(context, 'JRnOh92xlFB', 'false');
        }
      }
      if (inputFieldId == 'Qxb7zzJ98HI') {
        if (value == 'Single Orphan(Father)') {
          assignInputFieldValue(context, 'ac0uJduZGTC', 'No');
        } else if (value == 'Single Orphan(Mother)') {
          assignInputFieldValue(context, 'OK56Mru7Hwp', 'No');
        } else if (value == 'Double Orphan') {
          assignInputFieldValue(context, 'OK56Mru7Hwp', 'No');
          assignInputFieldValue(context, 'ac0uJduZGTC', 'No');
        }
      }
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
        hiddenFields['known_family_planning'] = true;
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
        hiddenFields['used_family_planning'] = true;
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
        hiddenFields['GXb0yN9WSvZ'] = true;
      }
      if (inputFieldId == 'zO2wRePjGvO' && value != 'true') {
        hiddenFields['pVEjKAzj7mA'] = true;
      }
      if (inputFieldId == 'FMT17u0pJ7o' && value != 'true') {
        hiddenFields['QxYCweHXR8r'] = true;
      }
      if (inputFieldId == 'BaG3QTzCdrm' && value != 'true') {
        hiddenFields['Tl8yAujLY2T'] = true;
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
        hiddenFields['H2Az2c3MeAy_checkbox'] = true;
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
        hiddenFields['typeOfDrugUsed'] = true;
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
        hiddenFields['seek_help'] = true;
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
