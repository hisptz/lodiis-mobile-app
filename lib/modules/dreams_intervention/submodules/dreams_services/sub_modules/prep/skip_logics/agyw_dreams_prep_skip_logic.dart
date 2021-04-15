import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/date_conversion_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/constants/prep_intake_constant.dart';
import 'package:provider/provider.dart';

class AgywDreamsPrepSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();
// fields to not be cleared when hidden
  static List skippedFields = ['WeaVsrFcWne', 'RqWMrqUcDqv', 'gCvMVscBNfk'];

  static Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);

    // assing Rapid test result
    if (dataObject[AgywDreamsHTSLongFormConstant.t1Result] == null &&
        dataObject[AgywDreamsHTSLongFormConstant.t2Result] == null) {
      hiddenFields[PrepIntakeConstant.prepRapidTestResult1] = true;
      hiddenFields[PrepIntakeConstant.prepRapidTestResult2] = true;
      hiddenFields[PrepIntakeConstant.prepRapidTestResult3] = true;
      hiddenFields[PrepIntakeConstant.dateBled1] = true;
      hiddenFields[PrepIntakeConstant.dateBled2] = true;
      hiddenFields[PrepIntakeConstant.dateBled3] = true;
    } else if (dataObject[AgywDreamsHTSLongFormConstant.t1Result] == null) {
      hiddenFields[PrepIntakeConstant.prepRapidTestResult1] = true;
      hiddenFields[PrepIntakeConstant.prepRapidTestResult3] = true;
      hiddenFields[PrepIntakeConstant.dateBled3] = true;
      hiddenFields[PrepIntakeConstant.dateBled1] = true;
      dataObject[PrepIntakeConstant.prepRapidTestResult2] =
          dataObject[AgywDreamsHTSLongFormConstant.t2Result];
    } else if (dataObject[AgywDreamsHTSLongFormConstant.t2Result] == null) {
      hiddenFields[PrepIntakeConstant.prepRapidTestResult2] = true;
      hiddenFields[PrepIntakeConstant.prepRapidTestResult3] = true;
      hiddenFields[PrepIntakeConstant.dateBled3] = true;
      hiddenFields[PrepIntakeConstant.dateBled2] = true;
      dataObject[PrepIntakeConstant.prepRapidTestResult1] =
          dataObject[AgywDreamsHTSLongFormConstant.t1Result];
    } else {
      dataObject[PrepIntakeConstant.prepRapidTestResult1] =
          dataObject[AgywDreamsHTSLongFormConstant.t1Result];
      dataObject[PrepIntakeConstant.prepRapidTestResult2] =
          dataObject[AgywDreamsHTSLongFormConstant.t2Result];
      hiddenFields[PrepIntakeConstant.prepRapidTestResult3] = true;
      hiddenFields[PrepIntakeConstant.dateBled3] = true;
    }

    dataObject[PrepIntakeConstant.clientWeight] =
        dataObject[AgywDreamsHTSLongFormConstant.weight];
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';

      if (inputFieldId == 'vNyGPa7FbQm' && value != 'true') {
        hiddenFields['y7lRj3QSDkn'] = true;
        hiddenFields['de4zcWiZB5j'] = true;
        hiddenFields['UL0xa3Sz9ML'] = true;
      }
      if (inputFieldId == 'D26taDdz4YO') {
        if (dataObject['FclxLnBHILO'] == 'Primary') {
          dataObject[inputFieldId] = 'Less than Standard 7';
        } else if (dataObject['FclxLnBHILO'] == 'Secondary school') {
          dataObject[inputFieldId] = 'Secondary School';
        } else if (dataObject['FclxLnBHILO'] == 'High school') {
          dataObject[inputFieldId] = 'High School';
        } else if (dataObject['FclxLnBHILO'] == 'None') {
          dataObject[inputFieldId] = 'None';
        }
      }
      if (inputFieldId == 'Jhp451oeYyB' && value != 'true') {
        hiddenFields['p9AA21uFn2n'] = true;
        hiddenFields['Y0QGNDBCEbz'] = true;
      }
      if (inputFieldId == 'JflxahjBLrH' && value != 'true') {
        hiddenFields['PqSjDmu2eMy'] = true;
      }
      if (inputFieldId == 'F42UdUKO75Z' && value != 'true') {
        hiddenFields['ukX9y6lXpNo'] = true;
      }
      if (inputFieldId == 'kTHUZ8SOSXK' && value != 'true') {
        hiddenFields['aXAPMYFxMFC'] = true;
      }
      if (inputFieldId == 'm8BvcCfyxQS' && value != 'true') {
        hiddenFields['V99TfoAmnpE'] = true;
      }
      if (inputFieldId == 'IrJBisQbxi6' && value != 'true') {
        hiddenFields['XnVcJkyoobx'] = true;
        hiddenFields['sUyz3SX93IM'] = true;
        hiddenFields['D1ukXCpeU0K'] = true;
      }
      if (inputFieldId == 'U0E4mb8dSQN' && value == '0') {
        dataObject['RZflOV27PW4'] = 'false';
      }
      if (inputFieldId == 'kQULFUqgab0' && value != '1') {
        hiddenFields['WsZMwXWcHly'] = true;
      }
      if ((inputFieldId == 'Syuc71VFOuO' && value != '1') &&
          dataObject['meLwdeoU4Ei'] != '1') {
        hiddenFields['zs5TJVoHg9j'] = true;
      }
      if ((inputFieldId == 'meLwdeoU4Ei' && value != '1') &&
          dataObject['Syuc71VFOuO'] != '1') {
        hiddenFields['zs5TJVoHg9j'] = true;
      }
      //Assign Site name to Facility name
      // if (inputFieldId == 'BrcTtRhrxXp') {
      //   dataObject['BrcTtRhrxXp'] = dataObject['lQ8XDsy6M6y'];
      // }
      //Substantial Risk and Eligibility
      if (inputFieldId == 'pQaAQdJnE1w' && value != 'Yes') {
        hiddenFields['DobfAIMBOvy'] = true;
      }
      // Assign HIV results
      if (inputFieldId == 'veoA322323t') {
        if (dataObject[AgywDreamsHTSLongFormConstant.hivResultStatus] ==
            'Negative') {
          dataObject[inputFieldId] = 'true';
        } else {
          dataObject[inputFieldId] = 'false';
        }
      }
      // Assign type of test used
      // if (inputFieldId == '') {}
      // Assign date tested
      if (inputFieldId == 'vMR9VtzuH3R') {
        dataObject[inputFieldId] =
            '${AppUtil.formattedDateTimeIntoString(DateTime.now())}';
      }
      if (inputFieldId == 'O8Fz5EWOOzU' && value != 'true') {
        hiddenFields['KLxWrSRAXfY'] = true;
      }

      // if (inputFieldId == 'rDV6sBIwivl' && value != 'true') {
      //   hiddenSections['PeSfSRaE'] = true;
      //   hiddenSections['BsLnIfmtn'] = true;
      // }

      if (inputFieldId == 'li1EJgHzWtV' && value != 'Other') {
        hiddenFields['GrChAWBTqTc'] = true;
      }
      if (inputFieldId == 'li1EJgHzWtV' && value == 'Never married') {
        hiddenFields['B1wgf8qa8a6'] = true;
      }

      if (inputFieldId == 'kK8Gt6LA8QM' && value != 'Other') {
        hiddenFields['gufQ1ELVqcS'] = true;
      }
      if (inputFieldId == 'qgNIIJBeMBT' && value != 'Other') {
        hiddenFields['gDlQ3IThgzH'] = true;
      }
      if (inputFieldId == 'bZ8fTvAhdMS' && value != 'true') {
        hiddenFields['UL1Pq6sgvr2'] = true;
      }
      if (inputFieldId == 'ov7UEdiyjJA' && value != 'true') {
        hiddenFields['dpfubDzhwhX'] = true;
      }

      if (inputFieldId == 'veoA322323t' &&
          !((value == 'true' && dataObject['bH9DpJOIutM'] == 'true') ||
              value != dataObject['bH9DpJOIutM'])) {
        hiddenSections['BsLnIfmtn'] = true;
      }
      if (inputFieldId == 'bH9DpJOIutM' &&
          !((value == 'true' && dataObject['veoA322323t'] == 'true') ||
              value != dataObject['veoA322323t'])) {
        hiddenSections['BsLnIfmtn'] = true;
      }
      if (inputFieldId == 'Jhp451oeYyB') {
        if (dataObject['UlombfpCloG'] == 'Couple') {
          assignInputFieldValue(context, inputFieldId, 'true');
        } else if (dataObject['UlombfpCloG'] == 'Individual') {
          assignInputFieldValue(context, inputFieldId, 'false');
        } else {
          assignInputFieldValue(context, inputFieldId, null);
        }
      }
      if ((inputFieldId == 'lMVSLtbHoT3' && value != 'Other') &&
          dataObject['BMqPyVMC6fT'] != 'Community program') {
        hiddenFields['uPpYQM3rAZ2'] = true;
      }

      if (inputFieldId == 'FHlLCE5NcRE' && value != 'true') {
        hiddenFields['mYjT1FB8tQ8'] = true;
      }

      if (inputFieldId == 'wig4mkuYyPe' && value != 'true') {
        hiddenFields['rBnPHOouOpm'] = true;
      }

      if (inputFieldId == 'dTFwww2Lcbh' && value != 'true') {
        hiddenFields['dTFwww2Lcbh_checkbox'] = true;
      }

      if (inputFieldId == 'OlDYLVf0bRA' && value != 'Other') {
        hiddenFields['UL1Pq6sgvr2'] = true;
      }
      if (inputFieldId == 'de4zcWiZB5j' && value != 'Other') {
        hiddenFields['y7lRj3QSDkn'] = true;
      }
      if (inputFieldId == 'de4zcWiZB5j' && value != 'New HIV diagnosis') {
        hiddenFields['QInz3UAj6zC'] = true;
        hiddenFields['R63XVONUFeG'] = true;
      }
      // Assign period between testing and results
      if (inputFieldId ==
              PrepIntakeConstant.prepPeriodBetweenTestingAndResults &&
          dataObject[PrepIntakeConstant.clientInformedOfTestResults] != null) {
        bool hasTestDate = true;
        DateTime resultDate = DateTime.parse(
            '${dataObject[PrepIntakeConstant.clientInformedOfTestResults]}');
        DateTime testDate;
        if (dataObject[PrepIntakeConstant.dateBled3] != '' &&
            dataObject[PrepIntakeConstant.dateBled3] != null) {
          testDate =
              DateTime.parse('${dataObject[PrepIntakeConstant.dateBled3]}');
        } else if (dataObject[PrepIntakeConstant.dateBled2] != '' &&
            dataObject[PrepIntakeConstant.dateBled2] != null) {
          testDate =
              DateTime.parse('${dataObject[PrepIntakeConstant.dateBled2]}');
        } else if (dataObject[PrepIntakeConstant.dateBled1] != '' &&
            dataObject[PrepIntakeConstant.dateBled1] != null) {
          testDate =
              DateTime.parse('${dataObject[PrepIntakeConstant.dateBled1]}');
        } else {
          hasTestDate = false;
        }

        if (hasTestDate) {
          String periodType = dataObject[PrepIntakeConstant
                  .prepTypeOfPeriodBetweenTestingAndResults] ??
              '';
          if (periodType == '') {
            String days =
                DateConversionUtil.getDaysBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(context,
                PrepIntakeConstant.prepPeriodBetweenTestingAndResults, days);
            assignInputFieldValue(
                context,
                PrepIntakeConstant.prepTypeOfPeriodBetweenTestingAndResults,
                'days');
          } else if (periodType == 'minutes') {
            String minutes =
                DateConversionUtil.getMinutesBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(context,
                PrepIntakeConstant.prepPeriodBetweenTestingAndResults, minutes);
          } else if (periodType == 'hours') {
            String hours =
                DateConversionUtil.getHoursBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(context,
                PrepIntakeConstant.prepPeriodBetweenTestingAndResults, hours);
          } else if (periodType == 'days') {
            String days =
                DateConversionUtil.getDaysBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(context,
                PrepIntakeConstant.prepPeriodBetweenTestingAndResults, days);
          } else if (periodType == 'weeks') {
            String weeks =
                DateConversionUtil.getWeeksBetweenTestingAndInformedResult(
                    testDate, resultDate);
            assignInputFieldValue(context,
                PrepIntakeConstant.prepPeriodBetweenTestingAndResults, weeks);
          }
        } else {
          assignInputFieldValue(context,
              PrepIntakeConstant.prepPeriodBetweenTestingAndResults, '0');
          assignInputFieldValue(
              context,
              PrepIntakeConstant.prepTypeOfPeriodBetweenTestingAndResults,
              'days');
        }
      }
    }
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
    resetValuesForHiddenSections(context, formSections);
  }

  static resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId] && !skippedFields.contains(inputFieldId)) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
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
    String value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
