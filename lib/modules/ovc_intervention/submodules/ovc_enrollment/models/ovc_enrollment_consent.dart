import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OvcEnrollmentConsent {
  static List<String> getMandatoryField() {
    return [
      'location',
      'OVaqHW5kimy',
      'JCI4nxcE4N6',
      'XVRQaLDDSpx',
      'gCdkCgKJhng',
      'fxqfSmoLBvT',
      'R026OBBkvLi',
      'MP7ROUSWfT9',
      'sCGr0RTmvJ7'
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(name: '', color: Color(0xFF737373), inputFields: [
        InputField(
            id: 'location',
            name: 'Location',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [3],
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'OVaqHW5kimy',
            name:
                'Do you understand the goal of the 4 Children OVC program and its potential benefits to my household',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46)),
        InputField(
            id: 'JCI4nxcE4N6',
            name:
                'Does your household agrees to regularly meet with case management worker to discuss issues faced, set goals for future, and plan how to achieve those goals until our goals are reached',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46)),
        InputField(
            id: 'XVRQaLDDSpx',
            name:
                'Do you allow your information to be stored in (Implementing Organization)’s case management system',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46)),
        InputField(
            id: 'gCdkCgKJhng',
            name:
                'Do you allow specific information on your household’s and child(ren) information to be shared with and discussed amongst (called case conferencing) the service provider(s) (organizations or groups).',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46)),
        InputField(
            id: 'fxqfSmoLBvT',
            name:
                'Have you agreed to be referred to help you  and your family achieve our goals',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46)),
        InputField(
            id: 'R026OBBkvLi',
            name:
                'Do you understand that you can change your mind and decide not to share information',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46)),
        InputField(
            id: 'MP7ROUSWfT9',
            name:
                'Do you understand that in life-threatening or emergency situations your information will be shared with necessary authorities whether or not you have given consent',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46)),
      ]),
           FormSection(name: '', color: Color(0xFF737373), inputFields: [
              InputField(
            id:'sCGr0RTmvJ7',
            name:'Willing to be among beneficiaries of this program ?',
            valueType: 'BOOLEAN',
            labelColor: Color(0xFF1A3518),
            inputColor: Color(0xFF4B9F46))
           ])
    ];
  }
}
