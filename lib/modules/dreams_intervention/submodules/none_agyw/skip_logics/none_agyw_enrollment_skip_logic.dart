import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_hts_constant.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_prep_visit_constant.dart';
import 'package:kb_mobile_app/core/utils/date_conversion_util.dart';

class NoneAgywEnrollmentSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();
  static Map hiddenInputFieldOptions = Map();

  static Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    Map hiddenOptions = Map();
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();
    // dataObject[NonAgywPrepVisitConstant.clientWeight] =
    //     dataObject[NonAgywDreamsHTSConstant.weight];
    // assign facility name
    // dataObject['YDxOvZTdzAc'] = dataObject['atNbeYwzMq6'];
    // assign date
    // dataObject['oZPPEMZ0hXt'] =
    //     '${AppUtil.formattedDateTimeIntoString(DateTime.now())}';
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'qZP982qpSPS') {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue(context, 'ls9hlz2tyol', age.toString());
      }
      if (inputFieldId == 'NDigy1JKTNV') {
        if (dataObject['sJ35hsF6Lf9'] == 'Couple') {
          assignInputFieldValue(context, inputFieldId, 'true');
        } else if (dataObject['sJ35hsF6Lf9'] == 'Individual') {
          assignInputFieldValue(context, inputFieldId, 'false');
        } else {
          assignInputFieldValue(context, inputFieldId, null);
        }
      }
      if (inputFieldId == 'NDigy1JKTNV' && value != 'true') {
        hiddenFields['wRU2FLKUXer'] = true;
      }
      if (inputFieldId == 's1eRvsL2Ly4' && value != 'Other') {
        hiddenFields['DuWh8Gqwmjf'] = true;
      }
      if (inputFieldId == 'Y4dPrHZt7zu' && value != 'true') {
        hiddenFields['yHAjVqDrXuk'] = true;
      }
      if (inputFieldId == 'vUobJnyivtf' && value != 'true') {
        hiddenFields['Lj7CDNvvtw5'] = true;
      }
      if (inputFieldId == 'U90wPGZgftv') {
        if (value == '0') {
          dataObject['hWBVFd8DTRj'] = 'false';
        }
      }
      if (inputFieldId == 'ulJwlQIOLQA' && value != 'true') {
        hiddenFields['CcMOQFuS5Uy'] = true;
      }
      if (inputFieldId == 'wI9gNztaVzD' && value != '1') {
        hiddenFields['BL8liR3gxy6'] = true;
      }
      if (inputFieldId == 'W8mAvBSM3Pg' && value != 'true') {
        hiddenFields['fT7eqY4H5f4'] = true;
      }
      if (inputFieldId == 'CHGgb5j2Q9C') {
        if (dataObject['uQLJ4S06kfR'] == 'Primary') {
          dataObject[inputFieldId] = 'Less than Standard 7';
        } else if (dataObject['uQLJ4S06kfR'] == 'Secondary school') {
          dataObject[inputFieldId] = 'Secondary School';
        } else if (dataObject['uQLJ4S06kfR'] == 'High school') {
          dataObject[inputFieldId] = 'High School';
        } else if (dataObject['uQLJ4S06kfR'] == 'None') {
          dataObject[inputFieldId] = 'None';
        }
      }
      if (inputFieldId == 'tB5Htsd5jlr' && value != 'true') {
        hiddenFields['zXlncmz51aw'] = true;
      }
      if (inputFieldId == 'MlgzbQNpeqj' && value != 'true') {
        hiddenFields['MlgzbQNpeqj_checkbox'] = true;
      }
      if (inputFieldId == 'RHPU8hatG4H' && value != 'Other') {
        hiddenFields['DuWh8Gqwmjf'] = true;
      }

      if (inputFieldId == 'WAlaenCYazT' && value != 'true') {
        hiddenFields['ZUhWRJSajUE'] = true;
        hiddenFields['K9y9eMHeSfa'] = true;
        hiddenFields['T4jtufXMh73'] = true;
      }
      if (inputFieldId == 'IJUy3A0IVpr' && value != 'true') {
        hiddenFields['Hr43Ub9GNyP'] = true;
      }
      if (inputFieldId == 'eOy1XwiYC8H' && value != 'true') {
        hiddenFields['X2m9v2E5WaI'] = true;
      }
      if (inputFieldId == 'w4DBU1hJtxd' && value != 'true') {
        hiddenFields['IYD4dA4EBnX'] = true;
      }
      if (inputFieldId == 'zGAjwEL0yL5' && value != '') {
        hiddenFields['fufd2D8sYc3'] = true;
      }
      if (inputFieldId == 'uBJeTLcoAKM' && value != 'Other') {
        hiddenFields['OLaa0ZiGMVu'] = true;
      }
      if (inputFieldId == 'qZP982qpSPS') {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue(context, 'ls9hlz2tyol', age.toString());
      }
      if (inputFieldId == 'vIX4GTSCX4P' && value == 'Female') {
        hiddenOptions['Circumsized'] = true;
      }
      if ((inputFieldId == 'J53jgfHiufC' && value != 'Other')) {
        hiddenFields['ybq5BQOdMG6'] = true;
      }
      if (inputFieldId == 'G86T8BY1eVL' && value != 'Other') {
        hiddenFields['YzPuEq2nAIh'] = true;
      }

      if (inputFieldId == 'sJ35hsF6Lf9' && value != 'Couple') {
        hiddenFields['XjHuTmtsXsz'] = true;
      }
      if (inputFieldId == 'Lam6bSq1Zgk' && value != 'Other') {
        hiddenFields['w6kNR0e4G6V'] = true;
      }

      if (inputFieldId == 'qvXYyTK9h2m' && value != 'true') {
        hiddenFields['ZxXscC5W9qb'] = true;
        hiddenFields['ECSlqcSEB9D'] = true;
        hiddenFields['z50tGzpCAow'] = true;
      }
      if (inputFieldId == 'mmK9CT0n9BV' && value != 'true') {
        hiddenFields['i0U8S4F3rTa'] = true;
        hiddenFields['HD5YrKZXzQl'] = true;
        hiddenFields['dOUKOAUsIgD'] = true;
        hiddenFields['WZYXR6Azijc'] = true;
        hiddenFields['XAHL4Ldyv3P'] = true;
        hiddenFields['eBHVZQ8jWOm'] = true;
        hiddenFields['odSWc26b9P6'] = true;
        hiddenFields['ZZBWYb9jzHE'] = true;
      }
      if (inputFieldId == 'RXS4fNXVKMl' && value != 'true') {
        hiddenFields['LZFhD0N9Zj5'] = true;
      }
      // if ('${dataObject['eXp9ASOufpR']}' != 'null' &&
      //     '${dataObject['qsujYWhB0DP']}' != 'null') {
      //   dataObject['eXp9ASOufpR_bmi'] = calculateBMI(
      //       '${dataObject['eXp9ASOufpR']}', '${dataObject['qsujYWhB0DP']}');
      // }
      if (inputFieldId == 'vkd6o91n1IC') {
        if (dataObject['vIX4GTSCX4P'] == 'Male') {
          dataObject[inputFieldId] = 'NON-AGYW';
        } else if (dataObject['vIX4GTSCX4P'] == 'Female') {
          int age = int.parse('${dataObject['ls9hlz2tyol'] ?? '0'}');
          if (age >= 15 && age <= 24) {
            dataObject[inputFieldId] = 'AGYW';
          } else {
            dataObject[inputFieldId] = 'NON-AGYW';
          }
        }
      }
      if (inputFieldId == 'WsyK9VWBYOQ' && value != 'Other(Specify)') {
        hiddenFields['Yk0afIAypzt'] = true;
      }
      if (inputFieldId == 'ses8fLQtfoi' && value != 'true') {
        hiddenFields['aX0niP9AH6t'] = true;
        hiddenFields['zcMQIn9jMRD'] = true;
        hiddenFields['GwsIKCCsbSB'] = true;
      }
      if (inputFieldId == 'yvu29Wvtb41' && value != 'true') {
        hiddenFields['CpGjlCaEcJt'] = true;
      }
      if (inputFieldId == 'FI9Wzzys767') {
        dataObject[inputFieldId] = dataObject['LVcAj2cW778'];
      }
      if (inputFieldId == 'VWa6pitIsPr' && value == 'true') {
        hiddenFields['UTXsJZmGVDe'] = true;
      }
      // Assign HIV results
      if (inputFieldId == 'dQBja8nUr18') {
        if (dataObject[NonAgywDreamsHTSConstant.hivResultStatus] ==
            'Negative') {
          dataObject[inputFieldId] = 'true';
        } else {
          dataObject[inputFieldId] = 'false';
        }
      }
      // Assign type of test used
      // if (inputFieldId == '') {}
      // assing Rapid test result
      if (dataObject[NonAgywDreamsHTSConstant.t1Result] == null &&
          dataObject[NonAgywDreamsHTSConstant.t2Result] == null) {
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult1] = true;
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult2] = true;
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult3] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled1] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled2] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled3] = true;
      } else if (dataObject[NonAgywDreamsHTSConstant.t1Result] == null) {
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult1] = true;
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult3] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled3] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled1] = true;
        dataObject[NonAgywPrepVisitConstant.prepRapidTestResult2] =
            dataObject[NonAgywDreamsHTSConstant.t2Result];
      } else if (dataObject[NonAgywDreamsHTSConstant.t2Result] == null) {
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult2] = true;
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult3] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled3] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled2] = true;
        dataObject[NonAgywPrepVisitConstant.prepRapidTestResult1] =
            dataObject[NonAgywDreamsHTSConstant.t1Result];
      } else {
        dataObject[NonAgywPrepVisitConstant.prepRapidTestResult1] =
            dataObject[NonAgywDreamsHTSConstant.t1Result];
        dataObject[NonAgywPrepVisitConstant.prepRapidTestResult2] =
            dataObject[NonAgywDreamsHTSConstant.t2Result];
        hiddenFields[NonAgywPrepVisitConstant.prepRapidTestResult3] = true;
        hiddenFields[NonAgywPrepVisitConstant.dateBled3] = true;
      }
      // calculate period between
      if (inputFieldId ==
              NonAgywPrepVisitConstant.prepPeriodBetweenTestingAndResults &&
          dataObject[NonAgywPrepVisitConstant.clientInformedOfTestResults] !=
              null) {
        bool hasTestDate = true;
        DateTime resultDate = DateTime.parse(
            '${dataObject[NonAgywPrepVisitConstant.clientInformedOfTestResults]}');
        DateTime testDate;
        if (dataObject[NonAgywPrepVisitConstant.dateBled3] != '' &&
            dataObject[NonAgywPrepVisitConstant.dateBled3] != null) {
          testDate = DateTime.parse(
              '${dataObject[NonAgywPrepVisitConstant.dateBled3]}');
        } else if (dataObject[NonAgywPrepVisitConstant.dateBled2] != '' &&
            dataObject[NonAgywPrepVisitConstant.dateBled2] != null) {
          testDate = DateTime.parse(
              '${dataObject[NonAgywPrepVisitConstant.dateBled2]}');
        } else if (dataObject[NonAgywPrepVisitConstant.dateBled1] != '' &&
            dataObject[NonAgywPrepVisitConstant.dateBled1] != null) {
          testDate = DateTime.parse(
              '${dataObject[NonAgywPrepVisitConstant.dateBled1]}');
        } else {
          hasTestDate = false;
        }

        if (hasTestDate) {
          String periodType = dataObject[NonAgywPrepVisitConstant
                  .prepTypeOfPeriodBetweenTestingAndResults] ??
              '';
          if (periodType == '') {
            String days =
                DateConversionUtil.getDaysBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(
                context,
                NonAgywPrepVisitConstant.prepPeriodBetweenTestingAndResults,
                days);
            assignInputFieldValue(
                context,
                NonAgywPrepVisitConstant
                    .prepTypeOfPeriodBetweenTestingAndResults,
                'days');
          } else if (periodType == 'minutes') {
            String minutes =
                DateConversionUtil.getMinutesBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(
                context,
                NonAgywPrepVisitConstant.prepPeriodBetweenTestingAndResults,
                minutes);
          } else if (periodType == 'hours') {
            String hours =
                DateConversionUtil.getHoursBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(
                context,
                NonAgywPrepVisitConstant.prepPeriodBetweenTestingAndResults,
                hours);
          } else if (periodType == 'days') {
            String days =
                DateConversionUtil.getDaysBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(
                context,
                NonAgywPrepVisitConstant.prepPeriodBetweenTestingAndResults,
                days);
          } else if (periodType == 'weeks') {
            String weeks =
                DateConversionUtil.getWeeksBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(
                context,
                NonAgywPrepVisitConstant.prepPeriodBetweenTestingAndResults,
                weeks);
          }
        } else {
          assignInputFieldValue(context,
              NonAgywPrepVisitConstant.prepPeriodBetweenTestingAndResults, '0');
          assignInputFieldValue(
              context,
              NonAgywPrepVisitConstant.prepTypeOfPeriodBetweenTestingAndResults,
              'days');
        }
      }
    }
    List<String> fields = ['i0U8S4F3rTa', 'HD5YrKZXzQl'];
    bool shouldShowNameOfFacilityField =
        fields.any((field) => '${dataObject[field]}' == 'true');
    if (!shouldShowNameOfFacilityField) {
      hiddenFields['ZZBWYb9jzHE'] = true;
    }
    hiddenInputFieldOptions['VlLCik7OLHI'] = hiddenOptions;
    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hidddenSectionInputFieldIds = FormUtil.getFormFieldIds(
          allFormSections
              .where((formSection) => formSection.id == sectionId)
              .toList());
      for (String inputFieldId in hidddenSectionInputFieldIds) {
        hiddenFields[inputFieldId] = true;
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
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  static resetValuesForHiddenInputFieldOptions(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setHiddenInputFieldOptions(hiddenInputFieldOptions);
  }

  static resetValuesForHiddenSections(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setHiddenSections(hiddenSections);
  }

  static assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String value,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
