import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class HouseholdServiceFollowup {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          id: 'Health',
          name: 'DOMAIN HEALTH',
          translatedName: 'BOPHELO BO BOTLE',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'KDSYFiIefGN',
                name: 'HTS Follow-up date',
                translatedName: 'Letsatsi la ho latela HTS',
                allowFuturePeriod: true,
                disablePastPeriod: true,
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
                allowFuturePeriod: true,
                disablePastPeriod: true,
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
                allowFuturePeriod: true,
                disablePastPeriod: true,
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
                allowFuturePeriod: true,
                disablePastPeriod: true,
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
                allowFuturePeriod: true,
                disablePastPeriod: true,
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
                allowFuturePeriod: true,
                disablePastPeriod: true,
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
                id: 'Pfp7l7WWLEY',
                name: 'WASHMES Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela WASHMES',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gV77yUM8NK8',
                name: 'WASHMES Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea WASHMES',
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
                id: 'aqJBZDBzh4m',
                name: 'WASHMES Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa WASHMES',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JFlnkaXlXm5',
                name: 'WASHMES Comment',
                translatedName: 'Tlhaloso ea WASHMES',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ipDfOPUCPlB',
                name: 'SOACKAGE Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela SOACKAGE',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qL9c5r7c6kK',
                name: 'SOACKAGE Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SOACKAGE',
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
                id: 'pUphS6E1Gu5',
                name: 'SOACKAGE Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa SOACKAGE',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SODPuEmHEGV',
                name: 'SOACKAGE Comment',
                translatedName: 'Tlhaloso ea SOACKAGE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qfs6yQfH7lk',
                name: 'TIPPY Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela TIPPY',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'FRWCmEerPic',
                name: 'TIPPY Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea TIPPY',
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
                id: 'lQYnoeqfKpe',
                name: 'TIPPY Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa TIPPY',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'w4EYZpbtUV8',
                name: 'TIPPY Comment',
                translatedName: 'Tlhaloso ea TIPPY',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          id: 'Safe',
          name: 'DOMAIN SAFE',
          translatedName: 'TSIRELETSO',
          color: Color(0xFF0F9587),
          borderColor: Color(0xFF0F9587),
          inputFields: [
            InputField(
                id: 'xSpmXkwsULS',
                name: 'SILC Follow-up date',
                translatedName: 'Letsatsi la ho latela SILC',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xTO562B5g53',
                name: 'SILC Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SILC',
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
                id: 'uOMr56xoKDh',
                name: 'SILC Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa SILC',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hMdC0CMKSGn',
                name: 'SILC Comment',
                translatedName: 'Tlhaloso ea SILC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'dWu9d1DgNkz',
                name: 'FE Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela FE',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'lpTVK3t1Ahk',
                name: 'FE Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea FE',
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
                id: 'j1yzHzO0w6w',
                name: 'FE Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa FE',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'QnfPxpJvb1D',
                name: 'FE Comment',
                translatedName: 'Tlhaloso ea FE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XXUKujRHZpn',
                name: 'EST COOPRTVS Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela EST COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kcoDiGNXWpA',
                name: 'EST COOPRTVS Service Provision Status',
                translatedName:
                    'Boemo ba Phano ea Litšebeletso ea EST COOPRTVS',
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
                id: 'qwmtkJDotBk',
                name: 'EST COOPRTVS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa EST COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Z6VwHVRIh48',
                name: 'EST COOPRTVS Comment',
                translatedName: 'Tlhaloso ea EST COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LseJW3MfsQB',
                name: 'FUNCT COOPRTVS Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela FUNCT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fgDPoYtifQI',
                name: 'FUNCT COOPRTVS Service Provision Status',
                translatedName:
                    'Boemo ba Phano ea Litšebeletso ea FUNCT COOPRTVS',
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
                id: 'lbCCs00yuGQ',
                name: 'FUNCT COOPRTVS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa FUNCT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TNmg7uRUWgC',
                name: 'FUNCT COOPRTVS Comment',
                translatedName: 'Tlhaloso ea FUNCT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'btnRZtDTyBN',
                name: 'MARKT COOPRTVS Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela MARKT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cbqS6IoSbwI',
                name: 'MARKT COOPRTVS Service Provision Status',
                translatedName:
                    'Boemo ba Phano ea Litšebeletso ea MARKT COOPRTVS',
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
                id: 'zKkaaSt1c8V',
                name: 'MARKT COOPRTVS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa MARKT COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KpUgwivl5Cr',
                name: 'MARKT COOPRTVS Comment',
                translatedName: 'Tlhaloso ea MARKT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'O84rxMOQ52U',
                name: 'K/TPLOTS Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela K/TPLOTS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'lEkrLOFmLrH',
                name: 'K/TPLOTS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea K/TPLOTS',
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
                id: 'F8ALMOcc6C1',
                name: 'K/TPLOTS Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa K/TPLOTS',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'p77CBdxxtHI',
                name: 'K/TPLOTS Comment',
                translatedName: 'Tlhaloso ea K/TPLOTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          id: 'Schooled',
          name: 'DOMAIN SCHOOLED',
          translatedName:'TSA SEKOLO',
          color: Color(0xFF9B2BAE),
          borderColor: Color(0xFF9B2BAE),
          inputFields: [
            InputField(
                id: 'dXmaqyn9DME',
                name: 'P&FC Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela P&FC',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gwwUOs6yt6C',
                name: 'P&FC Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea P&FC',
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
                id: 'w2HlBCfHbZR',
                name: 'P&FC Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa P&FC',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aG42nUguLLW',
                name: 'P&FC Comment',
                translatedName: 'Tlhaloso ea P&FC',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gEoY9RmjQAk',
                name: 'VAC Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela VAC',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rMtSykWZ4HB',
                name: 'VAC Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea VAC',
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
                id: 'qwnfgBG2web',
                name: 'VAC Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa VAC',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'OMhFxj6SYhM',
                name: 'VAC Comment',
                translatedName: 'Tlhaloso ea VAC',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZeDSleJMfKr',
                name: 'SURVIVORS Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela SURVIVORS',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cuy4Ai7mBbA',
                name: 'SURVIVORS Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea SURVIVORS',
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
                id: 'C5bhgqcq6Qn',
                name: 'SURVIVORS Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa SURVIVORS',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'h10Iktl4KKR',
                name: 'SURVIVORS Comment',
                translatedName: 'Tlhaloso ea SURVIVORS',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BJ0jXcce2sw',
                name: 'COUNSEL Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela COUNSEL',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ysDSdiL7wNx',
                name: 'COUNSEL Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea COUNSEL',
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
                id: 'pBVmFpsSGN7',
                name: 'COUNSEL Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa COUNSEL',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XUoqvbk0uVH',
                name: 'COUNSEL Comment',
                translatedName: 'Tlhaloso ea COUNSEL',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RZR0kUm9Ov8',
                name: 'ABUSE Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela ABUSE',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UZJ9vqIabAY',
                name: 'ABUSE Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea ABUSE',
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
                id: 'pGDK3Y7tN2B',
                name: 'ABUSE Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa ABUSE',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'U8h0daQzXXk',
                name: 'ABUSE Comment',
                translatedName: 'Tlhaloso ea ABUSE',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UVD4nyRh9G4',
                name: 'LEGALPROT Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela LEGALPROT',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gfKsz88uxtg',
                name: 'LEGALPROT Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea LEGALPROT',
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
                id: 'P06od0qmlSR',
                name: 'LEGALPROT Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa LEGALPROT',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iz4CvIFovsF',
                name: 'LEGALPROT Comment',
                translatedName: 'Tlhaloso ea LEGALPROT',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yHtXXWgvUPI',
                name: 'BIRTHCERT Follow-up Date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela BIRTHCERT',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aGChpBlIzcd',
                name: 'BIRTHCERT Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea BIRTHCERT',
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
                id: 'AXLxNo9pz8c',
                name: 'BIRTHCERT Service Provision Date',
                translatedName:
                    'Letsatsi la Kabo ea Litšebeletso tsa BIRTHCERT',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cb773khL7XB',
                name: 'BIRTHCERT Comment',
                translatedName: 'Tlhaloso ea BIRTHCERT',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'Domain Stable',
          color: Color(0xFF0000FF),
          borderColor: Color(0xFF0000FF),
          inputFields: [
            InputField(
                id: 'nqip0DmFucC',
                name: 'PTS4G Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela PTS4G',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EYhFIkTpUS3',
                name: 'PTS4G Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea PTS4G',
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
                id: 'rM13n9K4vE7',
                name: 'PTS4G Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa PTS4G',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VlReEXXH1WN',
                name: 'PTS4G Comment',
                translatedName: 'Tlhaloso ea PTS4G',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CiDZ0bP8sUk',
                name: 'PTS4NG Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela PTS4NG',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IiKUlAeSIE3',
                name: 'PTS4NG Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea PTS4NG',
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
                id: 'rUCb6Afcz9U',
                name: 'PTS4NG Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa PTS4NG',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'sD0zbIksKTY',
                name: 'PTS4NG Comment',
                translatedName: 'Tlhaloso ea PTS4NG',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VNX4rtSJ4GQ',
                name: 'HWCLUB Follow-up date',
                allowFuturePeriod: true,
                disablePastPeriod: true,
                translatedName: 'Letsatsi la ho latela HWCLUB',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hg2bpp1HqwU',
                name: 'HWCLUB Service Provision Status',
                translatedName: 'Boemo ba Phano ea Litšebeletso ea HWCLUB',
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
                id: 'wB2jXLTYtDb',
                name: 'HWCLUB Service Provision Date',
                translatedName: 'Letsatsi la Kabo ea Litšebeletso tsa HWCLUB',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Riyr0nniCVo',
                name: 'HWCLUB Comment',
                translatedName: 'Tlhaloso ea HWCLUB',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
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
                allowFuturePeriod: true,
                disablePastPeriod: true,
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
