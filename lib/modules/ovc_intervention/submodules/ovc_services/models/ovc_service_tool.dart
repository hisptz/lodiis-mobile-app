import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServiceTool {
  static List<String> getMandatoryField() {
    return [
      'MhPHAVDTCpr',
      'Jgcn4wFYv6E',
      'WadQyc3nF2M',
      'uuGlvpzfXpo',
      'YTNc2P4AA74',
      'tyvSiTnLVdp'
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Service Tool',
          color: Color(0xFF0D3A16),
          subSections: [
            FormSection(
                name: 'Health services provided and referrals completed',
                color: Color(0xFF0D3A16),
                inputFields: [
                  InputField(
                      id: 'MhPHAVDTCpr',
                      name: 'HIVSCREEN Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'Jgcn4wFYv6E',
                      name: 'HIVSCREEN Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'WadQyc3nF2M',
                      name: 'HIVSCREEN Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'uuGlvpzfXpo',
                      name: 'HTS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'YTNc2P4AA74',
                      name: 'HTS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'tyvSiTnLVdp',
                      name: 'HTS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'HxYKbRiVRwN',
                      name: 'HIVTREAT Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'JRlzvdw0Y0X',
                      name: 'HIVTREAT Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'eBFTHIIL9Aw',
                      name: 'HIVTREAT Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'A6dREpWUu9I',
                      name: 'HEALTH Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'NygevpOd6Py',
                      name: 'HEALTH Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'dzjYK7GmiUp',
                      name: 'HEALTH Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'WyrDJmWuXB8',
                      name: 'PRG&L Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'aIpulqsrDu0',
                      name: 'PRG&L Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'aKsQ9EqGrBm',
                      name: 'PRG&L Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'ynBMBAjvHBm',
                      name: 'SAIDS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'SmXzTMmDUEC',
                      name: 'SAIDS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'fgoWXl6DRhZ',
                      name: 'SAIDS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'RZwlAQZnpRj',
                      name: 'IMMUNIZE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'sN2ZZhktXeu',
                      name: 'IMMUNIZE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'HXHcNKzbKgQ',
                      name: 'IMMUNIZE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'lRFnR5WBc3y',
                      name: 'MALNU Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'cpGvDuXFYKa',
                      name: 'MALNU Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'uqq7N5wn5DN',
                      name: 'MALNU Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),


                  InputField(
                      id: 'oplxRn3jIIr',
                      name: 'CCFLS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'YjyI2e0JbyP',
                      name: 'CCFLS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'pHkjNP6C2cl',
                      name: 'CCFLS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),


                 InputField(
                      id: 'IH9K0m9seo8',
                      name: 'STIMULATE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'IOx21fdpf9K',
                      name: 'STIMULATE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'Roe4BCOwLX7',
                      name: 'STIMULATE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),     


                  InputField(
                      id: 'hVm18OhGz6u',
                      name: 'TBSCREEN Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'sb1oBPiLcYo',
                      name: 'TBSCREEN Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'mPDkQmcJzJv',
                      name: 'TBSCREEN Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)), 


                  InputField(
                      id: 'SJqMhMw2kUe',
                      name: 'TBREFER Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),
                  InputField(
                      id: 'Hedod8utMVO',
                      name: 'TBREFER Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(
                            code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'kuWqVtZpQhc',
                      name: 'TBREFER Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF07AD40),
                      labelColor: Color(0xFF07AD40)),              
                ])
          ])
    ];
  }
}
