import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesChildServiceFollowup {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          id: 'Health',
          name: 'DOMAIN HEALTH',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'EXYGq5lJI1v',
                name: 'HIVSCREEN Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BYu8pI5kGXF',
                name: 'HIVSCREEN Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'u8r8p0a3JqU',
                name: 'HIVSCREEN Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'W5lbgijaXA6',
                name: 'HIVSCREEN Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KDSYFiIefGN',
                name: 'HTS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JnqldNamliR',
                name: 'HTS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'CNnzifTDF5a',
                name: 'HTS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'sxlVgySosg3',
                name: 'HTS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'f0oxTNNwdgP',
                name: 'HIVTREAT Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YFgrURiwirq',
                name: 'HIVTREAT Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'LtiZFxXw0Wc',
                name: 'HIVTREAT Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'i9icxSZ8HCf',
                name: 'HIVTREAT Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zosvtbskE9R',
                name: 'HIVS&D Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HzI5X2yHef6',
                name: 'HIVS&D Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'GyG2HcLsVka',
                name: 'HIVS&D Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'y8ToqnbVz1o',
                name: 'HIVS&D Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 't6FoYSa8TuZ',
                name: 'HEALTH Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'eqhzeRBMftZ',
                name: 'HEALTH Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'F8x8QAoFQBO',
                name: 'HEALTH Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'AStxMCkJhi5',
                name: 'HEALTH Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GcqCEwXQumn',
                name: 'PRG&L Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ESIjwQ9S6Ic',
                name: 'PRG&L Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'EYv3aMwJOUN',
                name: 'PRG&L Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GISFLEttRtU',
                name: 'PRG&L Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'slcUWMY6BBO',
                name: 'SAIDS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'r8wPQAog7PJ',
                name: 'SAIDS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'EgbO5h9cs5D',
                name: 'SAIDS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'itTgPQ0OrMU',
                name: 'SAIDS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LUyWbpKKNgW',
                name: 'IMMUNIZE Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UKczyQWCB0L',
                name: 'IMMUNIZE Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'jsEr16lnber',
                name: 'IMMUNIZE Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'wZLjymsKsuj',
                name: 'IMMUNIZE Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uqYcjiXv41F',
                name: 'MALNU Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KkqMjxjAR7g',
                name: 'MALNU Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'gYAZrh9o1DB',
                name: 'MALNU Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Jxlug5I3kdu',
                name: 'MALNU Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'wfiqfXHUBde',
                name: 'CCFLS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'mRoO7kgpgVg',
                name: 'CCFLS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'CIRXgKGOmSI',
                name: 'CCFLS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'YSsfKXdIRLG',
                name: 'CCFLS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'PYMmQdzlPLJ',
                name: 'STIMULATE Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GNQ3gDA2CTI',
                name: 'STIMULATE Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'oTSVSO3iHTk',
                name: 'STIMULATE Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aDOvfQ1wdIX',
                name: 'STIMULATE Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'x7J6mbgCF10',
                name: 'TBSCREEN Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gSp9bgPW52L',
                name: 'TBSCREEN Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'fVpcWBp0Ngp',
                name: 'TBSCREEN Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'pSkl6ibruvU',
                name: 'TBSCREEN Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'ydZH3TOpsXS',
                name: 'TBREFER Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'mY7GqOTKtsQ',
                name: 'TBREFER Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'h6obb1v1stw',
                name: 'TBREFER Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'kBivIQr6mrW',
                name: 'TBREFER Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'F6z3SQxLskG',
                name: 'FOODPREP Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zK7kMYpgPQn',
                name: 'FOODPREP Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'GtejBpkVvtD',
                name: 'FOODPREP Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'g2X9vUL2d9m',
                name: 'FOODPREP Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YRUnLuPerwn',
                name: 'FOODPREV Follow-up date',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tnspdPfpuXm',
                name: 'FOODPREV Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'V1HnY5m2Pmv',
                name: 'FOODPREV Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'eXh6Gag1uwp',
                name: 'FOODPREV Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vXuVPQLxw1d',
                name: 'FOODSUPP Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'QnFYeBNZlbf',
                name: 'FOODSUPP Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'EnrZPBFxZuX',
                name: 'FOODSUPP Service Provision Date',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xdI5atw8DC4',
                name: 'FOODSUPP Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          id: 'Stable',
          name: 'DOMAIN STABLE',
          color: Color(0xFF0000FF),
          borderColor: Color(0xFF0000FF),
          inputFields: [
            InputField(
                id: 'InQiKRJfuZW',
                name: 'OVCFUND Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KvLYMr8F4vg',
                name: 'OVCFUND Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'hnMy2l2pB3z',
                name: 'OVCFUND Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TN5r1EFmHWz',
                name: 'OVCFUND Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WA8MAXBxaD1',
                name: 'SGROUP Follow-up date',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AnnOS2m6LZK',
                name: 'SGROUP Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'UHWzhDsQdoB',
                name: 'SGROUP Service Provision Date',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xECpX8Vt1rT',
                name: 'SGROUP Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'XXUKujRHZpn',
                name: 'EST COOPRTVS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kcoDiGNXWpA',
                name: 'EST COOPRTVS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'qwmtkJDotBk',
                name: 'EST COOPRTVS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'Z6VwHVRIh48',
                name: 'EST COOPRTVS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'LseJW3MfsQB',
                name: 'FUNCT COOPRTVS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fgDPoYtifQI',
                name: 'FUNCT COOPRTVS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'lbCCs00yuGQ',
                name: 'FUNCT COOPRTVS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'TNmg7uRUWgC',
                name: 'FUNCT COOPRTVS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'btnRZtDTyBN',
                name: 'MARKT COOPRTVS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cbqS6IoSbwI',
                name: 'MARKT COOPRTVS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'zKkaaSt1c8V',
                name: 'MARKT COOPRTVS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'KpUgwivl5Cr',
                name: 'MARKT COOPRTVS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          id: 'Safe',
          name: 'DOMAIN SAFE',
          color: Color(0xFF0F9587),
          borderColor: Color(0xFF0F9587),
          inputFields: [
             InputField(
                id: 'FAqGmEGN1sa',
                name: 'SLION Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RNKOtUtLT4c',
                name: 'SLION Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'sa79KxTFGFA',
                name: 'SLION Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'EB3JPVqMdb4',
                name: 'SLION Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'QBNhlIan0LR',
                name: 'RTEEN Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GImA3HB9YK5',
                name: 'RTEEN Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'fFuabYbLUjz',
                name: 'RTEEN Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IFggJCXLYPD',
                name: 'RTEEN Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'xbMtMJ9Uo5j',
                name: 'RKIDS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Fj2RbXsb8Yj',
                name: 'RKIDS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'f90c5olxs5Z',
                name: 'RKIDS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'EPwDypaz61A',
                name: 'RKIDS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'gEoY9RmjQAk',
                name: 'VAC Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rMtSykWZ4HB',
                name: 'VAC Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'qwnfgBG2web',
                name: 'VAC Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'OMhFxj6SYhM',
                name: 'VAC Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'ZeDSleJMfKr',
                name: 'SURVIVORS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cuy4Ai7mBbA',
                name: 'SURVIVORS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'C5bhgqcq6Qn',
                name: 'SURVIVORS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'h10Iktl4KKR',
                name: 'SURVIVORS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'BJ0jXcce2sw',
                name: 'COUNSEL Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ysDSdiL7wNx',
                name: 'COUNSEL Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'pBVmFpsSGN7',
                name: 'COUNSEL Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'XUoqvbk0uVH',
                name: 'COUNSEL Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iRJGpXzMCzp',
                name: 'FCARE Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vj0R7ySdigX',
                name: 'FCARE Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'yW0TrzEslYO',
                name: 'FCARE Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tmi1jtKYZs0',
                name: 'FCARE Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'MpOstKAuGPO',
                name: 'SHELTER Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JlRnllAlSk0',
                name: 'SHELTER Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'VlOw6vrLsp5',
                name: 'SHELTER Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'ONC3bpjq525',
                name: 'SHELTER Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RZR0kUm9Ov8',
                name: 'ABUSE Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UZJ9vqIabAY',
                name: 'ABUSE Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'pGDK3Y7tN2B',
                name: 'ABUSE Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'U8h0daQzXXk',
                name: 'ABUSE Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UVD4nyRh9G4',
                name: 'LEGALPROT Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gfKsz88uxtg',
                name: 'LEGALPROT Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'P06od0qmlSR',
                name: 'LEGALPROT Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iz4CvIFovsF',
                name: 'LEGALPROT Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yHtXXWgvUPI',
                name: 'BIRTHCERT Follow-up Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aGChpBlIzcd',
                name: 'BIRTHCERT Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'AXLxNo9pz8c',
                name: 'BIRTHCERT Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
              InputField(
                id: 'cb773khL7XB',
                name: 'BIRTHCERT Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          id: 'Schooled',
          name: 'DOMAIN SCHOOLED',
          color: Color(0xFF9B2BAE),
          borderColor: Color(0xFF9B2BAE),
          inputFields: [
            InputField(
                id: 'g0WhpZC7Rhe',
                name: 'AFLAS Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LcIB5EL3IjT',
                name: 'AFLAS Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'zYrrrFd48S5',
                name: 'AFLAS Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WVsVwfErZ7V',
                name: 'AFLAS Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'nqip0DmFucC',
                name: 'PTS4G Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EYhFIkTpUS3',
                name: 'PTS4G Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'rM13n9K4vE7',
                name: 'PTS4G Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VlReEXXH1WN',
                name: 'PTS4G Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CiDZ0bP8sUk',
                name: 'PTS4NG Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IiKUlAeSIE3',
                name: 'PTS4NG Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'rUCb6Afcz9U',
                name: 'PTS4NG Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'sD0zbIksKTY',
                name: 'PTS4NG Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VNX4rtSJ4GQ',
                name: 'HWCLUB Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hg2bpp1HqwU',
                name: 'HWCLUB Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'wB2jXLTYtDb',
                name: 'HWCLUB Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Riyr0nniCVo',
                name: 'HWCLUB Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LO3eAKwk0gW',
                name: 'BURSARY Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fvgPnlOD7e9',
                name: 'BURSARY Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'JFetYCY5tza',
                name: 'BURSARY Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yuwtSD8EyoY',
                name: 'BURSARY Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'J8iM7Hh2z3K',
                name: 'SFEES Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MeMaUvt3O8j',
                name: 'SFEES Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'KZIjTeMl7sj',
                name: 'SFEES Service Provision Date',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KppYygPZ8BL',
                name: 'SFEES Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'FYBjYHD8050',
                name: 'SMATERIAL Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WQlWXUmYjI2',
                name: 'SMATERIAL Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'gAMv1jxS0rh',
                name: 'SMATERIAL Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
             InputField(
                id: 'CxREUNzKxHB',
                name: 'SMATERIAL Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yvAIdXNQevG',
                name: 'REENROL Follow-up date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Zc0M1jsbfyA',
                name: 'REENROL Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'mLjRp8wJ8aW',
                name: 'REENROL Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'QCbFgssCzeF',
                name: 'REENROL Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'Other Activities',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'akYwcu3idMK',
                name: 'OTHER ACTIVITIES Follow-up date',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TSx4O9Tf5v2',
                name: 'OTHER ACTIVITIES Service Provision Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'x5VlMVD2a4E',
                name: 'OTHER ACTIVITIES Service Provision Date',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rJaHpLnWvfg',
                name: 'OTHER ACTIVITIES Comment',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}
