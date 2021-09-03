import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';

mixin OvcCasePlanGapSkipLogic {
  Map hiddenFields = Map();
  Map hiddenSections = Map();
  Map childMapObject = Map();

  Future evaluateSkipLogics(
      BuildContext context, List<FormSection> formSections, Map dataObject,
      {OvcHouseholdChild? currentHouseholdChild}) async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();

    if (currentHouseholdChild != null) {
      evaluateAgeSkipLogics(inputFieldIds, currentHouseholdChild);
    }

//@TODO Skip logics for extenal person on OVCs
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'XoSPWmpWXCy' && value != 'true') {
        hiddenFields['CxwbNfPmiN9'] = true;
        hiddenFields['vqf67Edjw4y'] = true;
        hiddenFields['iFv7FJeG3V1'] = true;
        hiddenFields['bQtXR6iQyo8'] = true;
      }
      if (inputFieldId == 'ylSjcj6cv42' && value != 'true') {
        hiddenFields['JDqgRJlOSeZ'] = true;
        hiddenFields['elqeNdaYNTS'] = true;
        hiddenFields['qMrZcC7VvCV'] = true;
        hiddenFields['IhzyIy3tzo0'] = true;
      }
      if (inputFieldId == 'cx4xBY4jZXM' && value != 'true') {
        hiddenFields['Fmsfd0cXF5w'] = true;
        hiddenFields['b6hvMQuH3oJ'] = true;
        hiddenFields['SIEeRmPm0Q0'] = true;
        hiddenFields['iy0KZ7K4qld'] = true;
      }
      if (inputFieldId == 'AxtahhoHcXV' && value != 'true') {
        hiddenFields['cHWpS3Pa71v'] = true;
        hiddenFields['G6GkSeccLmB'] = true;
        hiddenFields['ugZKkd3UMNF'] = true;
        hiddenFields['GULhHDCXRvz'] = true;
      }
      if (inputFieldId == 'd2vXxEPeCq7' && value != 'true') {
        hiddenFields['HbjnW1JjroQ'] = true;
        hiddenFields['GnsYKEE2fnr'] = true;
        hiddenFields['kpzlTeM0673'] = true;
        hiddenFields['X2CA3iQZU74'] = true;
      }
      if (inputFieldId == 'dTFLFtUUeEK' && value != 'true') {
        hiddenFields['b3vvyHQKsoK'] = true;
        hiddenFields['emAJOTWYHVq'] = true;
        hiddenFields['jlu7TDN7khJ'] = true;
        hiddenFields['lwa1qFrFISz'] = true;
      }
      if (inputFieldId == 'Hvq9oisH7Gt' && value != 'true') {
        hiddenFields['pRhbAQNT0NO'] = true;
        hiddenFields['ue6xLPEURqt'] = true;
        hiddenFields['tQ3pKyJ0X9d'] = true;
        hiddenFields['vIbKIUgzBU4'] = true;
      }
      if (inputFieldId == 'qTf8VSoojJ2' && value != 'true') {
        hiddenFields['qV0BwfYa8yU'] = true;
        hiddenFields['ontonbgTJ8k'] = true;
        hiddenFields['M2Aqvn027cd'] = true;
        hiddenFields['AjYKLfIQPtT'] = true;
      }
      if (inputFieldId == 'DQxqyncQtwm' && value != 'true') {
        hiddenFields['LPDcGvb5bp7'] = true;
        hiddenFields['P4I6rK6Xqxw'] = true;
        hiddenFields['YJXb5rSVP0L'] = true;
        hiddenFields['WFKe1YpH1uK'] = true;
      }
      if (inputFieldId == 'e6NV2ZAzFEh' && value != 'true') {
        hiddenFields['UJIxjjBeJTh'] = true;
        hiddenFields['JtfKB58MvNK'] = true;
        hiddenFields['Hdf3EtTGfAb'] = true;
        hiddenFields['MMjndp2xsoQ'] = true;
      }
      if (inputFieldId == 'kvF996ugmMl' && value != 'true') {
        hiddenFields['x29nktyRKEn'] = true;
        hiddenFields['OMtcDA7tcVL'] = true;
        hiddenFields['zVCkEJuy2t8'] = true;
        hiddenFields['Mz24UpWclb3'] = true;
      }
      if (inputFieldId == 'iiJpQsEE4qx' && value != 'true') {
        hiddenFields['Am9LJf6APMW'] = true;
        hiddenFields['xse9M31M9z1'] = true;
        hiddenFields['nIoqbMHf3AS'] = true;
        hiddenFields['uLi7eqd0eEy'] = true;
      }
      if (inputFieldId == 'ithLHgsAoxs' && value != 'true') {
        hiddenFields['aN9rwRWUOr9'] = true;
        hiddenFields['cKJggm2OXFQ'] = true;
        hiddenFields['kCoBEKqJelO'] = true;
        hiddenFields['NUXAxwvM3FE'] = true;
      }
      if (inputFieldId == 'JqGGsDlZh8T' && value != 'true') {
        hiddenFields['ixFuNoQKLoB'] = true;
        hiddenFields['a9geBDwDmXA'] = true;
        hiddenFields['XODRLh84TdQ'] = true;
        hiddenFields['s5mJvzRyfmW'] = true;
      }
      if (inputFieldId == 'WrjNxZBVHCL' && value != 'true') {
        hiddenFields['aUJZcOapflH'] = true;
        hiddenFields['NWBZilCPutW'] = true;
        hiddenFields['d3k97F0fS2y'] = true;
        hiddenFields['boUUP8UeWDL'] = true;
      }
      if (inputFieldId == 'PoxYSqq8Hgz' && value != 'true') {
        hiddenFields['ond1LSLwHBC'] = true;
        hiddenFields['O3mOdzWYmg3'] = true;
        hiddenFields['fCDk1LxN484'] = true;
        hiddenFields['WFscqdyjgUy'] = true;
      }
      if (inputFieldId == 'aPmPhwm8Zln' && value != 'true') {
        hiddenFields['xMrGYeREh1d'] = true;
        hiddenFields['jKqWohAPqyW'] = true;
        hiddenFields['wGrQeSydiwd'] = true;
        hiddenFields['U8jnyQsnfBD'] = true;
      }
      if (inputFieldId == 'AaqeRcyjbyS' && value != 'true') {
        hiddenFields['RCDsibNNIWq'] = true;
        hiddenFields['TizNGPP6e1d'] = true;
        hiddenFields['A4xYu8BYOg7'] = true;
        hiddenFields['Q7GxvZD6h99'] = true;
      }
      if (inputFieldId == 'Vd8dV7OweWB' && value != 'true') {
        hiddenFields['VL3CAgTpdqK'] = true;
        hiddenFields['UDYd31rUKgN'] = true;
        hiddenFields['ZO2Zg7kaYyD'] = true;
        hiddenFields['XvOgqGxX39f'] = true;
      }
      if (inputFieldId == 'Ccp4Odlh3BE' && value != 'true') {
        hiddenFields['tPDgzkbmywi'] = true;
        hiddenFields['kGoKVtkQxvk'] = true;
        hiddenFields['Io9nnYXCvWR'] = true;
        hiddenFields['yoI0bu18mPo'] = true;
      }
      if (inputFieldId == 'yf6KmY3Rm5I' && value != 'true') {
        hiddenFields['UVuBtkjHQ95'] = true;
        hiddenFields['oth3dRYox12'] = true;
        hiddenFields['YtwjCoHKA9G'] = true;
        hiddenFields['RsCebbDkMx9'] = true;
      }
      if (inputFieldId == 'WdZ3PnW5yV6' && value != 'true') {
        hiddenFields['Hvvdmc2rsKl'] = true;
        hiddenFields['dJR6GJyHCTr'] = true;
        hiddenFields['OIw6D3I6BmY'] = true;
        hiddenFields['cu1UkUUTbME'] = true;
      }
      if (inputFieldId == 'hS7aONLz2cq' && value != 'true') {
        hiddenFields['psqUATvYzdu'] = true;
        hiddenFields['LDH3TLjHUYK'] = true;
        hiddenFields['SvkvfRNqyh2'] = true;
        hiddenFields['Pd5CyDu2Z54'] = true;
      }
      if (inputFieldId == 'TQSMaZgfZPO' && value != 'true') {
        hiddenFields['y9Qs6zDLZM2'] = true;
        hiddenFields['do1fAllY7Jv'] = true;
        hiddenFields['mvuyd2jt4Jz'] = true;
        hiddenFields['y5v9t8Skiyi'] = true;
      }
      if (inputFieldId == 'SN2kJN3jAG9' && value != 'true') {
        hiddenFields['LXX0ixRx2IT'] = true;
        hiddenFields['k9R0AUmBqHS'] = true;
        hiddenFields['bIMwh3ONDGq'] = true;
        hiddenFields['k2eUheeYmfk'] = true;
      }
      if (inputFieldId == 'X47zxNAqMv0' && value != 'true') {
        hiddenFields['fVfftqUpEMa'] = true;
        hiddenFields['kfcqLf2d2dc'] = true;
        hiddenFields['rPhOdwWvfOA'] = true;
        hiddenFields['ewpLauNhb8N'] = true;
      }
      if (inputFieldId == 'yJQi4cbzeBF' && value != 'true') {
        hiddenFields['l8HRb7CFYOW'] = true;
        hiddenFields['H4TLyWdOdrI'] = true;
        hiddenFields['DqlxkJ0dMA2'] = true;
        hiddenFields['iWH5MhwPSbD'] = true;
      }
      if (inputFieldId == 'x4yAqv4z2Xv' && value != 'true') {
        hiddenFields['B1yERoBbRzH'] = true;
        hiddenFields['tYYpfnshIvw'] = true;
        hiddenFields['eTDE6zroxBC'] = true;
        hiddenFields['bn0EIFjqXes'] = true;
      }
      if (inputFieldId == 'AM9oJCOHM7f' && value != 'true') {
        hiddenFields['KzxrHSAQQa0'] = true;
        hiddenFields['SOPRtGCfa5Z'] = true;
        hiddenFields['RoJrwtEhpzk'] = true;
        hiddenFields['B9YT3pHNGOg'] = true;
      }
      if (inputFieldId == 'hJUuQ648wVF' && value != 'true') {
        hiddenFields['thVPqfmKo4X'] = true;
        hiddenFields['DQab5Id3WMj'] = true;
        hiddenFields['o37J0mUPmg6'] = true;
        hiddenFields['QfqDdhGC5vR'] = true;
      }
      if (inputFieldId == 'BJrrrqQqwQO' && value != 'true') {
        hiddenFields['I0s1qoxF2wl'] = true;
        hiddenFields['c5vtF9QMiVU'] = true;
        hiddenFields['S6O1OxbLfzz'] = true;
        hiddenFields['wQDSOL4EJ8G'] = true;
      }
      if (inputFieldId == 'LswSBpMoG5C' && value != 'true') {
        hiddenFields['t9HMcipzuSf'] = true;
        hiddenFields['Zdv3luz9Fja'] = true;
        hiddenFields['ziQvzVbjmcb'] = true;
        hiddenFields['FAJpI6PUK8w'] = true;
      }
      if (inputFieldId == 'gCKoJgBFdob' && value != 'true') {
        hiddenFields['epF36cYU1Em'] = true;
        hiddenFields['zVUhTogG1qE'] = true;
        hiddenFields['VmuVgr4tfor'] = true;
        hiddenFields['nUIvqATNc7A'] = true;
      }
      if (inputFieldId == 'JSQ3xP1NhuN' && value != 'true') {
        hiddenFields['PVWwxGicRIl'] = true;
        hiddenFields['DWIqhVfMZrD'] = true;
        hiddenFields['MdmCqSwcrlk'] = true;
        hiddenFields['HrCyUkuZath'] = true;
      }
      if (inputFieldId == 'AwWKp6KmqgY' && value != 'true') {
        hiddenFields['WiJd5cYINcp'] = true;
        hiddenFields['jvxeGCV3VZf'] = true;
        hiddenFields['Mu0LxlAOoSp'] = true;
        hiddenFields['u8yn7sY5eOX'] = true;
      }
      if (inputFieldId == 'EaJTFrklMo5' && value != 'true') {
        hiddenFields['kyie4dHxpeC'] = true;
        hiddenFields['whcEPShYGkD'] = true;
        hiddenFields['WAq2HJHXZYS'] = true;
        hiddenFields['v00dsDvhCRu'] = true;
      }
      if (inputFieldId == 'HsxFZOuV4oZ' && value != 'true') {
        hiddenFields['j6rrXcnGpvo'] = true;
        hiddenFields['KKZBSXc1Sg3'] = true;
        hiddenFields['tRxPMAXY6VC'] = true;
        hiddenFields['DdNC3FdhhsW'] = true;
      }
      if (inputFieldId == 'yPP7lkomNfK' && value != 'true') {
        hiddenFields['oASchGdCDjh'] = true;
        hiddenFields['ZQ6jDrZ54ic'] = true;
        hiddenFields['vJx6vWPxGsJ'] = true;
        hiddenFields['XhG2eidZKCN'] = true;
      }
      if (inputFieldId == 'uQiyym8SEvd' && value != 'true') {
        hiddenFields['HfJSiIYVwn9'] = true;
        hiddenFields['GjIU252Rcvq'] = true;
        hiddenFields['MEFwYLoRyPR'] = true;
        hiddenFields['meOOSrOPoLB'] = true;
      }
      if (inputFieldId == 'WiPTQhWLVU1' && value != 'true') {
        hiddenFields['ldXiV8hkfjt'] = true;
        hiddenFields['E2CWztOcx2X'] = true;
        hiddenFields['BpLk6ruSL7e'] = true;
        hiddenFields['xFXc0oacTEb'] = true;
      }
      if (inputFieldId == 'neF08iYV9Os' && value != 'true') {
        hiddenFields['cVOG90HglRW'] = true;
        hiddenFields['kGQwyzaP5Km'] = true;
        hiddenFields['Y1ta8eJAWBT'] = true;
        hiddenFields['OyeIR1fmV4s'] = true;
      }
      if (inputFieldId == 'GO3Ojp1UEX7' && value != 'true') {
        hiddenFields['UR5q3bp0Qez'] = true;
        hiddenFields['kRwTftt9Nl0'] = true;
        hiddenFields['Trhl3lfCSA6'] = true;
        hiddenFields['gi7tMxuE2nG'] = true;
      }
      if (inputFieldId == 'exHDkX1gPiC' && value != 'true') {
        hiddenFields['vis25l3jzKh'] = true;
        hiddenFields['vODRi6sq3Pn'] = true;
        hiddenFields['MDMmtTJTIyh'] = true;
        hiddenFields['aVfUmmotSaB'] = true;
      }
      if (inputFieldId == 'Cb8qzfdrg7d' && value != 'true') {
        hiddenFields['NwrsMPc0Per'] = true;
        hiddenFields['JiqD0sYv7pH'] = true;
        hiddenFields['HeoYwEJukC8'] = true;
        hiddenFields['vqmvjogGeX5'] = true;
      }
      if (inputFieldId == 'qraZh4n14S4' && value != 'true') {
        hiddenFields['hLafgW56GqY'] = true;
        hiddenFields['dSS3xEVkH26'] = true;
        hiddenFields['ZwGE57BjVdJ'] = true;
        hiddenFields['JXx3FiIQe08'] = true;
      }
      if (inputFieldId == 'TdReJf2LTXA' && value != 'true') {
        hiddenFields['TdReJf2LTXA'] = true;
        hiddenFields['EonyCjxIh5l'] = true;
        hiddenFields['YIFHsUgTAlI'] = true;
        hiddenFields['meR35m2WVNZ'] = true;
      }
      if (inputFieldId == 'q2N7p3UbvSF' && value != 'true') {
        hiddenFields['VSVJitLJCmb'] = true;
        hiddenFields['XFY4FxA7ymC'] = true;
        hiddenFields['Gw1wRcsPemn'] = true;
        hiddenFields['rjKp0pEFJ2L'] = true;
      }
      if (inputFieldId == 'NcMANzhhphO' && value != 'true') {
        hiddenFields['ZEC0IXEd8KX'] = true;
        hiddenFields['fT9sHAd6Gvw'] = true;
        hiddenFields['GhPb5Acr00X'] = true;
        hiddenFields['lO7yfY3mBYB'] = true;
      }
      if (inputFieldId == 'ksc7ov3MihX' && value != 'true') {
        hiddenFields['Mq7g4k4lk44'] = true;
        hiddenFields['LGsvIyYkrP8'] = true;
        hiddenFields['XSTUvAjvijB'] = true;
      }
    }
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

  void evaluateAgeSkipLogics(
      List<String> inputFieldIds, OvcHouseholdChild? currentHouseholdChild) {
    try {
      int age = int.parse(currentHouseholdChild!.age!);
      //Domain health
      if (age > 5) {
        hiddenFields['x4yAqv4z2Xv'] = true;
        hiddenFields['AM9oJCOHM7f'] = true;
        hiddenFields['hJUuQ648wVF'] = true;
        hiddenFields['LswSBpMoG5C'] = true;
        hiddenFields['gCKoJgBFdob'] = true;
        hiddenFields['JSQ3xP1NhuN'] = true;
        hiddenFields['AwWKp6KmqgY'] = true;
        hiddenFields['EaJTFrklMo5'] = true;
      }
      if (age < 2 || age > 5) {
        hiddenFields['BJrrrqQqwQO'] = true;
      }

      //Domain Schooled
      if (age < 9 || age > 17) {
        hiddenFields['Cb8qzfdrg7d'] = true;
      }
      if (age < 18 || age > 24) {
        hiddenFields['TQSMaZgfZPO'] = true;
        hiddenFields['SN2kJN3jAG9'] = true;
      }

      if (age < 13 || age > 17) {
        hiddenFields['qraZh4n14S4'] = true;
        hiddenFields['TdReJf2LTXA'] = true;
        hiddenFields['q2N7p3UbvSF'] = true;
      }

      if (age < 5 || age > 17) {
        hiddenFields['NcMANzhhphO'] = true;
      }
      if (age < 9 || age > 20) {
        hiddenFields['X47zxNAqMv0'] = true;
      }

      //Domain Stable
      if (age < 10 || age > 17) {
        hiddenFields['yPP7lkomNfK'] = true;
      }

      //Domain Safe
      if (age < 9 || age > 17) {
        hiddenFields['uQiyym8SEvd'] = true;
        hiddenFields['aPmPhwm8Zln'] = true;
        hiddenFields['AaqeRcyjbyS'] = true;
      }
      if (age < 5 || age > 8) {
        hiddenFields['neF08iYV9Os'] = true;
      }
    } catch (e) {}
  }
}
