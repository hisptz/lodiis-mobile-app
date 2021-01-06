import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class AgywDreamsEnrollmentSkipLogic {
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
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'qZP982qpSPS') {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue(context, 'ls9hlz2tyol', age.toString());
        if (age >= 9 && age <= 14) {
          // hiddenFields['yU4tNjFpQIq'] = true;
          // hiddenFields['wGFmu7DhNGV'] = true;
          // hiddenFields['G1s75wng5DY'] = true;
          hiddenFields['bkpG276xEk9'] = true;
          hiddenFields['VomsiFza9mn'] = true;
          hiddenFields['NhBs8uAiRPt'] = true;
          // hiddenFields['afatGR9sy5Q'] = true;
          // hiddenFields['yCmbCOTbH3R'] = true;
          hiddenOptions['15-19'] = true;
          hiddenOptions['20-24'] = true;
          hiddenSections['1_M_S_P'] = true;
          hiddenSections['4_N_O_I_C_U'] = true;
          hiddenSections['5_T_S'] = true;
          hiddenSections['6_E_O_S_V'] = true;
          hiddenSections['7_A_U'] = true;
          hiddenSections['7_A_M'] = true;
          hiddenSections['8_O_O_S'] = true;
          hiddenSections['9_O_H'] = true;
          dataObject['s1eRvsL2Ly4'] = 'Single';
        }
        if (age >= 15 && age <= 19) {
          hiddenFields['VsqV6prIfm9'] = true;
          hiddenFields['r0rKJA911ma'] = true;
          hiddenFields['S4yWgL2zp2I'] = true;
          hiddenOptions['20-24'] = true;
          hiddenSections['1_E_H_S'] = true;
          hiddenSections['4_E_O_S_V'] = true;
          hiddenSections['5_E_O_P_E_V'] = true;
          hiddenSections['6_A_U'] = true;
          hiddenSections['7_A_M'] = true;
          hiddenSections['7_O_S'] = true;
          hiddenSections['8_O_H'] = true;
        }
        if (age >= 20 && age <= 24) {
          // hiddenFields['zowQOCZivv8'] = true;
          hiddenFields['VsqV6prIfm9'] = true;
          hiddenFields['r0rKJA911ma'] = true;
          hiddenFields['S4yWgL2zp2I'] = true;
          hiddenFields['afatGR9sy5Q'] = true;
          hiddenFields['yCmbCOTbH3R'] = true;
          hiddenSections['1_E_H_S'] = true;
          hiddenSections['4_E_O_S_V'] = true;
          hiddenSections['5_E_O_P_E_V'] = true;
          hiddenSections['6_A_U'] = true;
          hiddenSections['7_A_U'] = true;
          hiddenSections['7_O_S'] = true;
          hiddenSections['8_O_H'] = true;
        }
        if (age < 9 || age > 11) {
          hiddenFields['x6VFmJLsqgx'] = true;
        }
        if (age >= 9 && age <= 24) {
          assignInputFieldValue(context, 'cifBFSTHgv5', 'true');
        } else {
          assignInputFieldValue(context, 'cifBFSTHgv5', 'false');
        }
        if ((age >= 9 && age <= 17) || (age >= 20 && age <= 24)) {
          if ('${dataObject['Z7PTcgqwCLu']}' == 'true') {
            assignInputFieldValue(context, 'B4ojlzKypUF', 'true');
          } else {
            assignInputFieldValue(context, 'B4ojlzKypUF', '');
          }
        } else {
          assignInputFieldValue(context, 'B4ojlzKypUF', '');
        }
        if (age <= 19 && '${dataObject['GwVHeyOqTv2']}' == 'true') {
          assignInputFieldValue(context, 'AZCVLPzD0Vd', 'true');
        } else if (age > 19 &&
            '${dataObject['GwVHeyOqTv2']}' == 'true' &&
            int.parse(dataObject['q8qPtzanSTU'] != ''
                    ? '${dataObject['q8qPtzanSTU']}'
                    : '0') >
                2) {
          assignInputFieldValue(context, 'AZCVLPzD0Vd', 'true');
        } else {
          assignInputFieldValue(context, 'AZCVLPzD0Vd', '');
        }
      }
      if (inputFieldId == 'oEbOkfQY3NP' && value != 'Other') {
        hiddenFields['ODMyZc2F7uc'] = true;
      }
      if (inputFieldId == 'qTZtbRWe1Hb') {
        if (value != 'true') {
          hiddenFields['TJ5KB6GfZX4'] = true;
        }
        if (value == 'false') {
          assignInputFieldValue(context, 'bApA6X6TVvJ', 'true');
        } else {
          assignInputFieldValue(context, 'bApA6X6TVvJ', '');
        }
      }
      if (inputFieldId == 'qTZtbRWe1Hb' && value != 'false') {
        hiddenFields['OA1dR8a4UWu'] = true;
      }
      if (inputFieldId == 'TJ5KB6GfZX4' && value != 'School') {
        hiddenFields['EQHcFozjbP0'] = true;
      }
      if (inputFieldId == 'Z7PTcgqwCLu' && value != 'true') {
        hiddenFields['FuYyLjYxxkg'] = true;
      }
      if (inputFieldId == 'rsi08hlOFm8') {
        if (value == 'true') {
          assignInputFieldValue(context, 'HJIHPjOf5s1', 'true');
        } else {
          hiddenFields['yU4tNjFpQIq'] = true;
          hiddenFields['zsivYH5qkho'] = true;
          assignInputFieldValue(context, 'HJIHPjOf5s1', '');
        }
      }
      if (inputFieldId == 'fSQY2z3L0lp' && value != 'true') {
        hiddenFields['UzQ533pOnvt'] = true;
        hiddenFields['q8qPtzanSTU'] = true;
        hiddenFields['LNaNh7kvh4X'] = true;
        hiddenFields['S4yWgL2zp2I'] = true;
        hiddenFields['bkpG276xEk9'] = true;
        hiddenFields['AHbtSNH0i7C'] = true;
        hiddenFields['RW9VeyKDvjj'] = true;
        hiddenFields['XYPRtYgQUF8'] = true;
        hiddenFields['SuB4oeLyzZ0'] = true;
        hiddenFields['GDrEW22l54i'] = true;
        hiddenSections['E_M_4_S_A'] = true;
        hiddenSections['4_N_O_I_C_U'] = true;
        hiddenSections['2_H_O_P'] = true;
      }
      if (inputFieldId == 'T3i6bQ3tCaA' && value != 'true') {
        // hiddenFields['ojCwZf1iHOE'] = true;
        hiddenFields['fyIUCi5EUtp'] = true;
        hiddenFields['r0rKJA911ma'] = true;
        hiddenFields['VsqV6prIfm9'] = true;
        hiddenFields['NhBs8uAiRPt'] = true;
        hiddenFields['VomsiFza9mn'] = true;
        hiddenSections['3_STI'] = true;
        hiddenSections['5_T_S'] = true;
      }
      if (inputFieldId == 'fyIUCi5EUtp') {
        if (value != 'true') {
          hiddenFields['x9CWVcy9CZ2'] = true;
          assignInputFieldValue(context, 'rh881j2vfvT', '');
        } else {
          assignInputFieldValue(context, 'rh881j2vfvT', 'true');
        }
      }
      if (inputFieldId == 'LNaNh7kvh4X' && value != 'true') {
        hiddenFields['wGFmu7DhNGV'] = true;
      }
      if (inputFieldId == 'wGFmu7DhNGV' && value != 'true') {
        hiddenFields['G1s75wng5DY'] = true;
      }
      if (inputFieldId == 'bkpG276xEk9') {
        if (value != 'true') {
          hiddenFields['afatGR9sy5Q'] = true;
          hiddenFields['yCmbCOTbH3R'] = true;
          assignInputFieldValue(context, 'iY67qYnywgS', '');
        } else {
          assignInputFieldValue(context, 'iY67qYnywgS', 'true');
        }
      }
      if (inputFieldId == 'fEHah8SvP35' && value != 'true') {
        hiddenFields['uSxDP43mFEG'] = true;
      }
      if (inputFieldId == 'JmiNCIwfZvh' && value != 'Other') {
        hiddenFields['HuGpuXtz673'] = true;
      }
      if (inputFieldId == 'VWtI5ROqFzd' && value != 'Other') {
        hiddenFields['Qiuxkrvq5mH'] = true;
      }
      if (inputFieldId == 'xNx00hrCdWj' && value != 'Other') {
        hiddenFields['B1lYiAi3AQE'] = true;
      }
      if (inputFieldId == 'ghkM8TrpEHr' && value != 'Other') {
        hiddenFields['BwlYnY5isNK'] = true;
      }
      if (inputFieldId == 'iIdrEpTkpsk' && value != 'true') {
        hiddenFields['ovd3lF6epue'] = true;
      }
      if (inputFieldId == 'GGZMeIWhXU9' && value != 'true') {
        hiddenFields['gyQS55npBZ8'] = true;
        hiddenFields['A3pHHLPwpyq'] = true;
      }
      if (inputFieldId == 'gyQS55npBZ8' && value != 'Other') {
        hiddenFields['A3pHHLPwpyq'] = true;
      }
      if (inputFieldId == 'eraVEI3PUF1' && value != 'Yes') {
        hiddenFields['GG0gYqd3Rdt'] = true;
        hiddenFields['w780PZTlVhS'] = true;
      }
      if (inputFieldId == 'GG0gYqd3Rdt' && value != 'Yes') {
        hiddenFields['w780PZTlVhS'] = true;
      }
      if (inputFieldId == 'JTNxMQPT134' && value != 'false') {
        hiddenFields['vpmRiwVyKn2'] = true;
        hiddenFields['nhI53DrKB7u'] = true;
        hiddenFields['BoQ3kawURfW'] = true;
        hiddenFields['JTNxMQPT134_checkboxes'] = true;
        hiddenFields['T0PGSSQXFtV'] = true;
        hiddenFields['IH4Ly0VPRtL'] = true;
        hiddenFields['KFgOeRoncRb'] = true;
      }
      if (inputFieldId == 'IH4Ly0VPRtL' && value != 'Other') {
        hiddenFields['KFgOeRoncRb'] = true;
      }
      if (inputFieldId == 'JTNxMQPT134' && value != 'true') {
        hiddenFields['iQdwzVfZdml'] = true;
        hiddenFields['J6OTM0c1WCV'] = true;
        hiddenFields['aPNGd6RCsY9'] = true;
        hiddenFields['T56nYogWRYq'] = true;
        hiddenFields['h1HeZ2eEkGn'] = true;
        hiddenFields['NGVFqUVSHiU'] = true;
        hiddenFields['JTNxMQPT134_checkboxes_2'] = true;
      }
      if (inputFieldId == 'aPNGd6RCsY9') {
        if (value != 'Other') {
          hiddenFields['T56nYogWRYq'] = true;
        } else if (value != 'Primary level') {
          hiddenFields['h1HeZ2eEkGn'] = true;
        } else if (value != 'Secondary level') {
          hiddenFields['NGVFqUVSHiU'] = true;
        }
      }
      if (inputFieldId == 'vpmRiwVyKn2' && value != 'true') {
        hiddenFields['JDFx7WfZ0Qi'] = true;
      }
      if (inputFieldId == 'TK4WYUEG5UK' && value != 'true') {
        hiddenFields['RiSceJCKIzH'] = true;
        hiddenFields['Gzuxkl4zjrI'] = true;
      }
      if (inputFieldId == 'RiSceJCKIzH' && value != 'Other') {
        hiddenFields['Gzuxkl4zjrI'] = true;
      }
      if (inputFieldId == 'agg0eUd8Wwo' && value != 'true') {
        hiddenFields['jT72rsATBtu'] = true;
        hiddenFields['muAZsONb53n'] = true;
        hiddenFields['bK3G4mIj2wL'] = true;
        hiddenFields['hmtIvw2mKGc'] = true;
        hiddenFields['aQdK3NzB4Xq'] = true;
        hiddenFields['NVhWo52VJaZ'] = true;
      }
      if (inputFieldId == 'muAZsONb53n' && value != 'Positive') {
        hiddenFields['bK3G4mIj2wL'] = true;
        hiddenFields['hmtIvw2mKGc'] = true;
        hiddenFields['aQdK3NzB4Xq'] = true;
      }
      if (inputFieldId == 'agg0eUd8Wwo' && value != 'false') {
        hiddenFields['agg0eUd8Wwo_checkbox'] = true;
        hiddenFields['ErH33FSpFcQ'] = true;
        hiddenFields['fyDiWTn63jY'] = true;
        hiddenFields['eHUHUbqwtmc'] = true;
        hiddenFields['Obxp92Sd0Eo'] = true;
        hiddenFields['xN6adtem2UD'] = true;
        hiddenFields['Vk8oBO8z3yD'] = true;
        hiddenFields['hOmGc8b4FRA'] = true;
        hiddenFields['XWVu7LTxAJZ'] = true;
        hiddenFields['Bf8Wp7c3dJF'] = true;
      }
      if (inputFieldId == 'bK3G4mIj2wL' &&
          value != 'true' &&
          value != 'false') {
        hiddenFields['hmtIvw2mKGc'] = true;
        hiddenFields['aQdK3NzB4Xq'] = true;
      }
      if (inputFieldId == 'bK3G4mIj2wL' && value == 'true') {
        hiddenFields['aQdK3NzB4Xq'] = true;
      }
      if (inputFieldId == 'bK3G4mIj2wL' && value == 'false') {
        hiddenFields['hmtIvw2mKGc'] = true;
      }
      if (inputFieldId == 'XYPRtYgQUF8' && value != 'Yes') {
        hiddenFields['SuB4oeLyzZ0'] = true;
      }
      if (inputFieldId == 'aQdK3NzB4Xq' && value != 'Other') {
        hiddenFields['NVhWo52VJaZ'] = true;
      }
      if (inputFieldId == 'AHbtSNH0i7C' && value != 'true') {
        hiddenFields['RW9VeyKDvjj'] = true;
      }
      if (inputFieldId == 'SuB4oeLyzZ0' && value != 'true') {
        hiddenFields['GDrEW22l54i'] = true;
      }
      if (inputFieldId == 'Gs4ArB4ToX5' && value != 'true') {
        hiddenFields['Gs4ArB4ToX5_checkbox'] = true;
        hiddenFields['jIlNVicSnqS'] = true;
        hiddenFields['L4qhaxocyu4'] = true;
        hiddenFields['PJHUhZt3YC7'] = true;
        hiddenFields['iYyKrzKvF9i'] = true;
        hiddenFields['u4PdP8HWVrs'] = true;
        hiddenFields['XR1QhO62Zm9'] = true;
        hiddenFields['qjFPwTWaHhx'] = true;
      }
      if (inputFieldId == 'i32OwNqUYRn' && value != 'true') {
        hiddenFields['ClDEtAAqDPI'] = true;
      }
      if (inputFieldId == 'NgIDtgfZMVH' && value != 'true') {
        hiddenFields['gY0nOLnR3eh'] = true;
      }
      if (inputFieldId == 'KNqzbD65UrN' && value != 'true') {
        hiddenFields['OZqIvrzGBFK'] = true;
      }
      if (inputFieldId == 'Zmt7PefVzk4' && value != 'true') {
        hiddenFields['iLX2uQ4ZXM0'] = true;
      }
      if (inputFieldId == 'NOJbkKuHccD' && value != 'true') {
        hiddenFields['GdsRvY5lHCU'] = true;
      }
      if (inputFieldId == 'mvPAYFoFQcW' && value != 'true') {
        hiddenFields['RO2RIidPOqK'] = true;
      }
      if (inputFieldId == 'WwTI82dbYIc' && value != 'true') {
        hiddenFields['CU4HyDp6XO0'] = true;
      }
      if (inputFieldId == 'bBVCUqsdfL3' && value != 'true') {
        hiddenFields['NP7LbypO3li'] = true;
      }
      if (inputFieldId == 'ZcfLYz7JlVo' && value != 'true') {
        hiddenFields['ZcfLYz7JlVo_checkbox'] = true;
        hiddenFields['prTJovIPAKu'] = true;
        hiddenFields['ABZxvJiwxzk'] = true;
        hiddenFields['bSV7DYAysFT'] = true;
        hiddenFields['DzQ8pTNwsoA'] = true;
        hiddenFields['ydSybWoOk93'] = true;
        hiddenFields['U5MaBVRWZTu'] = true;
        hiddenFields['fq9YW2mfHhx'] = true;
        hiddenFields['NOZhaj68naE'] = true;
        hiddenFields['YaP6i0e5ksq'] = true;
        hiddenFields['OnrjChs6Pzg'] = true;
      }
      if (inputFieldId == 'H2Az2c3MeAy' && value != 'true') {
        hiddenFields['H2Az2c3MeAy_checkbox'] = true;
        hiddenFields['dXKzcRop0YS'] = true;
        hiddenFields['K5NF7rk4RYa'] = true;
        hiddenFields['u3IjpFje21i'] = true;
        hiddenFields['JWuFSdMrZXy'] = true;
        hiddenFields['oWcT4kzD78y'] = true;
        hiddenFields['zhumM3lBA8J'] = true;
        hiddenFields['k53fDCE7BHI'] = true;
        hiddenFields['COJIywvGzco'] = true;
        hiddenFields['fJzsO0ADn85'] = true;
        hiddenFields['OFJD1RNGEZu'] = true;
      }
      if (inputFieldId == 'QaIUtFdgdIa' && value != 'true') {
        hiddenFields['JSBixuSLIC5'] = true;
      }
      if (inputFieldId == 'o9tReELSzRN' && value != 'true') {
        hiddenFields['wfb1pQ1odtz'] = true;
        hiddenFields['YSAyCyGWCaK'] = true;
      }

      if (inputFieldId == 'sNLZwEeOdZe' && value != 'true') {
        hiddenFields['FamilyPlanningOptions'] = true;
        hiddenFields['EuH6l8V4sXm'] = true;
      }
      if (inputFieldId == 'sNLZwEeOdZe' && value != 'false') {
        hiddenFields['HyT7FrFWRyH'] = true;
        hiddenFields['pq5LEMAI1EX'] = true;
      }
      if (inputFieldId == 'HyT7FrFWRyH' && value != 'Other') {
        hiddenFields['pq5LEMAI1EX'] = true;
      }
      if (inputFieldId == 'Dclkscej6HW') {
        if (value == 'true') {
          assignInputFieldValue(context, 'yc3BlUIEup3', 'true');
        } else {
          assignInputFieldValue(context, 'yc3BlUIEup3', '');
        }
      }
      if (inputFieldId == 'fVJfCtBVjan') {
        if (value == 'true') {
          assignInputFieldValue(context, 'yc3BlUIEup3', 'true');
        } else {
          assignInputFieldValue(context, 'yc3BlUIEup3', '');
        }
      }
      if (inputFieldId == 'NhBs8uAiRPt') {
        if (value == 'true') {
          assignInputFieldValue(context, 'p33MrrhsQRz', 'true');
        } else {
          assignInputFieldValue(context, 'p33MrrhsQRz', '');
        }
      }
    }
    hiddenInputFieldOptions['UzQ533pOnvt'] = hiddenOptions;
    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hidddenSectionInputFieldIds = FormUtil.getFormFieldIds(allFormSections
          .where((formSection) => formSection.id == sectionId)
          .toList());
      List<String> allInputFieldIds = FormUtil.getFormFieldIds(allFormSections
          .where((formSection) => formSection.id != sectionId)
          .toList());
      
      for (String inputFieldId in hidddenSectionInputFieldIds) {
        if (allInputFieldIds.indexOf(inputFieldId) == -1) {
          hiddenFields[inputFieldId] = true;
        }
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
