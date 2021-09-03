import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class OvcServiceMonitoringSkipLogic {
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

    dataObject.forEach((key, value) {
      if (key == 'BYu8pI5kGXF' && value == 'true') {
        hiddenFields['kVvlzs4hSP3'] = false;
      } else if (key == 'JnqldNamliR' && value == 'true') {
        hiddenFields['DC4B9EIMZN9'] = false;
      } else if (key == 'YFgrURiwirq' && value == 'true') {
        hiddenFields['yOoWkd9dHsJ'] = false;
      } else if (key == 'HzI5X2yHef6' && value == 'true') {
        hiddenFields['PcLhqLEjKGw'] = false;
      } else if (key == 'eqhzeRBMftZ' && value == 'true') {
        hiddenFields['fySDvo8AXNy'] = false;
      } else if (key == 'ESIjwQ9S6Ic' && value == 'true') {
        hiddenFields['kWyCcWCVJjv'] = false;
      } else if (key == 'r8wPQAog7PJ' && value == 'true') {
        hiddenFields['QvFFo0xqZCy'] = false;
      } else if (key == 'gV77yUM8NK8' && value == 'true') {
        hiddenFields['qezhtOHXgaK'] = false;
      } else if (key == 'qL9c5r7c6kK' && value == 'true') {
        hiddenFields['W4UjM09aOEw'] = false;
      } else if (key == 'FRWCmEerPic' && value == 'true') {
        hiddenFields['TaSyHHXKYhF'] = false;
      } else if (key == 'xTO562B5g53' && value == 'true') {
        hiddenFields['wNUBfCAg3Fq'] = false;
      } else if (key == 'lpTVK3t1Ahk' && value == 'true') {
        hiddenFields['QD77bNjavza'] = false;
      } else if (key == 'UKczyQWCB0L' && value == 'true') {
        hiddenFields['Kcy88uJjTQl'] = false;
      } else if (key == 'KkqMjxjAR7g' && value == 'true') {
        hiddenFields['a7yFGFtZ3U9'] = false;
      } else if (key == 'A3aXfHkuywQ' && value == 'true') {
        hiddenFields['mRoO7kgpgVg'] = false;
      } else if (key == 'GNQ3gDA2CTI' && value == 'true') {
        hiddenFields['qhTPL1R9OlY'] = false;
      } else if (key == 'gSp9bgPW52L' && value == 'true') {
        hiddenFields['FroSdO9AGHb'] = false;
      } else if (key == 'mY7GqOTKtsQ' && value == 'true') {
        hiddenFields['lviiwATI5uv'] = false;
      } else if (key == 'zK7kMYpgPQn' && value == 'true') {
        hiddenFields['BLuel6eSkV3'] = false;
      } else if (key == 'tnspdPfpuXm' && value == 'true') {
        hiddenFields['JINWcteYR7D'] = false;
      } else if (key == 'QnFYeBNZlbf' && value == 'true') {
        hiddenFields['gtXZARFG9Pa'] = false;
      } else if (key == 'KvLYMr8F4vg' && value == 'true') {
        hiddenFields['EG4MGO83vqG'] = false;
      } else if (key == 'AnnOS2m6LZK' && value == 'true') {
        hiddenFields['a7GDFMWz1qf'] = false;
      } else if (key == 'kcoDiGNXWpA' && value == 'true') {
        hiddenFields['VtX5d8LBcZP'] = false;
      } else if (key == 'fgDPoYtifQI' && value == 'true') {
        hiddenFields['b2f8Bv0MozX'] = false;
      } else if (key == 'cbqS6IoSbwI' && value == 'true') {
        hiddenFields['HwbAyUqRqjT'] = false;
      } else if (key == 'lEkrLOFmLrH' && value == 'true') {
        hiddenFields['legjCg7fomo'] = false;
      } else if (key == 'gwwUOs6yt6C' && value == 'true') {
        hiddenFields['JgokYFY6IWK'] = false;
      } else if (key == 'RNKOtUtLT4c' && value == 'true') {
        hiddenFields['KNRkkNs8IeP'] = false;
      } else if (key == 'GImA3HB9YK5' && value == 'true') {
        hiddenFields['UqQEuWwhwBd'] = false;
      } else if (key == 'amHHA220xdt' && value == 'true') {
        hiddenFields['Fj2RbXsb8Yj'] = false;
      } else if (key == 'rMtSykWZ4HB' && value == 'true') {
        hiddenFields['es23GNgSa7N'] = false;
      } else if (key == 'QDFZ03HbjGj' && value == 'true') {
        hiddenFields['x3FxC6Bw139'] = false;
      } else if (key == 'cuy4Ai7mBbA' && value == 'true') {
        hiddenFields['akSICiOvXty'] = false;
      } else if (key == 'ysDSdiL7wNx' && value == 'true') {
        hiddenFields['J5Tw8gd59Aq'] = false;
      } else if (key == 'vj0R7ySdigX' && value == 'true') {
        hiddenFields['HY12JH4WYIl'] = false;
      } else if (key == 'JlRnllAlSk0' && value == 'true') {
        hiddenFields['ouQhwyHxW0W'] = false;
      } else if (key == 'UZJ9vqIabAY' && value == 'true') {
        hiddenFields['ngjLjWJjPmN'] = false;
      } else if (key == 'gfKsz88uxtg' && value == 'true') {
        hiddenFields['XPFvUiqedGQ'] = false;
      } else if (key == 'aGChpBlIzcd' && value == 'true') {
        hiddenFields['zYjncKPdz9C'] = false;
      } else if (key == 'LcIB5EL3IjT' && value == 'true') {
        hiddenFields['AKjlaqY2VFZ'] = false;
      } else if (key == 'EYhFIkTpUS3' && value == 'true') {
        hiddenFields['KURLrgcqqZS'] = false;
      } else if (key == 'IiKUlAeSIE3' && value == 'true') {
        hiddenFields['MKfKx93j7Mb'] = false;
      } else if (key == 'hg2bpp1HqwU' && value == 'true') {
        hiddenFields['I4vmREMJZug'] = false;
      } else if (key == 'fvgPnlOD7e9' && value == 'true') {
        hiddenFields['wJergsqzGLz'] = false;
      } else if (key == 'MeMaUvt3O8j' && value == 'true') {
        hiddenFields['V8IMX0zD0Of'] = false;
      } else if (key == 'WQlWXUmYjI2' && value == 'true') {
        hiddenFields['ks2bazFqWHo'] = false;
      } else if (key == 'Zc0M1jsbfyA' && value == 'true') {
        hiddenFields['T51fsJaITSM'] = false;
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
