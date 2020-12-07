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
                translatedName: 'Letsatsi la ho latela HIVSCREEN',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BYu8pI5kGXF',
                name: 'HIVSCREEN Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea HIVSCREEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'u8r8p0a3JqU',
                name: 'HIVSCREEN Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa HIVSCREEN',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'W5lbgijaXA6',
                name: 'HIVSCREEN Comment',
                translatedName: 'Tlhaloso ea HIVSCREEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KDSYFiIefGN',
                name: 'HTS Follow-up date',
                translatedName: 'Letsatsi la ho latela HTS',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JnqldNamliR',
                name: 'HTS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea HTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'CNnzifTDF5a',
                name: 'HTS Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa HTS',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'sxlVgySosg3',
                name: 'HTS Comment',
                translatedName: 'Tlhaloso ea HTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'f0oxTNNwdgP',
                name: 'HIVTREAT Follow-up date',
                translatedName: 'Letsatsi la ho latela HIVTREAT',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YFgrURiwirq',
                name: 'HIVTREAT Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea HIVTREAT',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'LtiZFxXw0Wc',
                name: 'HIVTREAT Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa HIVTREAT',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'i9icxSZ8HCf',
                name: 'HIVTREAT Comment',
                translatedName: 'Tlhaloso ea HIVTREAT',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zosvtbskE9R',
                name: 'HIVS&D Follow-up date',
                translatedName: 'Letsatsi la ho latela HIVS&D',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HzI5X2yHef6',
                name: 'HIVS&D Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea HIVS&D',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'GyG2HcLsVka',
                name: 'HIVS&D Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa HIVS&D',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'y8ToqnbVz1o',
                name: 'HIVS&D Comment',
                translatedName: 'Tlhaloso ea HIVS&D',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 't6FoYSa8TuZ',
                name: 'HEALTH Follow-up date',
                translatedName: 'Letsatsi la ho latela HEALTH',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'eqhzeRBMftZ',
                name: 'HEALTH Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea HEALTH',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'F8x8QAoFQBO',
                name: 'HEALTH Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa HEALTH',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AStxMCkJhi5',
                name: 'HEALTH Comment',
                translatedName: 'Tlhaloso ea HEALTH',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GcqCEwXQumn',
                name: 'PRG&L Follow-up date',
                translatedName: 'Letsatsi la ho latela PRG&L',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ESIjwQ9S6Ic',
                name: 'PRG&L Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea PRG&L',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'EYv3aMwJOUN',
                name: 'PRG&L Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa PRG&L',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GISFLEttRtU',
                name: 'PRG&L Comment',
                translatedName: 'Tlhaloso ea PRG&L',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'slcUWMY6BBO',
                name: 'SAIDS Follow-up date',
                translatedName: 'Letsatsi la ho latela SAIDS',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'r8wPQAog7PJ',
                name: 'SAIDS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SAIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'EgbO5h9cs5D',
                name: 'SAIDS Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa SAIDS',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'itTgPQ0OrMU',
                name: 'SAIDS Comment',
                translatedName: 'Tlhaloso ea SAIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LUyWbpKKNgW',
                name: 'IMMUNIZE Follow-up date',
                translatedName: 'Letsatsi la ho latela IMMUNIZE',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UKczyQWCB0L',
                name: 'IMMUNIZE Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea IMMUNIZE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'jsEr16lnber',
                name: 'IMMUNIZE Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa IMMUNIZE',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'wZLjymsKsuj',
                name: 'IMMUNIZE Comment',
                translatedName: 'Tlhaloso ea IMMUNIZE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uqYcjiXv41F',
                name: 'MALNU Follow-up date',
                translatedName: 'Letsatsi la ho latela MALNU',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KkqMjxjAR7g',
                name: 'MALNU Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea MALNU',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'gYAZrh9o1DB',
                name: 'MALNU Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa MALNU',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Jxlug5I3kdu',
                name: 'MALNU Comment',
                translatedName: 'Tlhaloso ea MALNU',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'wfiqfXHUBde',
                name: 'CCFLS Follow-up date',
                translatedName: 'Letsatsi la ho latela CCFLS',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'mRoO7kgpgVg',
                name: 'CCFLS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea CCFLS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'CIRXgKGOmSI',
                name: 'CCFLS Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa CCFLS',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YSsfKXdIRLG',
                name: 'CCFLS Comment',
                translatedName: 'Tlhaloso ea CCFLS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'PYMmQdzlPLJ',
                name: 'STIMULATE Follow-up date',
                translatedName: 'Letsatsi la ho latela STIMULATE',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GNQ3gDA2CTI',
                name: 'STIMULATE Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea STIMULATE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'oTSVSO3iHTk',
                name: 'STIMULATE Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa STIMULATE',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aDOvfQ1wdIX',
                name: 'STIMULATE Comment',
                translatedName: 'Tlhaloso ea STIMULATE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'x7J6mbgCF10',
                name: 'TBSCREEN Follow-up date',
                translatedName: 'Letsatsi la ho latela TBSCREEN',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gSp9bgPW52L',
                name: 'TBSCREEN Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea TBSCREEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'fVpcWBp0Ngp',
                name: 'TBSCREEN Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa TBSCREEN',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'pSkl6ibruvU',
                name: 'TBSCREEN Comment',
                translatedName: 'Tlhaloso ea TBSCREEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ydZH3TOpsXS',
                name: 'TBREFER Follow-up date',
                translatedName: 'Letsatsi la ho latela TBREFER',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'mY7GqOTKtsQ',
                name: 'TBREFER Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea TBREFER',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'h6obb1v1stw',
                name: 'TBREFER Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa TBREFER',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kBivIQr6mrW',
                name: 'TBREFER Comment',
                translatedName: 'Tlhaloso ea TBREFER',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'F6z3SQxLskG',
                name: 'FOODPREP Follow-up date',
                translatedName: 'Letsatsi la ho latela FOODPREP',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zK7kMYpgPQn',
                name: 'FOODPREP Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea FOODPREP',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'GtejBpkVvtD',
                name: 'FOODPREP Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa FOODPREP',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'g2X9vUL2d9m',
                name: 'FOODPREP Comment',
                translatedName: 'Tlhaloso ea FOODPREP',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YRUnLuPerwn',
                name: 'FOODPREV Follow-up date',
                translatedName: 'Letsatsi la ho latela FOODPREV',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tnspdPfpuXm',
                name: 'FOODPREV Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea FOODPREV',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'V1HnY5m2Pmv',
                name: 'FOODPREV Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa FOODPREV',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'eXh6Gag1uwp',
                name: 'FOODPREV Comment',
                translatedName: 'Tlhaloso ea FOODPREV',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vXuVPQLxw1d',
                name: 'FOODSUPP Follow-up date',
                translatedName: 'Letsatsi la ho latela FOODSUPP',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'QnFYeBNZlbf',
                name: 'FOODSUPP Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea FOODSUPP',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'EnrZPBFxZuX',
                name: 'FOODSUPP Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa FOODSUPP',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xdI5atw8DC4',
                name: 'FOODSUPP Comment',
                translatedName: 'Tlhaloso ea FOODSUPP',
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
                translatedName: 'Letsatsi la ho latela OVCFUND',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KvLYMr8F4vg',
                name: 'OVCFUND Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea OVCFUND',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'hnMy2l2pB3z',
                name: 'OVCFUND Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa OVCFUND',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TN5r1EFmHWz',
                name: 'OVCFUND Comment',
                translatedName: 'Tlhaloso ea OVCFUND',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WA8MAXBxaD1',
                name: 'SGROUP Follow-up date',
                translatedName: 'Letsatsi la ho latela SGROUP',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AnnOS2m6LZK',
                name: 'SGROUP Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SGROUP',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'UHWzhDsQdoB',
                name: 'SGROUP Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa SGROUP',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xECpX8Vt1rT',
                name: 'SGROUP Comment',
                translatedName: 'Tlhaloso ea SGROUP',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XXUKujRHZpn',
                name: 'EST COOPRTVS Follow-up date',
                translatedName: 'Letsatsi la ho latela EST COOPRTVS ',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kcoDiGNXWpA',
                name: 'EST COOPRTVS Service Provision Status',
                translatedName:
                    'Boemo ba Phano ea Litšebeletso ea EST COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'qwmtkJDotBk',
                name: 'EST COOPRTVS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa EST COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Z6VwHVRIh48',
                name: 'EST COOPRTVS Comment',
                translatedName: 'Tlhaloso ea EST COOPRTVS ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LseJW3MfsQB',
                name: 'FUNCT COOPRTVS Follow-up date',
                translatedName: 'Letsatsi la ho latela FUNCT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fgDPoYtifQI',
                name: 'FUNCT COOPRTVS Service Provision Status',
                translatedName:
                    'Boemo ba Phano ea Litšebeletso ea FUNCT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'lbCCs00yuGQ',
                name: 'FUNCT COOPRTVS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa FUNCT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TNmg7uRUWgC',
                name: 'FUNCT COOPRTVS Comment',
                translatedName: 'Tlhaloso ea FUNCT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'btnRZtDTyBN',
                name: 'MARKT COOPRTVS Follow-up date',
                translatedName: 'Letsatsi la ho latela MARKT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cbqS6IoSbwI',
                name: 'MARKT COOPRTVS Service Provision Status',
                translatedName:
                    'Boemo ba Phano ea Litšebeletso ea MARKT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'zKkaaSt1c8V',
                name: 'MARKT COOPRTVS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa MARKT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KpUgwivl5Cr',
                name: 'MARKT COOPRTVS Comment',
                translatedName: 'Tlhaloso ea MARKT COOPRTVS',
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
                translatedName: 'Letsatsi la ho latela SLION',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RNKOtUtLT4c',
                name: 'SLION Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SLION',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'sa79KxTFGFA',
                name: 'SLION Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa SLION',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EB3JPVqMdb4',
                name: 'SLION Comment',
                translatedName: 'Tlhaloso ea SLION',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'QBNhlIan0LR',
                name: 'RTEEN Follow-up date',
                translatedName: 'Letsatsi la ho latela RTEEN',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GImA3HB9YK5',
                name: 'RTEEN Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea RTEEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'fFuabYbLUjz',
                name: 'RTEEN Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa RTEEN',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IFggJCXLYPD',
                name: 'RTEEN Comment',
                translatedName: 'Tlhaloso ea RTEEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xbMtMJ9Uo5j',
                name: 'RKIDS Follow-up date',
                translatedName: 'Letsatsi la ho latela RKIDS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Fj2RbXsb8Yj',
                name: 'RKIDS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea RKIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'f90c5olxs5Z',
                name: 'RKIDS Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa RKIDS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EPwDypaz61A',
                name: 'RKIDS Comment',
                translatedName: 'Tlhaloso ea RKIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gEoY9RmjQAk',
                name: 'VAC Follow-up date',
                translatedName: 'Letsatsi la ho latela VAC',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rMtSykWZ4HB',
                name: 'VAC Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea VAC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'qwnfgBG2web',
                name: 'VAC Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa VAC',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'OMhFxj6SYhM',
                name: 'VAC Comment',
                translatedName: 'Tlhaloso ea VAC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZeDSleJMfKr',
                name: 'SURVIVORS Follow-up date',
                translatedName: 'Letsatsi la ho latela SURVIVORS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cuy4Ai7mBbA',
                name: 'SURVIVORS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SURVIVORS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'C5bhgqcq6Qn',
                name: 'SURVIVORS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa SURVIVORS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'h10Iktl4KKR',
                name: 'SURVIVORS Comment',
                translatedName: 'Tlhaloso ea SURVIVORS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BJ0jXcce2sw',
                name: 'COUNSEL Follow-up date',
                translatedName: 'Letsatsi la ho latela COUNSEL',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ysDSdiL7wNx',
                name: 'COUNSEL Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea COUNSEL',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'pBVmFpsSGN7',
                name: 'COUNSEL Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa COUNSEL',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XUoqvbk0uVH',
                name: 'COUNSEL Comment',
                translatedName: 'Tlhaloso ea COUNSEL',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iRJGpXzMCzp',
                name: 'FCARE Follow-up date',
                translatedName: 'Letsatsi la ho latela FCARE',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vj0R7ySdigX',
                name: 'FCARE Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea FCARE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'yW0TrzEslYO',
                name: 'FCARE Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa FCARE',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tmi1jtKYZs0',
                name: 'FCARE Comment',
                translatedName: 'Tlhaloso ea FCARE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MpOstKAuGPO',
                name: 'SHELTER Follow-up date',
                translatedName: 'Letsatsi la ho latela SHELTER',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JlRnllAlSk0',
                name: 'SHELTER Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SHELTER',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'VlOw6vrLsp5',
                name: 'SHELTER Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa SHELTER',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ONC3bpjq525',
                name: 'SHELTER Comment',
                translatedName: 'Tlhaloso ea SHELTER',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RZR0kUm9Ov8',
                name: 'ABUSE Follow-up date',
                translatedName: 'Letsatsi la ho latela ABUSE',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UZJ9vqIabAY',
                name: 'ABUSE Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea ABUSE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'pGDK3Y7tN2B',
                name: 'ABUSE Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa ABUSE',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'U8h0daQzXXk',
                name: 'ABUSE Comment',
                translatedName: 'Tlhaloso ea ABUSE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UVD4nyRh9G4',
                name: 'LEGALPROT Follow-up date',
                translatedName: 'Letsatsi la ho latela LEGALPROT',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gfKsz88uxtg',
                name: 'LEGALPROT Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea LEGALPROT',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'P06od0qmlSR',
                name: 'LEGALPROT Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa LEGALPROT',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iz4CvIFovsF',
                name: 'LEGALPROT Comment',
                translatedName: 'Tlhaloso ea LEGALPROT',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yHtXXWgvUPI',
                name: 'BIRTHCERT Follow-up Date',
                translatedName: 'Letsatsi la ho latela BIRTHCERT',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aGChpBlIzcd',
                name: 'BIRTHCERT Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea BIRTHCERT',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'AXLxNo9pz8c',
                name: 'BIRTHCERT Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa BIRTHCERT',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cb773khL7XB',
                name: 'BIRTHCERT Comment',
                translatedName: 'Tlhaloso ea BIRTHCERT',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373))
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
                translatedName: 'Letsatsi la ho latela AFLAS',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LcIB5EL3IjT',
                name: 'AFLAS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea AFLAS',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'zYrrrFd48S5',
                name: 'AFLAS Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa AFLAS',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WVsVwfErZ7V',
                name: 'AFLAS Comment',
                translatedName: 'Tlhaloso ea AFLAS',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'nqip0DmFucC',
                name: 'PTS4G Follow-up date',
                translatedName: 'Letsatsi la ho latela PTS4G',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EYhFIkTpUS3',
                name: 'PTS4G Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea PTS4G',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'rM13n9K4vE7',
                name: 'PTS4G Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa PTS4G',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VlReEXXH1WN',
                name: 'PTS4G Comment',
                translatedName: 'Tlhaloso ea PTS4G',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CiDZ0bP8sUk',
                name: 'PTS4NG Follow-up date',
                translatedName: 'Letsatsi la ho latela PTS4NG',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IiKUlAeSIE3',
                name: 'PTS4NG Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea PTS4NG',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'rUCb6Afcz9U',
                name: 'PTS4NG Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa PTS4NG',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'sD0zbIksKTY',
                name: 'PTS4NG Comment',
                translatedName: 'Tlhaloso ea PTS4NG',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VNX4rtSJ4GQ',
                name: 'HWCLUB Follow-up date',
                translatedName: 'Letsatsi la ho latela HWCLUB',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hg2bpp1HqwU',
                name: 'HWCLUB Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea HWCLUB',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'wB2jXLTYtDb',
                name: 'HWCLUB Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa HWCLUB',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Riyr0nniCVo',
                name: 'HWCLUB Comment',
                translatedName: 'Tlhaloso ea HWCLUB',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LO3eAKwk0gW',
                name: 'BURSARY Follow-up date',
                translatedName: 'Letsatsi la ho latela BURSARY',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fvgPnlOD7e9',
                name: 'BURSARY Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea BURSARY',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'JFetYCY5tza',
                name: 'BURSARY Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa BURSARY',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yuwtSD8EyoY',
                name: 'BURSARY Comment',
                translatedName: 'Tlhaloso ea BURSARY',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'J8iM7Hh2z3K',
                name: 'SFEES Follow-up date',
                translatedName: 'Letsatsi la ho latela SFEES',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MeMaUvt3O8j',
                name: 'SFEES Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SFEES',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'KZIjTeMl7sj',
                name: 'SFEES Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa SFEES',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KppYygPZ8BL',
                name: 'SFEES Comment',
                translatedName: 'Tlhaloso ea SFEES',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'FYBjYHD8050',
                name: 'SMATERIAL Follow-up date',
                translatedName: 'Letsatsi la ho latela SMATERIAL',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WQlWXUmYjI2',
                name: 'SMATERIAL Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SMATERIAL',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'gAMv1jxS0rh',
                name: 'SMATERIAL Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa SMATERIAL',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CxREUNzKxHB',
                name: 'SMATERIAL Comment',
                translatedName: 'Tlhaloso ea SMATERIAL',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yvAIdXNQevG',
                name: 'REENROL Follow-up date',
                translatedName: 'Letsatsi la ho latela REENROL',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Zc0M1jsbfyA',
                name: 'REENROL Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea REENROL',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
                ]),
            InputField(
                id: 'mLjRp8wJ8aW',
                name: 'REENROL Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa REENROL',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'QCbFgssCzeF',
                name: 'REENROL Comment',
                translatedName: 'Tlhaloso ea REENROL',
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
                  InputFieldOption(
                      code: 'Achieved',
                      name: 'Achieved',
                      translatedName: 'Hona le katleho'),
                  InputFieldOption(
                      code: 'In progress',
                      name: 'In progress',
                      translatedName: 'Tsoelo pele'),
                  InputFieldOption(
                      code: 'Not achieved',
                      name: 'Not achieved',
                      translatedName: 'Ha ho katleho e fihletsoeng')
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
