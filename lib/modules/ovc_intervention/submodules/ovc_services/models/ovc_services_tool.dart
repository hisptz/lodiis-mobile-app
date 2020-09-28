import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesTool {
  static List<FormSection> getFormSections() {
    return [
       FormSection(
                name: 'DOMAIN HEALTH',
                color: Color(0xFF4D9E49),
                borderColor: Color(0xFF4D9E49),
                inputFields: [
                     InputField(
                      id: 'MhPHAVDTCpr',
                      name: 'HIVSCREEN Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'Jgcn4wFYv6E',
                      name: 'HIVSCREEN Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'WadQyc3nF2M',
                      name: 'HIVSCREEN Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'uuGlvpzfXpo',
                      name: 'HTS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'YTNc2P4AA74',
                      name: 'HTS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'tyvSiTnLVdp',
                      name: 'HTS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'HxYKbRiVRwN',
                      name: 'HIVTREAT Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'JRlzvdw0Y0X',
                      name: 'HIVTREAT Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'eBFTHIIL9Aw',
                      name: 'HIVTREAT Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'A6dREpWUu9I',
                      name: 'HEALTH Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'NygevpOd6Py',
                      name: 'HEALTH Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'dzjYK7GmiUp',
                      name: 'HEALTH Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'WyrDJmWuXB8',
                      name: 'PRG&L Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'aIpulqsrDu0',
                      name: 'PRG&L Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'aKsQ9EqGrBm',
                      name: 'PRG&L Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'ynBMBAjvHBm',
                      name: 'SAIDS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'SmXzTMmDUEC',
                      name: 'SAIDS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'fgoWXl6DRhZ',
                      name: 'SAIDS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'RZwlAQZnpRj',
                      name: 'IMMUNIZE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'sN2ZZhktXeu',
                      name: 'IMMUNIZE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'HXHcNKzbKgQ',
                      name: 'IMMUNIZE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'lRFnR5WBc3y',
                      name: 'MALNU Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'cpGvDuXFYKa',
                      name: 'MALNU Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'uqq7N5wn5DN',
                      name: 'MALNU Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'oplxRn3jIIr',
                      name: 'CCFLS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'YjyI2e0JbyP',
                      name: 'CCFLS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'pHkjNP6C2cl',
                      name: 'CCFLS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                 InputField(
                      id: 'IH9K0m9seo8',
                      name: 'STIMULATE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'IOx21fdpf9K',
                      name: 'STIMULATE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'Roe4BCOwLX7',
                      name: 'STIMULATE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),     
                  InputField(
                      id: 'hVm18OhGz6u',
                      name: 'TBSCREEN Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'sb1oBPiLcYo',
                      name: 'TBSCREEN Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'mPDkQmcJzJv',
                      name: 'TBSCREEN Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'SJqMhMw2kUe',
                      name: 'TBREFER Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'Hedod8utMVO',
                      name: 'TBREFER Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'kuWqVtZpQhc',
                      name: 'TBREFER Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'jOZu6jNOFWw',
                      name: 'FOODPREP Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'w3Ztvgfz5xQ',
                      name: 'FOODPREP Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'B0Hhe6Gg3lm',
                      name: 'FOODPREP Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'cmjDm6R4nWe',
                      name: 'FOODPREV Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'WGRQByzku93',
                      name: 'FOODPREV Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'p3qtIy0BDnV',
                      name: 'FOODPREV Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'ZyrXoAY7jYF',
                      name: 'FOODSUPP Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'p74m1sTPcUp',
                      name: 'FOODSUPP Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'tcjDT53GJvh',
                      name: 'FOODSUPP Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                ]),
             FormSection(
                name: 'DOMAIN STABLE',
                color: Color(0xFF0000FF),
                borderColor: Color(0xFF0000FF),
                inputFields: [
                 InputField(
                      id: 'Iq00NZta1ma',
                      name: 'OVCFUND Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'ZIlbj7JORWL',
                      name: 'OVCFUND Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'sWX0fwpPAuz',
                      name: 'OVCFUND Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'IOsqYryZypa',
                      name: 'SGROUP Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'S2VLNryO8D7',
                      name: 'SGROUP Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'MSluRnDUOSj',
                      name: 'SGROUP Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                InputField(
                      id: 'k0d7yAySRfV',
                      name: 'EST COOPRTVS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'qJDGs3Nz7jp',
                      name: 'EST COOPRTVS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'bBvDlCRZbCz',
                      name: 'EST COOPRTVS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'FVGvLBu62ZA',
                      name: 'FUNCT COOPRTVS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'LenilPuwXYm',
                      name: 'FUNCT COOPRTVS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'a056JmbckLk',
                      name: 'FUNCT COOPRTVS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'zGSfW5f1hbD',
                      name: 'MARKT COOPRTVS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'EzjuSbaZmsJ',
                      name: 'MARKT COOPRTVS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'Bd06XcvCmG9',
                      name: 'MARKT COOPRTVS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                ]),
             FormSection(
                name: 'DOMAIN SAFE',
                color: Color(0xFF0F9587),
                borderColor: Color(0xFF0F9587),
                inputFields: [
                    InputField(
                      id: 'nCNRjicceGN',
                      name: 'SLION Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'c6IWsVxE0BB',
                      name: 'SLION Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'X3o1iJ81CyU',
                      name: 'SLION Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'PPznbVeevvW',
                      name: 'RTEEN Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'diItWJjAQbK',
                      name: 'RTEEN Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'NFrLBuyUtTE',
                      name: 'RTEEN Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'FEQqwwEtDmo',
                      name: 'RKIDS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'YA7GwnwLYfY',
                      name: 'RKIDS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'jb7EnSE4KlN',
                      name: 'RKIDS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'MqN9J5AFFqr',
                      name: 'VAC Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'cX8CCVSGYk6',
                      name: 'VAC Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'WvlTSmbWw4a',
                      name: 'VAC Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'BRT7TsR9o84',
                      name: 'SURVIVORS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'NJimP9SRdeW',
                      name: 'SURVIVORS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'AzPFnFU7Z2a',
                      name: 'SURVIVORS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'EqfX6YKOIpd',
                      name: 'COUNSEL Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'htOshFwGfzL',
                      name: 'COUNSEL Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'LCx6It7vKzZ',
                      name: 'COUNSEL Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                 InputField(
                      id: 'K2FQbBtJ465',
                      name: 'FCARE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'SBqclMIQTd6',
                      name: 'FCARE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'T4qePqdKf9Q',
                      name: 'FCARE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'zm0d3PnWVBS',
                      name: 'SHELTER Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'qrRnNmOFeKi',
                      name: 'SHELTER Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'ArGQ4hTUPCj',
                      name: 'SHELTER Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'KItM1GZlnH7',
                      name: 'ABUSE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'LJtjUn0PTUa',
                      name: 'ABUSE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'YrTI8znQe2B',
                      name: 'ABUSE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'WHc2UUx17eC',
                      name: 'LEGALPROT Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'kxDFzZ3D6qR',
                      name: 'LEGALPROT Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'TOjZiXwiVd9',
                      name: 'LEGALPROT Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'Pi0lDTkLveS',
                      name: 'BIRTHCERT Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'VVJOZzWlsAx',
                      name: 'BIRTHCERT Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'p9LXpwDbVhl',
                      name: 'BIRTHCERT Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                ]),
              FormSection(
                name: 'DOMAIN SCHOOLED',
                color: Color(0xFF9B2BAE),
                borderColor: Color(0xFF9B2BAE),
                inputFields: [
               InputField(
                      id: 'GLdaizpiwto',
                      name: 'AFLAS  Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'jy0agAtmXKs',
                      name: 'AFLAS  Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'sW2LxeUPM90',
                      name: 'AFLAS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                InputField(
                      id: 'SyA0WUw5YOM',
                      name: 'PTS4G Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'PJfYo1TasrO',
                      name: 'PTS4G Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'ixMEJ5ebqqR',
                      name: 'PTS4G Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                InputField(
                      id: 'kVovIYDJwrr',
                      name: 'PTS4NG Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'EVmHxwg2UVK',
                      name: 'PTS4NG Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'dTV4TFa5HQf',
                      name: 'PTS4NG Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'WzfG0CyHbFK',
                      name: 'HWCLUB Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'yFna6aEZooC',
                      name: 'HWCLUB Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'fv95bVM533k',
                      name: 'HWCLUB Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'kDoux1nOdxh',
                      name: 'BURSARY Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'Hv92QOivZfl',
                      name: 'BURSARY Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'bybFxmJSv6c',
                      name: 'BURSARY Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'Is9rjRZosvm',
                      name: 'SFEES Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'o55R5MxDtol',
                      name: 'SFEES Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'T22poAz1qFF',
                      name: 'SFEES Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'eS9DikAhz8O',
                      name: 'SMATERIAL Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'IvYpLyhPyr5',
                      name: 'SMATERIAL Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'Me5NdFqReQ0',
                      name: 'SMATERIAL Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'TYPgsb3sOrk',
                      name: 'REENROL Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'aDCG4A4XxzQ',
                      name: 'REENROL Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'p9CXzF9YYk6',
                      name: 'REENROL Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                ]),
        ];
  }
}
