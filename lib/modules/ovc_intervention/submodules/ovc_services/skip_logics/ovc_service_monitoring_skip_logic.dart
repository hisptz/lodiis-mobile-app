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

    // Gather all progress fields
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections
        .where((formSection) => formSection.id != '' && formSection.id != null)
        .toList());
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();

    for (String inputFieldId in inputFieldIds) {
      hiddenFields[inputFieldId] = true;
    }

    //@TODO checking age limit to hide and hide or show services

    dataObject.forEach((key, value) {
      if (key == 'ylSjcj6cv42' && value == 'true') {
        hiddenFields['yOoWkd9dHsJ'] = false;
      } else if (key == 'XoSPWmpWXCy' && value == 'true') {
        hiddenFields['DC4B9EIMZN9'] = false;
      } else if (key == 'AxtahhoHcXV' && value == 'true') {
        hiddenFields['fySDvo8AXNy'] = false;
      } else if (key == 'd2vXxEPeCq7' && value == 'true') {
        hiddenFields['kWyCcWCVJjv'] = false;
      } else if (key == 'dTFLFtUUeEK' && value == 'true') {
        hiddenFields['QvFFo0xqZCy'] = false;
      } else if (key == 'Hvq9oisH7Gt' && value == 'true') {
        hiddenFields['qezhtOHXgaK'] = false;
      } else if (key == 'qTf8VSoojJ2' && value == 'true') {
        hiddenFields['W4UjM09aOEw'] = false;
      } else if (key == 'DQxqyncQtwm' && value == 'true') {
        hiddenFields['TaSyHHXKYhF'] = false;
      } else if (key == 'e6NV2ZAzFEh' && value == 'true') {
        hiddenFields['wNUBfCAg3Fq'] = false;
      } else if (key == 'kvF996ugmMl' && value == 'true') {
        hiddenFields['QD77bNjavza'] = false;
      } else if (key == 'iiJpQsEE4qx' && value == 'true') {
        hiddenFields['VtX5d8LBcZP'] = false;
      } else if (key == 'ithLHgsAoxs' && value == 'true') {
        hiddenFields['b2f8Bv0MozX'] = false;
      } else if (key == 'JqGGsDlZh8T' && value == 'true') {
        hiddenFields['HwbAyUqRqjT'] = false;
      } else if (key == 'WrjNxZBVHCL' && value == 'true') {
        hiddenFields['legjCg7fomo'] = false;
      } else if (key == 'PoxYSqq8Hgz' && value == 'true') {
        hiddenFields['JgokYFY6IWK'] = false;
      } else if (key == 'aPmPhwm8Zln' && value == 'true') {
        hiddenFields['es23GNgSa7N'] = false;
      } else if (key == 'Vd8dV7OweWB' && value == 'true') {
        hiddenFields['akSICiOvXty'] = false;
      } else if (key == 'Ccp4Odlh3BE' && value == 'true') {
        hiddenFields['J5Tw8gd59Aq'] = false;
      } else if (key == 'AaqeRcyjbyS' && value == 'true') {
        hiddenFields['x3FxC6Bw139'] = false;
      } else if (key == 'yf6KmY3Rm5I' && value == 'true') {
        hiddenFields['ngjLjWJjPmN'] = false;
      } else if (key == 'WdZ3PnW5yV6' && value == 'true') {
        hiddenFields['XPFvUiqedGQ'] = false;
      } else if (key == 'hS7aONLz2cq' && value == 'true') {
        hiddenFields['zYjncKPdz9C'] = false;
      } else if (key == 'TQSMaZgfZPO' && value == 'true') {
        hiddenFields['KURLrgcqqZS'] = false;
      } else if (key == 'SN2kJN3jAG9' && value == 'true') {
        hiddenFields['MKfKx93j7Mb'] = false;
      } else if (key == 'X47zxNAqMv0' && value == 'true') {
        hiddenFields['I4vmREMJZug'] = false;
      } else if (key == 'cx4xBY4jZXM' && value == 'true') {
        hiddenFields['PcLhqLEjKGw'] = false;
      } else if (key == 'yJQi4cbzeBF' && value == 'true') {
        hiddenFields['kVvlzs4hSP3'] = false;
      } else if (key == 'x4yAqv4z2Xv' && value == 'true') {
        hiddenFields['Kcy88uJjTQl'] = false;
      } else if (key == 'AM9oJCOHM7f' && value == 'true') {
        hiddenFields['a7yFGFtZ3U9'] = false;
      } else if (key == 'hJUuQ648wVF' && value == 'true') {
        hiddenFields['A3aXfHkuywQ'] = false;
      } else if (key == 'BJrrrqQqwQO' && value == 'true') {
        hiddenFields['qhTPL1R9OlY'] = false;
      } else if (key == 'LswSBpMoG5C' && value == 'true') {
        hiddenFields['FroSdO9AGHb'] = false;
      } else if (key == 'gCKoJgBFdob' && value == 'true') {
        hiddenFields['lviiwATI5uv'] = false;
      } else if (key == 'JSQ3xP1NhuN' && value == 'true') {
        hiddenFields['BLuel6eSkV3'] = false;
      } else if (key == 'AwWKp6KmqgY' && value == 'true') {
        hiddenFields['JINWcteYR7D'] = false;
      } else if (key == 'EaJTFrklMo5' && value == 'true') {
        hiddenFields['gtXZARFG9Pa'] = false;
      } else if (key == 'HsxFZOuV4oZ' && value == 'true') {
        hiddenFields['EG4MGO83vqG'] = false;
      } else if (key == 'yPP7lkomNfK' && value == 'true') {
        hiddenFields['a7GDFMWz1qf'] = false;
      } else if (key == 'uQiyym8SEvd' && value == 'true') {
        hiddenFields['KNRkkNs8IeP'] = false;
      } else if (key == 'WiPTQhWLVU1' && value == 'true') {
        hiddenFields['UqQEuWwhwBd'] = false;
      } else if (key == 'neF08iYV9Os' && value == 'true') {
        hiddenFields['amHHA220xdt'] = false;
      } else if (key == 'GO3Ojp1UEX7' && value == 'true') {
        hiddenFields['HY12JH4WYIl'] = false;
      } else if (key == 'exHDkX1gPiC' && value == 'true') {
        hiddenFields['ouQhwyHxW0W'] = false;
      } else if (key == 'Cb8qzfdrg7d' && value == 'true') {
        hiddenFields['AKjlaqY2VFZ'] = false;
      } else if (key == 'qraZh4n14S4' && value == 'true') {
        hiddenFields['wJergsqzGLz'] = false;
      } else if (key == 'TdReJf2LTXA' && value == 'true') {
        hiddenFields['V8IMX0zD0Of'] = false;
      } else if (key == 'q2N7p3UbvSF' && value == 'true') {
        hiddenFields['ks2bazFqWHo'] = false;
      } else if (key == 'NcMANzhhphO' && value == 'true') {
        hiddenFields['T51fsJaITSM'] = false;
      } else if (key == 'ksc7ov3MihX' && value == 'true') {
        hiddenFields['C06k1O4qrjw'] = false;
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
