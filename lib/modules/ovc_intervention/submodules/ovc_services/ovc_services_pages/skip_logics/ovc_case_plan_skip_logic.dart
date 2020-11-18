import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';

mixin OvcCasePlanSkipLogic {
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
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'XoSPWmpWXCy' && value != 'true') {
        hiddenFields['CxwbNfPmiN9'] = true;
        hiddenFields['vqf67Edjw4y'] = true;
        hiddenFields['iFv7FJeG3V1'] = true;
      }
      if (inputFieldId == 'ylSjcj6cv42' && value != 'true') {
        hiddenFields['JDqgRJlOSeZ'] = true;
        hiddenFields['elqeNdaYNTS'] = true;
        hiddenFields['qMrZcC7VvCV'] = true;
      }
      if (inputFieldId == 'cx4xBY4jZXM' && value != 'true') {
        hiddenFields['Fmsfd0cXF5w'] = true;
        hiddenFields['b6hvMQuH3oJ'] = true;
        hiddenFields['SIEeRmPm0Q0'] = true;
      }
      if (inputFieldId == 'AxtahhoHcXV' && value != 'true') {
        hiddenFields['cHWpS3Pa71v'] = true;
        hiddenFields['G6GkSeccLmB'] = true;
        hiddenFields['ugZKkd3UMNF'] = true;
      }
      if (inputFieldId == 'd2vXxEPeCq7' && value != 'true') {
        hiddenFields['HbjnW1JjroQ'] = true;
        hiddenFields['GnsYKEE2fnr'] = true;
        hiddenFields['kpzlTeM0673'] = true;
      }
      if (inputFieldId == 'dTFLFtUUeEK' && value != 'true') {
        hiddenFields['b3vvyHQKsoK'] = true;
        hiddenFields['emAJOTWYHVq'] = true;
        hiddenFields['jlu7TDN7khJ'] = true;
      }
      if (inputFieldId == 'Hvq9oisH7Gt' && value != 'true') {
        hiddenFields['pRhbAQNT0NO'] = true;
        hiddenFields['ue6xLPEURqt'] = true;
        hiddenFields['tQ3pKyJ0X9d'] = true;
      }
      if (inputFieldId == 'qTf8VSoojJ2' && value != 'true') {
        hiddenFields['qV0BwfYa8yU'] = true;
        hiddenFields['ontonbgTJ8k'] = true;
        hiddenFields['M2Aqvn027cd'] = true;
      }
      if (inputFieldId == 'DQxqyncQtwm' && value != 'true') {
        hiddenFields['LPDcGvb5bp7'] = true;
        hiddenFields['P4I6rK6Xqxw'] = true;
        hiddenFields['YJXb5rSVP0L'] = true;
      }
      if (inputFieldId == 'e6NV2ZAzFEh' && value != 'true') {
        hiddenFields['UJIxjjBeJTh'] = true;
        hiddenFields['JtfKB58MvNK'] = true;
        hiddenFields['Hdf3EtTGfAb'] = true;
      }
      if (inputFieldId == 'kvF996ugmMl' && value != 'true') {
        hiddenFields['x29nktyRKEn'] = true;
        hiddenFields['OMtcDA7tcVL'] = true;
        hiddenFields['zVCkEJuy2t8'] = true;
      }
      if (inputFieldId == 'iiJpQsEE4qx' && value != 'true') {
        hiddenFields['Am9LJf6APMW'] = true;
        hiddenFields['xse9M31M9z1'] = true;
        hiddenFields['nIoqbMHf3AS'] = true;
      }
      if (inputFieldId == 'ithLHgsAoxs' && value != 'true') {
        hiddenFields['aN9rwRWUOr9'] = true;
        hiddenFields['cKJggm2OXFQ'] = true;
        hiddenFields['kCoBEKqJelO'] = true;
      }
      if (inputFieldId == 'JqGGsDlZh8T' && value != 'true') {
        hiddenFields['ixFuNoQKLoB'] = true;
        hiddenFields['a9geBDwDmXA'] = true;
        hiddenFields['XODRLh84TdQ'] = true;
      }
      if (inputFieldId == 'WrjNxZBVHCL' && value != 'true') {
        hiddenFields['aUJZcOapflH'] = true;
        hiddenFields['NWBZilCPutW'] = true;
        hiddenFields['d3k97F0fS2y'] = true;
      }
      if (inputFieldId == 'PoxYSqq8Hgz' && value != 'true') {
        hiddenFields['ond1LSLwHBC'] = true;
        hiddenFields['O3mOdzWYmg3'] = true;
        hiddenFields['fCDk1LxN484'] = true;
      }
      if (inputFieldId == 'aPmPhwm8Zln' && value != 'true') {
        hiddenFields['xMrGYeREh1d'] = true;
        hiddenFields['jKqWohAPqyW'] = true;
        hiddenFields['wGrQeSydiwd'] = true;
      }
      if (inputFieldId == 'Vd8dV7OweWB' && value != 'true') {
        hiddenFields['VL3CAgTpdqK'] = true;
        hiddenFields['UDYd31rUKgN'] = true;
        hiddenFields['ZO2Zg7kaYyD'] = true;
      }
      if (inputFieldId == 'Ccp4Odlh3BE' && value != 'true') {
        hiddenFields['tPDgzkbmywi'] = true;
        hiddenFields['kGoKVtkQxvk'] = true;
        hiddenFields['Io9nnYXCvWR'] = true;
      }
      if (inputFieldId == 'yf6KmY3Rm5I' && value != 'true') {
        hiddenFields['UVuBtkjHQ95'] = true;
        hiddenFields['oth3dRYox12'] = true;
        hiddenFields['YtwjCoHKA9G'] = true;
      }
      if (inputFieldId == 'WdZ3PnW5yV6' && value != 'true') {
        hiddenFields['Hvvdmc2rsKl'] = true;
        hiddenFields['dJR6GJyHCTr'] = true;
        hiddenFields['OIw6D3I6BmY'] = true;
      }
      if (inputFieldId == 'hS7aONLz2cq' && value != 'true') {
        hiddenFields['psqUATvYzdu'] = true;
        hiddenFields['LDH3TLjHUYK'] = true;
        hiddenFields['SvkvfRNqyh2'] = true;
      }
      if (inputFieldId == 'TQSMaZgfZPO' && value != 'true') {
        hiddenFields['y9Qs6zDLZM2'] = true;
        hiddenFields['do1fAllY7Jv'] = true;
        hiddenFields['mvuyd2jt4Jz'] = true;
      }
      if (inputFieldId == 'SN2kJN3jAG9' && value != 'true') {
        hiddenFields['LXX0ixRx2IT'] = true;
        hiddenFields['k9R0AUmBqHS'] = true;
        hiddenFields['bIMwh3ONDGq'] = true;
      }
      if (inputFieldId == 'X47zxNAqMv0' && value != 'true') {
        hiddenFields['fVfftqUpEMa'] = true;
        hiddenFields['kfcqLf2d2dc'] = true;
        hiddenFields['rPhOdwWvfOA'] = true;
      }
      if (inputFieldId == 'yJQi4cbzeBF' && value != 'true') {
        hiddenFields['lDxuiUg9TOM'] = true;
        hiddenFields['iWH5MhwPSbD'] = true;
        hiddenFields['DqlxkJ0dMA2'] = true;
      }
      if (inputFieldId == 'x4yAqv4z2Xv' && value != 'true') {
        hiddenFields['B1yERoBbRzH'] = true;
        hiddenFields['tYYpfnshIvw'] = true;
        hiddenFields['eTDE6zroxBC'] = true;
      }
      if (inputFieldId == 'AM9oJCOHM7f' && value != 'true') {
        hiddenFields['KzxrHSAQQa0'] = true;
        hiddenFields['SOPRtGCfa5Z'] = true;
        hiddenFields['RoJrwtEhpzk'] = true;
      }
      if (inputFieldId == 'hJUuQ648wVF' && value != 'true') {
        hiddenFields['thVPqfmKo4X'] = true;
        hiddenFields['DQab5Id3WMj'] = true;
        hiddenFields['o37J0mUPmg6'] = true;
      }
      if (inputFieldId == 'BJrrrqQqwQO' && value != 'true') {
        hiddenFields['I0s1qoxF2wl'] = true;
        hiddenFields['c5vtF9QMiVU'] = true;
        hiddenFields['S6O1OxbLfzz'] = true;
      }
      if (inputFieldId == 'LswSBpMoG5C' && value != 'true') {
        hiddenFields['t9HMcipzuSf'] = true;
        hiddenFields['Zdv3luz9Fja'] = true;
        hiddenFields['ziQvzVbjmcb'] = true;
      }
      if (inputFieldId == 'gCKoJgBFdob' && value != 'true') {
        hiddenFields['epF36cYU1Em'] = true;
        hiddenFields['zVUhTogG1qE'] = true;
        hiddenFields['VmuVgr4tfor'] = true;
      }
      if (inputFieldId == 'JSQ3xP1NhuN' && value != 'true') {
        hiddenFields['PVWwxGicRIl'] = true;
        hiddenFields['DWIqhVfMZrD'] = true;
        hiddenFields['MdmCqSwcrlk'] = true;
      }
      if (inputFieldId == 'AwWKp6KmqgY' && value != 'true') {
        hiddenFields['WiJd5cYINcp'] = true;
        hiddenFields['jvxeGCV3VZf'] = true;
        hiddenFields['Mu0LxlAOoSp'] = true;
      }
      if (inputFieldId == 'EaJTFrklMo5' && value != 'true') {
        hiddenFields['kyie4dHxpeC'] = true;
        hiddenFields['whcEPShYGkD'] = true;
        hiddenFields['WAq2HJHXZYS'] = true;
      }
      if (inputFieldId == 'HsxFZOuV4oZ' && value != 'true') {
        hiddenFields['j6rrXcnGpvo'] = true;
        hiddenFields['KKZBSXc1Sg3'] = true;
        hiddenFields['tRxPMAXY6VC'] = true;
      }
      if (inputFieldId == 'yPP7lkomNfK' && value != 'true') {
        hiddenFields['oASchGdCDjh'] = true;
        hiddenFields['ZQ6jDrZ54ic'] = true;
        hiddenFields['vJx6vWPxGsJ'] = true;
      }
      if (inputFieldId == 'uQiyym8SEvd' && value != 'true') {
        hiddenFields['HfJSiIYVwn9'] = true;
        hiddenFields['GjIU252Rcvq'] = true;
        hiddenFields['MEFwYLoRyPR'] = true;
      }
      if (inputFieldId == 'WiPTQhWLVU1' && value != 'true') {
        hiddenFields['ldXiV8hkfjt'] = true;
        hiddenFields['E2CWztOcx2X'] = true;
        hiddenFields['BpLk6ruSL7e'] = true;
      }
      if (inputFieldId == 'neF08iYV9Os' && value != 'true') {
        hiddenFields['cVOG90HglRW'] = true;
        hiddenFields['kGQwyzaP5Km'] = true;
        hiddenFields['Y1ta8eJAWBT'] = true;
      }
      if (inputFieldId == 'GO3Ojp1UEX7' && value != 'true') {
        hiddenFields['UR5q3bp0Qez'] = true;
        hiddenFields['kRwTftt9Nl0'] = true;
        hiddenFields['Trhl3lfCSA6'] = true;
      }
      if (inputFieldId == 'exHDkX1gPiC' && value != 'true') {
        hiddenFields['vis25l3jzKh'] = true;
        hiddenFields['vODRi6sq3Pn'] = true;
        hiddenFields['MDMmtTJTIyh'] = true;
      }
      if (inputFieldId == 'Cb8qzfdrg7d' && value != 'true') {
        hiddenFields['NwrsMPc0Per'] = true;
        hiddenFields['JiqD0sYv7pH'] = true;
        hiddenFields['HeoYwEJukC8'] = true;
      }
      if (inputFieldId == 'qraZh4n14S4' && value != 'true') {
        hiddenFields['hLafgW56GqY'] = true;
        hiddenFields['dSS3xEVkH26'] = true;
        hiddenFields['ZwGE57BjVdJ'] = true;
      }
      if (inputFieldId == 'TdReJf2LTXA' && value != 'true') {
        hiddenFields['TdReJf2LTXA'] = true;
        hiddenFields['EonyCjxIh5l'] = true;
        hiddenFields['YIFHsUgTAlI'] = true;
      }
      if (inputFieldId == 'q2N7p3UbvSF' && value != 'true') {
        hiddenFields['VSVJitLJCmb'] = true;
        hiddenFields['XFY4FxA7ymC'] = true;
        hiddenFields['Gw1wRcsPemn'] = true;
      }
      if (inputFieldId == 'NcMANzhhphO' && value != 'true') {
        hiddenFields['ZEC0IXEd8KX'] = true;
        hiddenFields['fT9sHAd6Gvw'] = true;
        hiddenFields['GhPb5Acr00X'] = true;
      }
    }
    for (String sectionId in hiddenSections.keys) {
      List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections
          .where((formSection) => formSection.id == sectionId)
          .toList());
      for (String inputFieldId in inputFieldIds) {
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
    String value,
  ) {
    childMapObject[inputFieldId] = value;
  }
}
