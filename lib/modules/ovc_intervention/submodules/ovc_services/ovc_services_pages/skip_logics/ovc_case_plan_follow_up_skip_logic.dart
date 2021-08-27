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
      hiddenFields[inputFieldId] = false;
      // hiding service fields based on offered services.
      // HEALTH DOMAIN
      // String value = '${dataObject[inputFieldId]}';
      // if (inputFieldId == 'JnqldNamliR' && value == 'true') {
      //   hiddenFields['CNnzifTDF5a'] == false;
      //   hiddenFields['UQKbbPTRaB8'] == false;
      //   hiddenFields['sxlVgySosg3'] == false;
      // } else if (inputFieldId == 'BYu8pI5kGXF' && value == 'true') {
      //   hiddenFields['u8r8p0a3JqU'] == false;
      //   hiddenFields['W5lbgijaXA6'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'YFgrURiwirq' && value == 'true') {
      //   hiddenFields['LtiZFxXw0Wc'] == false;
      //   hiddenFields['i9icxSZ8HCf'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'HzI5X2yHef6' && value == 'true') {
      //   hiddenFields['GyG2HcLsVka'] == false;
      //   hiddenFields['y8ToqnbVz1o'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'eqhzeRBMftZ' && value == 'true') {
      //   hiddenFields['F8x8QAoFQBO'] == false;
      //   hiddenFields['AStxMCkJhi5'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'ESIjwQ9S6Ic' && value == 'true') {
      //   hiddenFields['EYv3aMwJOUN'] == false;
      //   hiddenFields['GISFLEttRtU'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'r8wPQAog7PJ' && value == 'true') {
      //   hiddenFields['EgbO5h9cs5D'] == false;
      //   hiddenFields['itTgPQ0OrMU'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'UKczyQWCB0L' && value == 'true') {
      //   hiddenFields['jsEr16lnber'] == false;
      //   hiddenFields['wZLjymsKsuj'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'KkqMjxjAR7g' && value == 'true') {
      //   hiddenFields['gYAZrh9o1DB'] == false;
      //   hiddenFields['Jxlug5I3kdu'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'mRoO7kgpgVg' && value == 'true') {
      //   hiddenFields['CIRXgKGOmSI'] == false;
      //   hiddenFields['YSsfKXdIRLG'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'GNQ3gDA2CTI' && value == 'true') {
      //   hiddenFields['oTSVSO3iHTk'] == false;
      //   hiddenFields['aDOvfQ1wdIX'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'gSp9bgPW52L' && value == 'true') {
      //   hiddenFields['fVpcWBp0Ngp'] == false;
      //   hiddenFields['pSkl6ibruvU'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'mY7GqOTKtsQ' && value == 'true') {
      //   hiddenFields['h6obb1v1stw'] == false;
      //   hiddenFields['kBivIQr6mrW'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'zK7kMYpgPQn' && value == 'true') {
      //   hiddenFields['GtejBpkVvtD'] == false;
      //   hiddenFields['g2X9vUL2d9m'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'tnspdPfpuXm' && value == 'true') {
      //   hiddenFields['V1HnY5m2Pmv'] == false;
      //   hiddenFields['eXh6Gag1uwp'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'QnFYeBNZlbf' && value == 'true') {
      //   hiddenFields['EnrZPBFxZuX'] == false;
      //   hiddenFields['xdI5atw8DC4'] == false;
      //   hiddenFields[''] == false;
      // }

      // // STABLE DOMAIN
      // else if (inputFieldId == 'KvLYMr8F4vg' && value == 'true') {
      //   hiddenFields['hnMy2l2pB3z'] == false;
      //   hiddenFields['TN5r1EFmHWz'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'AnnOS2m6LZK' && value == 'true') {
      //   hiddenFields['UHWzhDsQdoB'] == false;
      //   hiddenFields['xECpX8Vt1rT'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'kcoDiGNXWpA' && value == 'true') {
      //   hiddenFields['qwmtkJDotBk'] == false;
      //   hiddenFields['Z6VwHVRIh48'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'fgDPoYtifQI' && value == 'true') {
      //   hiddenFields['lbCCs00yuGQ'] == false;
      //   hiddenFields['TNmg7uRUWgC'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'cbqS6IoSbwI' && value == 'true') {
      //   hiddenFields['zKkaaSt1c8V'] == false;
      //   hiddenFields['KpUgwivl5Cr'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'gV77yUM8NK8' && value == 'true') {
      //   hiddenFields['aqJBZDBzh4m'] == false;
      //   hiddenFields['JFlnkaXlXm5'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'qL9c5r7c6kK' && value == 'true') {
      //   hiddenFields['pUphS6E1Gu5'] == false;
      //   hiddenFields['SODPuEmHEGV'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'FRWCmEerPic' && value == 'true') {
      //   hiddenFields['lQYnoeqfKpe'] == false;
      //   hiddenFields['w4EYZpbtUV8'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'xTO562B5g53' && value == 'true') {
      //   hiddenFields['uOMr56xoKDh'] == false;
      //   hiddenFields['hMdC0CMKSGn'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'lpTVK3t1Ahk' && value == 'true') {
      //   hiddenFields['j1yzHzO0w6w'] == false;
      //   hiddenFields['QnfPxpJvb1D'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'lEkrLOFmLrH' && value == 'true') {
      //   hiddenFields['F8ALMOcc6C1'] == false;
      //   hiddenFields['p77CBdxxtHI'] == false;
      //   hiddenFields[''] == false;
      // }

      // // SAFE DOMAIN
      // else if (inputFieldId == 'RNKOtUtLT4c' && value == 'true') {
      //   hiddenFields['sa79KxTFGFA'] == false;
      //   hiddenFields['EB3JPVqMdb4'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'GImA3HB9YK5' && value == 'true') {
      //   hiddenFields['fFuabYbLUjz'] == false;
      //   hiddenFields['IFggJCXLYPD'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'Fj2RbXsb8Yj' && value == 'true') {
      //   hiddenFields['f90c5olxs5Z'] == false;
      //   hiddenFields['EPwDypaz61A'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'rMtSykWZ4HB' && value == 'true') {
      //   hiddenFields['qwnfgBG2web'] == false;
      //   hiddenFields['OMhFxj6SYhM'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'QDFZ03HbjGj' && value == 'true') {
      //   hiddenFields['Dw1xLXILErU'] == false;
      //   hiddenFields['KWk8waoLO7N'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'cuy4Ai7mBbA' && value == 'true') {
      //   hiddenFields['C5bhgqcq6Qn'] == false;
      //   hiddenFields['h10Iktl4KKR'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'ysDSdiL7wNx' && value == 'true') {
      //   hiddenFields['pBVmFpsSGN7'] == false;
      //   hiddenFields['XUoqvbk0uVH'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'vj0R7ySdigX' && value == 'true') {
      //   hiddenFields['yW0TrzEslYO'] == false;
      //   hiddenFields['tmi1jtKYZs0'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'JlRnllAlSk0' && value == 'true') {
      //   hiddenFields['VlOw6vrLsp5'] == false;
      //   hiddenFields['ONC3bpjq525'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'UZJ9vqIabAY' && value == 'true') {
      //   hiddenFields['pGDK3Y7tN2B'] == false;
      //   hiddenFields['U8h0daQzXXk'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'gfKsz88uxtg' && value == 'true') {
      //   hiddenFields['P06od0qmlSR'] == false;
      //   hiddenFields['iz4CvIFovsF'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'aGChpBlIzcd' && value == 'true') {
      //   hiddenFields['AXLxNo9pz8c'] == false;
      //   hiddenFields['cb773khL7XB'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'gwwUOs6yt6C' && value == 'true') {
      //   hiddenFields['w2HlBCfHbZR'] == false;
      //   hiddenFields['aG42nUguLLW'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'gfKsz88uxtg' && value == 'true') {
      //   hiddenFields['P06od0qmlSR'] == false;
      //   hiddenFields['iz4CvIFovsF'] == false;
      //   hiddenFields[''] == false;
      // }

      // // SCHOOLED DOMAIN
      // else if (inputFieldId == 'LcIB5EL3IjT' && value == 'true') {
      //   hiddenFields['zYrrrFd48S5'] == false;
      //   hiddenFields['WVsVwfErZ7V'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'EYhFIkTpUS3' && value == 'true') {
      //   hiddenFields['rM13n9K4vE7'] == false;
      //   hiddenFields['VlReEXXH1WN'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'IiKUlAeSIE3' && value == 'true') {
      //   hiddenFields['rUCb6Afcz9U'] == false;
      //   hiddenFields['sD0zbIksKTY'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'hg2bpp1HqwU' && value == 'true') {
      //   hiddenFields['wB2jXLTYtDb'] == false;
      //   hiddenFields['Riyr0nniCVo'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'fvgPnlOD7e9' && value == 'true') {
      //   hiddenFields['JFetYCY5tza'] == false;
      //   hiddenFields['yuwtSD8EyoY'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'MeMaUvt3O8j' && value == 'true') {
      //   hiddenFields['KZIjTeMl7sj'] == false;
      //   hiddenFields['KppYygPZ8BL'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'WQlWXUmYjI2' && value == 'true') {
      //   hiddenFields['gAMv1jxS0rh'] == false;
      //   hiddenFields['CxREUNzKxHB'] == false;
      //   hiddenFields[''] == false;
      // } else if (inputFieldId == 'Zc0M1jsbfyA' && value == 'true') {
      //   hiddenFields['mLjRp8wJ8aW'] == false;
      //   hiddenFields['QCbFgssCzeF'] == false;
      //   hiddenFields[''] == false;
      // }

      // // Other activities
      // else if (inputFieldId == 'TSx4O9Tf5v2' && value == 'true') {
      //   hiddenFields['x5VlMVD2a4E'] == false;
      //   hiddenFields['rJaHpLnWvfg'] == false;
      //   hiddenFields[''] == false;
      // }
    }

    dataObject.forEach((key, value) {
      if (key == 'ylSjcj6cv42' && value == 'true') {
        hiddenFields['f0oxTNNwdgP'] = false;
        hiddenFields['YFgrURiwirq'] = false;
        hiddenFields['LtiZFxXw0Wc'] = false;
        hiddenFields['i9icxSZ8HCf'] = false;
      } else if (key == 'XoSPWmpWXCy' && value == 'true') {
        hiddenFields['KDSYFiIefGN'] = false;
        hiddenFields['JnqldNamliR'] = false;
        hiddenFields['CNnzifTDF5a'] = false;
        hiddenFields['sxlVgySosg3'] = false;
      } else if (key == 'Fmsfd0cXF5w' && value == 'true') {
        hiddenFields['zosvtbskE9R'] = false;
        hiddenFields['HzI5X2yHef6'] = false;
        hiddenFields['GyG2HcLsVka'] = false;
        hiddenFields['y8ToqnbVz1o'] = false;
      } else if (key == 'AxtahhoHcXV' && value == 'true') {
        hiddenFields['t6FoYSa8TuZ'] = false;
        hiddenFields['eqhzeRBMftZ'] = false;
        hiddenFields['F8x8QAoFQBO'] = false;
        hiddenFields['AStxMCkJhi5'] = false;
      } else if (key == 'd2vXxEPeCq7' && value == 'true') {
        hiddenFields['GcqCEwXQumn'] = false;
        hiddenFields['ESIjwQ9S6Ic'] = false;
        hiddenFields['EYv3aMwJOUN'] = false;
        hiddenFields['GISFLEttRtU'] = false;
      } else if (key == 'dTFLFtUUeEK' && value == 'true') {
        hiddenFields['slcUWMY6BBO'] = false;
        hiddenFields['r8wPQAog7PJ'] = false;
        hiddenFields['EgbO5h9cs5D'] = false;
        hiddenFields['itTgPQ0OrMU'] = false;
      } else if (key == 'Hvq9oisH7Gt' && value == 'true') {
        hiddenFields['Pfp7l7WWLEY'] = false;
        hiddenFields['gV77yUM8NK8'] = false;
        hiddenFields['aqJBZDBzh4m'] = false;
        hiddenFields['JFlnkaXlXm5'] = false;
      } else if (key == 'qTf8VSoojJ2' && value == 'true') {
        hiddenFields['ipDfOPUCPlB'] = false;
        hiddenFields['qL9c5r7c6kK'] = false;
        hiddenFields['pUphS6E1Gu5'] = false;
        hiddenFields['SODPuEmHEGV'] = false;
      } else if (key == 'DQxqyncQtwm' && value == 'true') {
        hiddenFields['qfs6yQfH7lk'] = false;
        hiddenFields['FRWCmEerPic'] = false;
        hiddenFields['lQYnoeqfKpe'] = false;
        hiddenFields['w4EYZpbtUV8'] = false;
      } else if (key == 'e6NV2ZAzFEh' && value == 'true') {
        hiddenFields['xSpmXkwsULS'] = false;
        hiddenFields['xTO562B5g53'] = false;
        hiddenFields['uOMr56xoKDh'] = false;
        hiddenFields['hMdC0CMKSGn'] = false;
      } else if (key == 'kvF996ugmMl' && value == 'true') {
        hiddenFields['dWu9d1DgNkz'] = false;
        hiddenFields['lpTVK3t1Ahk'] = false;
        hiddenFields['j1yzHzO0w6w'] = false;
        hiddenFields['QnfPxpJvb1D'] = false;
      } else if (key == 'iiJpQsEE4qx' && value == 'true') {
        hiddenFields['XXUKujRHZpn'] = false;
        hiddenFields['kcoDiGNXWpA'] = false;
        hiddenFields['qwmtkJDotBk'] = false;
        hiddenFields['Z6VwHVRIh48'] = false;
      } else if (key == 'ithLHgsAoxs' && value == 'true') {
        hiddenFields['LseJW3MfsQB'] = false;
        hiddenFields['fgDPoYtifQI'] = false;
        hiddenFields['lbCCs00yuGQ'] = false;
        hiddenFields['TNmg7uRUWgC'] = false;
      } else if (key == 'JqGGsDlZh8T' && value == 'true') {
        hiddenFields['btnRZtDTyBN'] = false;
        hiddenFields['cbqS6IoSbwI'] = false;
        hiddenFields['zKkaaSt1c8V'] = false;
        hiddenFields['KpUgwivl5Cr'] = false;
      } else if (key == 'WrjNxZBVHCL' && value == 'true') {
        hiddenFields['O84rxMOQ52U'] = false;
        hiddenFields['lEkrLOFmLrH'] = false;
        hiddenFields['F8ALMOcc6C1'] = false;
        hiddenFields['p77CBdxxtHI'] = false;
      } else if (key == 'PoxYSqq8Hgz' && value == 'true') {
        hiddenFields['dXmaqyn9DME'] = false;
        hiddenFields['gwwUOs6yt6C'] = false;
        hiddenFields['w2HlBCfHbZR'] = false;
        hiddenFields['aG42nUguLLW'] = false;
      } else if (key == 'aPmPhwm8Zln' && value == 'true') {
        hiddenFields['gEoY9RmjQAk'] = false;
        hiddenFields['rMtSykWZ4HB'] = false;
        hiddenFields['qwnfgBG2web'] = false;
        hiddenFields['OMhFxj6SYhM'] = false;
      } else if (key == 'Vd8dV7OweWB' && value == 'true') {
        hiddenFields['ZeDSleJMfKr'] = false;
        hiddenFields['cuy4Ai7mBbA'] = false;
        hiddenFields['C5bhgqcq6Qn'] = false;
        hiddenFields['h10Iktl4KKR'] = false;
      } else if (key == 'Ccp4Odlh3BE' && value == 'true') {
        hiddenFields['BJ0jXcce2sw'] = false;
        hiddenFields['ysDSdiL7wNx'] = false;
        hiddenFields['pBVmFpsSGN7'] = false;
        hiddenFields['XUoqvbk0uVH'] = false;
      } else if (key == 'yf6KmY3Rm5I' && value == 'true') {
        hiddenFields['RZR0kUm9Ov8'] = false;
        hiddenFields['UZJ9vqIabAY'] = false;
        hiddenFields['pGDK3Y7tN2B'] = false;
        hiddenFields['U8h0daQzXXk'] = false;
      } else if (key == 'WdZ3PnW5yV6' && value == 'true') {
        hiddenFields['UVD4nyRh9G4'] = false;
        hiddenFields['gfKsz88uxtg'] = false;
        hiddenFields['P06od0qmlSR'] = false;
        hiddenFields['iz4CvIFovsF'] = false;
      } else if (key == 'hS7aONLz2cq' && value == 'true') {
        hiddenFields['yHtXXWgvUPI'] = false;
        hiddenFields['aGChpBlIzcd'] = false;
        hiddenFields['AXLxNo9pz8c'] = false;
        hiddenFields['cb773khL7XB'] = false;
      } else if (key == 'TQSMaZgfZPO' && value == 'true') {
        hiddenFields['nqip0DmFucC'] = false;
        hiddenFields['EYhFIkTpUS3'] = false;
        hiddenFields['rM13n9K4vE7'] = false;
        hiddenFields['VlReEXXH1WN'] = false;
      } else if (key == 'SN2kJN3jAG9' && value == 'true') {
        hiddenFields['CiDZ0bP8sUk'] = false;
        hiddenFields['IiKUlAeSIE3'] = false;
        hiddenFields['rUCb6Afcz9U'] = false;
        hiddenFields['sD0zbIksKTY'] = false;
        hiddenFields['fEmt4VhSOvd'] = false;
        hiddenFields['FfhMRIKszu3'] = false;
      } else if (key == 'X47zxNAqMv0' && value == 'true') {
        hiddenFields['VNX4rtSJ4GQ'] = false;
        hiddenFields['hg2bpp1HqwU'] = false;
        hiddenFields['wB2jXLTYtDb'] = false;
        hiddenFields['Riyr0nniCVo'] = false;
      } else if (key == 'yJQi4cbzeBF' && value == 'true') {
        hiddenFields['EXYGq5lJI1v'] = false;
        hiddenFields['BYu8pI5kGXF'] = false;
        hiddenFields['u8r8p0a3JqU'] = false;
        hiddenFields['W5lbgijaXA6'] = false;
      } else if (key == 'cx4xBY4jZXM' && value == 'true') {
        hiddenFields['zosvtbskE9R'] = false;
        hiddenFields['HzI5X2yHef6'] = false;
        hiddenFields['GyG2HcLsVka'] = false;
        hiddenFields['y8ToqnbVz1o'] = false;
      } else if (key == 'x4yAqv4z2Xv' && value == 'true') {
        hiddenFields['LUyWbpKKNgW'] = false;
        hiddenFields['UKczyQWCB0L'] = false;
        hiddenFields['jsEr16lnber'] = false;
        hiddenFields['wZLjymsKsuj'] = false;
      } else if (key == 'AM9oJCOHM7f' && value == 'true') {
        hiddenFields['uqYcjiXv41F'] = false;
        hiddenFields['KkqMjxjAR7g'] = false;
        hiddenFields['gYAZrh9o1DB'] = false;
        hiddenFields['Jxlug5I3kdu'] = false;
      } else if (key == 'hJUuQ648wVF' && value == 'true') {
        hiddenFields['wfiqfXHUBde'] = false;
        hiddenFields['mRoO7kgpgVg'] = false;
        hiddenFields['CIRXgKGOmSI'] = false;
        hiddenFields['YSsfKXdIRLG'] = false;
      } else if (key == 'BJrrrqQqwQO' && value == 'true') {
        hiddenFields['PYMmQdzlPLJ'] = false;
        hiddenFields['GNQ3gDA2CTI'] = false;
        hiddenFields['oTSVSO3iHTk'] = false;
        hiddenFields['aDOvfQ1wdIX'] = false;
      } else if (key == 'LswSBpMoG5C' && value == 'true') {
        hiddenFields['x7J6mbgCF10'] = false;
        hiddenFields['gSp9bgPW52L'] = false;
        hiddenFields['fVpcWBp0Ngp'] = false;
        hiddenFields['pSkl6ibruvU'] = false;
      } else if (key == 'gCKoJgBFdob' && value == 'true') {
        hiddenFields['ydZH3TOpsXS'] = false;
        hiddenFields['mY7GqOTKtsQ'] = false;
        hiddenFields['h6obb1v1stw'] = false;
        hiddenFields['kBivIQr6mrW'] = false;
      } else if (key == 'JSQ3xP1NhuN' && value == 'true') {
        hiddenFields['F6z3SQxLskG'] = false;
        hiddenFields['zK7kMYpgPQn'] = false;
        hiddenFields['GtejBpkVvtD'] = false;
        hiddenFields['g2X9vUL2d9m'] = false;
      } else if (key == 'AwWKp6KmqgY' && value == 'true') {
        hiddenFields['YRUnLuPerwn'] = false;
        hiddenFields['tnspdPfpuXm'] = false;
        hiddenFields['V1HnY5m2Pmv'] = false;
        hiddenFields['eXh6Gag1uwp'] = false;
      } else if (key == 'EaJTFrklMo5' && value == 'true') {
        hiddenFields['vXuVPQLxw1d'] = false;
        hiddenFields['QnFYeBNZlbf'] = false;
        hiddenFields['EnrZPBFxZuX'] = false;
        hiddenFields['xdI5atw8DC4'] = false;
      } else if (key == 'HsxFZOuV4oZ' && value == 'true') {
        hiddenFields['InQiKRJfuZW'] = false;
        hiddenFields['KvLYMr8F4vg'] = false;
        hiddenFields['hnMy2l2pB3z'] = false;
        hiddenFields['TN5r1EFmHWz'] = false;
      } else if (key == 'yPP7lkomNfK' && value == 'true') {
        hiddenFields['WA8MAXBxaD1'] = false;
        hiddenFields['AnnOS2m6LZK'] = false;
        hiddenFields['UHWzhDsQdoB'] = false;
        hiddenFields['xECpX8Vt1rT'] = false;
      } else if (key == 'uQiyym8SEvd' && value == 'true') {
        hiddenFields['FAqGmEGN1sa'] = false;
        hiddenFields['RNKOtUtLT4c'] = false;
        hiddenFields['sa79KxTFGFA'] = false;
        hiddenFields['EB3JPVqMdb4'] = false;
      } else if (key == 'WiPTQhWLVU1' && value == 'true') {
        hiddenFields['QBNhlIan0LR'] = false;
        hiddenFields['GImA3HB9YK5'] = false;
        hiddenFields['fFuabYbLUjz'] = false;
        hiddenFields['IFggJCXLYPD'] = false;
      } else if (key == 'neF08iYV9Os' && value == 'true') {
        hiddenFields['xbMtMJ9Uo5j'] = false;
        hiddenFields['Fj2RbXsb8Yj'] = false;
        hiddenFields['f90c5olxs5Z'] = false;
        hiddenFields['EPwDypaz61A'] = false;
      } else if (key == 'GO3Ojp1UEX7' && value == 'true') {
        hiddenFields['iRJGpXzMCzp'] = false;
        hiddenFields['vj0R7ySdigX'] = false;
        hiddenFields['yW0TrzEslYO'] = false;
        hiddenFields['tmi1jtKYZs0'] = false;
      } else if (key == 'exHDkX1gPiC' && value == 'true') {
        hiddenFields['MpOstKAuGPO'] = false;
        hiddenFields['JlRnllAlSk0'] = false;
        hiddenFields['VlOw6vrLsp5'] = false;
        hiddenFields['ONC3bpjq525'] = false;
      } else if (key == 'Cb8qzfdrg7d' && value == 'true') {
        hiddenFields['g0WhpZC7Rhe'] = false;
        hiddenFields['LcIB5EL3IjT'] = false;
        hiddenFields['zYrrrFd48S5'] = false;
        hiddenFields['WVsVwfErZ7V'] = false;
      } else if (key == 'qraZh4n14S4' && value == 'true') {
        hiddenFields['LO3eAKwk0gW'] = false;
        hiddenFields['fvgPnlOD7e9'] = false;
        hiddenFields['JFetYCY5tza'] = false;
        hiddenFields['yuwtSD8EyoY'] = false;
      } else if (key == 'TdReJf2LTXA' && value == 'true') {
        hiddenFields['J8iM7Hh2z3K'] = false;
        hiddenFields['MeMaUvt3O8j'] = false;
        hiddenFields['KZIjTeMl7sj'] = false;
        hiddenFields['KppYygPZ8BL'] = false;
      } else if (key == 'q2N7p3UbvSF' && value == 'true') {
        hiddenFields['FYBjYHD8050'] = false;
        hiddenFields['WQlWXUmYjI2'] = false;
        hiddenFields['gAMv1jxS0rh'] = false;
        hiddenFields['CxREUNzKxHB'] = false;
      } else if (key == 'NcMANzhhphO' && value == 'true') {
        hiddenFields['yvAIdXNQevG'] = false;
        hiddenFields['Zc0M1jsbfyA'] = false;
        hiddenFields['mLjRp8wJ8aW'] = false;
        hiddenFields['QCbFgssCzeF'] = false;
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
