import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';

mixin OvcCasePlanFollowUpSkipLogic {
  Map hiddenFields = Map();
  Map hiddenSections = Map();
  Map childMapObject = Map();

  Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();

    for (String inputFieldId in inputFieldIds) {
      hiddenFields[inputFieldId] = true;
    }

    //@TODO adding skip logics for session numbers
    dataObject.forEach((key, value) {
      if (key == 'ylSjcj6cv42' && value == 'true') {
        hiddenFields['YFgrURiwirq'] = false;
        var inputValue = '${dataObject['YFgrURiwirq']}';
        if (inputValue == 'true') {
          hiddenFields['LtiZFxXw0Wc'] = false;
          hiddenFields['i9icxSZ8HCf'] = false;
          hiddenFields['BOuCiVoZ7sT'] = false;
        }
      } else if (key == 'XoSPWmpWXCy' && value == 'true') {
        hiddenFields['JnqldNamliR'] = false;
        var inputValue = '${dataObject['JnqldNamliR']}';
        if (inputValue == 'true') {
          hiddenFields['KDSYFiIefGN'] = false;
          hiddenFields['CNnzifTDF5a'] = false;
          hiddenFields['sxlVgySosg3'] = false;
          hiddenFields['UQKbbPTRaB8'] = false;
        }
      } else if (key == 'Fmsfd0cXF5w' && value == 'true') {
        hiddenFields['HzI5X2yHef6'] = false;
        var inputValue = '${dataObject['HzI5X2yHef6']}';
        if (inputValue == 'true') {
          hiddenFields['GyG2HcLsVka'] = false;
          hiddenFields['y8ToqnbVz1o'] = false;
          hiddenFields['uU4TvD2O1uL'] = false;
        }
      } else if (key == 'AxtahhoHcXV' && value == 'true') {
        hiddenFields['eqhzeRBMftZ'] = false;
        var inputValue = '${dataObject['eqhzeRBMftZ']}';
        if (inputValue == 'true') {
          hiddenFields['F8x8QAoFQBO'] = false;
          hiddenFields['AStxMCkJhi5'] = false;
          hiddenFields['ze0vffQrd1R'] = false;
        }
      } else if (key == 'd2vXxEPeCq7' && value == 'true') {
        hiddenFields['ESIjwQ9S6Ic'] = false;
        var inputValue = '${dataObject['ESIjwQ9S6Ic']}';
        if (inputValue == 'true') {
          hiddenFields['EYv3aMwJOUN'] = false;
          hiddenFields['GISFLEttRtU'] = false;
          hiddenFields['jR2yBxtyPRa'] = false;
        }
      } else if (key == 'dTFLFtUUeEK' && value == 'true') {
        hiddenFields['r8wPQAog7PJ'] = false;
        var inputValue = '${dataObject['r8wPQAog7PJ']}';
        if (inputValue == 'true') {
          hiddenFields['EgbO5h9cs5D'] = false;
          hiddenFields['itTgPQ0OrMU'] = false;
          hiddenFields['zzH8cEeSDFz'] = false;
        }
      } else if (key == 'Hvq9oisH7Gt' && value == 'true') {
        hiddenFields['gV77yUM8NK8'] = false;
        var inputValue = '${dataObject['gV77yUM8NK8']}';
        if (inputValue == 'true') {
          hiddenFields['aqJBZDBzh4m'] = false;
          hiddenFields['JFlnkaXlXm5'] = false;
          hiddenFields['EtENRPlSnO0'] = false;
        }
      } else if (key == 'qTf8VSoojJ2' && value == 'true') {
        hiddenFields['qL9c5r7c6kK'] = false;
        var inputValue = '${dataObject['qL9c5r7c6kK']}';
        if (inputValue == 'true') {
          hiddenFields['pUphS6E1Gu5'] = false;
          hiddenFields['SODPuEmHEGV'] = false;
          hiddenFields['k5RGRpWRbbs'] = false;
        }
      } else if (key == 'DQxqyncQtwm' && value == 'true') {
        hiddenFields['FRWCmEerPic'] = false;
        var inputValue = '${dataObject['FRWCmEerPic']}';
        if (inputValue == 'true') {
          hiddenFields['lQYnoeqfKpe'] = false;
          hiddenFields['w4EYZpbtUV8'] = false;
          hiddenFields['cBCJAB8Ogxd'] = false;
        }
      } else if (key == 'e6NV2ZAzFEh' && value == 'true') {
        hiddenFields['xTO562B5g53'] = false;
        var inputValue = '${dataObject['xTO562B5g53']}';
        if (inputValue == 'true') {
          hiddenFields['uOMr56xoKDh'] = false;
          hiddenFields['hMdC0CMKSGn'] = false;
          hiddenFields['SzDHpqzsiLw'] = false;
        }
      } else if (key == 'kvF996ugmMl' && value == 'true') {
        hiddenFields['lpTVK3t1Ahk'] = false;
        var inputValue = '${dataObject['lpTVK3t1Ahk']}';
        if (inputValue == 'true') {
          hiddenFields['j1yzHzO0w6w'] = false;
          hiddenFields['QnfPxpJvb1D'] = false;
          hiddenFields['KvHf0rBfa1L'] = false;
        }
      } else if (key == 'iiJpQsEE4qx' && value == 'true') {
        hiddenFields['kcoDiGNXWpA'] = false;
        var inputValue = '${dataObject['kcoDiGNXWpA']}';
        if (inputValue == 'true') {
          hiddenFields['qwmtkJDotBk'] = false;
          hiddenFields['giA7cceTW8w'] = false;
          hiddenFields['Z6VwHVRIh48'] = false;
        }
      } else if (key == 'ithLHgsAoxs' && value == 'true') {
        hiddenFields['fgDPoYtifQI'] = false;
        var inputValue = '${dataObject['fgDPoYtifQI']}';
        if (inputValue == 'true') {
          hiddenFields['lbCCs00yuGQ'] = false;
          hiddenFields['TNmg7uRUWgC'] = false;
          hiddenFields['kehmVw8hmos'] = false;
        }
      } else if (key == 'JqGGsDlZh8T' && value == 'true') {
        hiddenFields['cbqS6IoSbwI'] = false;
        var inputValue = '${dataObject['cbqS6IoSbwI']}';
        if (inputValue == 'true') {
          hiddenFields['zKkaaSt1c8V'] = false;
          hiddenFields['KpUgwivl5Cr'] = false;
          hiddenFields['iwuAHCCxe5m'] = false;
        }
      } else if (key == 'WrjNxZBVHCL' && value == 'true') {
        hiddenFields['lEkrLOFmLrH'] = false;
        var inputValue = '${dataObject['lEkrLOFmLrH']}';
        if (inputValue == 'true') {
          hiddenFields['F8ALMOcc6C1'] = false;
          hiddenFields['p77CBdxxtHI'] = false;
          hiddenFields['ereN7hP7yuT'] = false;
        }
      } else if (key == 'PoxYSqq8Hgz' && value == 'true') {
        hiddenFields['gwwUOs6yt6C'] = false;
        var inputValue = '${dataObject['gwwUOs6yt6C']}';
        if (inputValue == 'true') {
          hiddenFields['w2HlBCfHbZR'] = false;
          hiddenFields['aG42nUguLLW'] = false;
          hiddenFields['n30r7v0ti1s'] = false;
        }
      } else if (key == 'aPmPhwm8Zln' && value == 'true') {
        hiddenFields['rMtSykWZ4HB'] = false;
        var inputValue = '${dataObject['rMtSykWZ4HB']}';
        if (inputValue == 'true') {
          hiddenFields['qwnfgBG2web'] = false;
          hiddenFields['OMhFxj6SYhM'] = false;
          hiddenFields['YPImSLRMLWH'] = false;
        }
      } else if (key == 'Vd8dV7OweWB' && value == 'true') {
        hiddenFields['cuy4Ai7mBbA'] = false;
        var inputValue = '${dataObject['cuy4Ai7mBbA']}';
        if (inputValue == 'true') {
          hiddenFields['C5bhgqcq6Qn'] = false;
          hiddenFields['h10Iktl4KKR'] = false;
          hiddenFields['sONWFapy6yk'] = false;
        }
      } else if (key == 'Ccp4Odlh3BE' && value == 'true') {
        hiddenFields['ysDSdiL7wNx'] = false;
        var inputValue = '${dataObject['ysDSdiL7wNx']}';
        if (inputValue == 'true') {
          hiddenFields['pBVmFpsSGN7'] = false;
          hiddenFields['XUoqvbk0uVH'] = false;
          hiddenFields['LkQxvdt6YCw'] = false;
        }
      } else if (key == 'AaqeRcyjbyS' && value == 'true') {
        hiddenFields['QDFZ03HbjGj'] = false;
        var inputValue = '${dataObject['QDFZ03HbjGj']}';
        if (inputValue == 'true') {
          hiddenFields['Dw1xLXILErU'] = false;
          hiddenFields['KWk8waoLO7N'] = false;
          hiddenFields['P4PMMDgWCSA'] = false;
        }
      } else if (key == 'yf6KmY3Rm5I' && value == 'true') {
        hiddenFields['UZJ9vqIabAY'] = false;
        var inputValue = '${dataObject['UZJ9vqIabAY']}';
        if (inputValue == 'true') {
          hiddenFields['pGDK3Y7tN2B'] = false;
          hiddenFields['U8h0daQzXXk'] = false;
          hiddenFields['Gs4XVviJB3r'] = false;
        }
      } else if (key == 'WdZ3PnW5yV6' && value == 'true') {
        hiddenFields['gfKsz88uxtg'] = false;
        var inputValue = '${dataObject['gfKsz88uxtg']}';
        if (inputValue == 'true') {
          hiddenFields['P06od0qmlSR'] = false;
          hiddenFields['iz4CvIFovsF'] = false;
          hiddenFields['NwtohlveKHW'] = false;
        }
      } else if (key == 'hS7aONLz2cq' && value == 'true') {
        hiddenFields['aGChpBlIzcd'] = false;
        var inputValue = '${dataObject['aGChpBlIzcd']}';
        if (inputValue == 'true') {
          hiddenFields['AXLxNo9pz8c'] = false;
          hiddenFields['cb773khL7XB'] = false;
          hiddenFields['RTEBrgDTe02'] = false;
        }
      } else if (key == 'TQSMaZgfZPO' && value == 'true') {
        hiddenFields['EYhFIkTpUS3'] = false;
        var inputValue = '${dataObject['EYhFIkTpUS3']}';
        if (inputValue == 'true') {
          hiddenFields['rM13n9K4vE7'] = false;
          hiddenFields['VlReEXXH1WN'] = false;
          hiddenFields['uVd1sxrd6C7'] = false;
        }
      } else if (key == 'SN2kJN3jAG9' && value == 'true') {
        hiddenFields['IiKUlAeSIE3'] = false;
        var inputValue = '${dataObject['IiKUlAeSIE3']}';
        if (inputValue == 'true') {
          hiddenFields['rUCb6Afcz9U'] = false;
          hiddenFields['sD0zbIksKTY'] = false;
          hiddenFields['p8Ha7w4plCe'] = false;
        }
      } else if (key == 'X47zxNAqMv0' && value == 'true') {
        hiddenFields['hg2bpp1HqwU'] = false;
        var inputValue = '${dataObject['hg2bpp1HqwU']}';
        if (inputValue == 'true') {
          hiddenFields['wB2jXLTYtDb'] = false;
          hiddenFields['Riyr0nniCVo'] = false;
          hiddenFields['cuLeuQsq7ZG'] = false;
        }
      } else if (key == 'cx4xBY4jZXM' && value == 'true') {
        hiddenFields['HzI5X2yHef6'] = false;
        var inputValue = '${dataObject['HzI5X2yHef6']}';
        if (inputValue == 'true') {
          hiddenFields['GyG2HcLsVka'] = false;
          hiddenFields['y8ToqnbVz1o'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'yJQi4cbzeBF' && value == 'true') {
        hiddenFields['BYu8pI5kGXF'] = false;
        var inputValue = '${dataObject['BYu8pI5kGXF']}';
        if (inputValue == 'true') {
          hiddenFields['u8r8p0a3JqU'] = false;
          hiddenFields['W5lbgijaXA6'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'x4yAqv4z2Xv' && value == 'true') {
        hiddenFields['UKczyQWCB0L'] = false;
        var inputValue = '${dataObject['UKczyQWCB0L']}';
        if (inputValue == 'true') {
          hiddenFields['jsEr16lnber'] = false;
          hiddenFields['wZLjymsKsuj'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'AM9oJCOHM7f' && value == 'true') {
        hiddenFields['KkqMjxjAR7g'] = false;
        var inputValue = '${dataObject['KkqMjxjAR7g']}';
        if (inputValue == 'true') {
          hiddenFields['gYAZrh9o1DB'] = false;
          hiddenFields['Jxlug5I3kdu'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'hJUuQ648wVF' && value == 'true') {
        hiddenFields['mRoO7kgpgVg'] = false;
        var inputValue = '${dataObject['mRoO7kgpgVg']}';
        if (inputValue == 'true') {
          hiddenFields['CIRXgKGOmSI'] = false;
          hiddenFields['YSsfKXdIRLG'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'BJrrrqQqwQO' && value == 'true') {
        hiddenFields['GNQ3gDA2CTI'] = false;
        var inputValue = '${dataObject['GNQ3gDA2CTI']}';
        if (inputValue == 'true') {
          hiddenFields['oTSVSO3iHTk'] = false;
          hiddenFields['aDOvfQ1wdIX'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'LswSBpMoG5C' && value == 'true') {
        hiddenFields['gSp9bgPW52L'] = false;
        var inputValue = '${dataObject['gSp9bgPW52L']}';
        if (inputValue == 'true') {
          hiddenFields['fVpcWBp0Ngp'] = false;
          hiddenFields['pSkl6ibruvU'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'gCKoJgBFdob' && value == 'true') {
        hiddenFields['mY7GqOTKtsQ'] = false;
        var inputValue = '${dataObject['mY7GqOTKtsQ']}';
        if (inputValue == 'true') {
          hiddenFields['h6obb1v1stw'] = false;
          hiddenFields['kBivIQr6mrW'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'JSQ3xP1NhuN' && value == 'true') {
        hiddenFields['zK7kMYpgPQn'] = false;
        var inputValue = '${dataObject['zK7kMYpgPQn']}';
        if (inputValue == 'true') {
          hiddenFields['GtejBpkVvtD'] = false;
          hiddenFields['g2X9vUL2d9m'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'AwWKp6KmqgY' && value == 'true') {
        hiddenFields['tnspdPfpuXm'] = false;
        var inputValue = '${dataObject['tnspdPfpuXm']}';
        if (inputValue == 'true') {
          hiddenFields['V1HnY5m2Pmv'] = false;
          hiddenFields['eXh6Gag1uwp'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'EaJTFrklMo5' && value == 'true') {
        hiddenFields['QnFYeBNZlbf'] = false;
        var inputValue = '${dataObject['QnFYeBNZlbf']}';
        if (inputValue == 'true') {
          hiddenFields['EnrZPBFxZuX'] = false;
          hiddenFields['xdI5atw8DC4'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'HsxFZOuV4oZ' && value == 'true') {
        hiddenFields['KvLYMr8F4vg'] = false;
        var inputValue = '${dataObject['KvLYMr8F4vg']}';
        if (inputValue == 'true') {
          hiddenFields['hnMy2l2pB3z'] = false;
          hiddenFields['TN5r1EFmHWz'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'yPP7lkomNfK' && value == 'true') {
        hiddenFields['AnnOS2m6LZK'] = false;
        var inputValue = '${dataObject['AnnOS2m6LZK']}';
        if (inputValue == 'true') {
          hiddenFields['UHWzhDsQdoB'] = false;
          hiddenFields['xECpX8Vt1rT'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'uQiyym8SEvd' && value == 'true') {
        hiddenFields['RNKOtUtLT4c'] = false;
        var inputValue = '${dataObject['RNKOtUtLT4c']}';
        if (inputValue == 'true') {
          hiddenFields['sa79KxTFGFA'] = false;
          hiddenFields['EB3JPVqMdb4'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'WiPTQhWLVU1' && value == 'true') {
        hiddenFields['GImA3HB9YK5'] = false;
        var inputValue = '${dataObject['GImA3HB9YK5']}';
        if (inputValue == 'true') {
          hiddenFields['fFuabYbLUjz'] = false;
          hiddenFields['IFggJCXLYPD'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'neF08iYV9Os' && value == 'true') {
        hiddenFields['Fj2RbXsb8Yj'] = false;
        var inputValue = '${dataObject['Fj2RbXsb8Yj']}';
        if (inputValue == 'true') {
          hiddenFields['f90c5olxs5Z'] = false;
          hiddenFields['EPwDypaz61A'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'GO3Ojp1UEX7' && value == 'true') {
        hiddenFields['vj0R7ySdigX'] = false;
        var inputValue = '${dataObject['vj0R7ySdigX']}';
        if (inputValue == 'true') {
          hiddenFields['yW0TrzEslYO'] = false;
          hiddenFields['tmi1jtKYZs0'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'exHDkX1gPiC' && value == 'true') {
        hiddenFields['JlRnllAlSk0'] = false;
        var inputValue = '${dataObject['JlRnllAlSk0']}';
        if (inputValue == 'true') {
          hiddenFields['VlOw6vrLsp5'] = false;
          hiddenFields['ONC3bpjq525'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'Cb8qzfdrg7d' && value == 'true') {
        hiddenFields['LcIB5EL3IjT'] = false;
        var inputValue = '${dataObject['LcIB5EL3IjT']}';
        if (inputValue == 'true') {
          hiddenFields['zYrrrFd48S5'] = false;
          hiddenFields['WVsVwfErZ7V'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'qraZh4n14S4' && value == 'true') {
        hiddenFields['fvgPnlOD7e9'] = false;
        var inputValue = '${dataObject['fvgPnlOD7e9']}';
        if (inputValue == 'true') {
          hiddenFields['JFetYCY5tza'] = false;
          hiddenFields['yuwtSD8EyoY'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'TdReJf2LTXA' && value == 'true') {
        hiddenFields['MeMaUvt3O8j'] = false;
        var inputValue = '${dataObject['MeMaUvt3O8j']}';
        if (inputValue == 'true') {
          hiddenFields['KZIjTeMl7sj'] = false;
          hiddenFields['KppYygPZ8BL'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'q2N7p3UbvSF' && value == 'true') {
        hiddenFields['WQlWXUmYjI2'] = false;
        var inputValue = '${dataObject['WQlWXUmYjI2']}';
        if (inputValue == 'true') {
          hiddenFields['gAMv1jxS0rh'] = false;
          hiddenFields['CxREUNzKxHB'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'NcMANzhhphO' && value == 'true') {
        hiddenFields['Zc0M1jsbfyA'] = false;
        var inputValue = '${dataObject['Zc0M1jsbfyA']}';
        if (inputValue == 'true') {
          hiddenFields['mLjRp8wJ8aW'] = false;
          hiddenFields['QCbFgssCzeF'] = false;
          hiddenFields[''] = false;
        }
      } else if (key == 'ksc7ov3MihX' && value == 'true') {
        hiddenFields['TSx4O9Tf5v2'] = false;
        var inputValue = '${dataObject['TSx4O9Tf5v2']}';
        if (inputValue == 'true') {
          hiddenFields['x5VlMVD2a4E'] = false;
          hiddenFields['rJaHpLnWvfg'] = false;
          hiddenFields['mPMxntJR5Qy'] = false;
        }
      }
    });

    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hiddenSectionInputFieldIds = FormUtil.getFormFieldIds(
          allFormSections
              .where((formSection) => formSection.id == sectionId)
              .toList());
      for (String inputFieldId in hiddenSectionInputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
  }

  resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
  }

  assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String? value,
  ) {
    childMapObject[inputFieldId] = value;
  }
}
