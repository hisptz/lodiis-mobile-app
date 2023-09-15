import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class OvcServicesCasePlan {
  static List<String> getMandatoryField() {
    return [OvcCasePlanConstant.houseHoldCategorizationDataElement];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Household Categorization',
          color: const Color(0xFF4D9E49),
          id: OvcCasePlanConstant.householdCategorizationSection,
          inputFields: [
            InputField(
              id: OvcCasePlanConstant.houseHoldCategorizationDataElement,
              name: 'Household categorization/prioritization',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4A9F46),
              labelColor: const Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: 'Red: HH visited/monitored regularly',
                  name: 'Red: HH visited/monitored regularly',
                ),
                InputFieldOption(
                  code: 'Yellow: HH visited/monitored monthly',
                  name: 'Yellow: HH visited/monitored monthly',
                ),
                InputFieldOption(
                  code: 'Green: HH visited/monitored quarterly',
                  name: 'Green: HH visited/monitored quarterly',
                ),
              ],
            )
          ]),
      FormSection(
        name: 'DOMAIN HEALTH',
        translatedName: 'BOPHELO BO BOTLE',
        id: 'Health',
        color: const Color(0xFF4D9E49),
        borderColor: const Color(0xFF4D9E49),
        inputFields: [
          InputField(
            id: 'ADc3clrQRl4',
            name: 'Goal 1',
            translatedName: 'Sepheo 1',
            valueType: 'TEXT',
            inputColor: const Color(0xFF4A9F46),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                code: 'KnowledgeableAboutHIVEducation',
                name: 'Knowledgeable about HIV education',
              ),
              InputFieldOption(
                code: 'To adhere to ART',
                name: 'To adhere to ART',
              ),
              InputFieldOption(
                code: 'Proper nutrition for my children',
                name: 'Proper nutrition for my children',
              ),
              InputFieldOption(
                code: 'Access to PMTCT services',
                name: 'Access to PMTCT services',
              ),
            ],
          ),
          InputField(
            id: 'efNgDIqhlNs',
            name: 'Goal 2',
            translatedName: 'Sepheo 2',
            valueType: 'TEXT',
            inputColor: const Color(0xFF4A9F46),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                code: 'KnowledgeableAboutHIVEducation',
                name: 'Knowledgeable about HIV education',
              ),
              InputFieldOption(
                code: 'To adhere to ART',
                name: 'To adhere to ART',
              ),
              InputFieldOption(
                code: 'Proper nutrition for my children',
                name: 'Proper nutrition for my children',
              ),
              InputFieldOption(
                code: 'Access to PMTCT services',
                name: 'Access to PMTCT services',
              ),
            ],
          ),
        ],
      ),
      FormSection(
        id: 'Stable',
        name: 'DOMAIN STABLE',
        translatedName: 'BOTSITSO',
        color: const Color(0xFF0000FF),
        borderColor: const Color(0xFF0000FF),
        inputFields: [
          InputField(
            id: 'ADc3clrQRl4',
            name: 'Goal 1',
            translatedName: 'Sepheo 1',
            valueType: 'TEXT',
            inputColor: const Color(0xFF0000FF),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Knowledgeable about food security',
                  name: 'Knowledgeable about food security'),
              InputFieldOption(
                  code: 'Learn about food production and preservation',
                  name: 'Learn about food production and preservation'),
              InputFieldOption(
                  code: 'To improve my family financial status',
                  name: 'To improve my family financial status'),
            ],
          ),
          InputField(
            id: 'efNgDIqhlNs',
            name: 'Goal 2',
            translatedName: 'Sepheo 2',
            valueType: 'TEXT',
            inputColor: const Color(0xFF0000FF),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Knowledgeable about food security',
                  name: 'Knowledgeable about food security'),
              InputFieldOption(
                  code: 'Learn about food production and preservation',
                  name: 'Learn about food production and preservation'),
              InputFieldOption(
                  code: 'To improve my family financial status',
                  name: 'To improve my family financial status'),
            ],
          ),
        ],
      ),
      FormSection(
        id: 'Safe',
        name: 'DOMAIN SAFE',
        translatedName: 'TSIRELETSO',
        color: const Color(0xFF0F9587),
        borderColor: const Color(0xFF0F9587),
        inputFields: [
          InputField(
            id: 'ADc3clrQRl4',
            name: 'Goal 1',
            translatedName: 'Sepheo 1',
            valueType: 'TEXT',
            inputColor: const Color(0xFF0F9587),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Knowledgeable about VAC',
                  name: 'Knowledgeable about VAC'),
              InputFieldOption(
                  code: 'Knowledgeable about child protection',
                  name: 'Knowledgeable about child protection'),
            ],
          ),
          InputField(
            id: 'efNgDIqhlNs',
            name: 'Goal 2',
            translatedName: 'Sepheo 2',
            valueType: 'TEXT',
            inputColor: const Color(0xFF0F9587),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Knowledgeable about VAC',
                  name: 'Knowledgeable about VAC'),
              InputFieldOption(
                  code: 'Knowledgeable about child protection',
                  name: 'Knowledgeable about child protection'),
            ],
          ),
        ],
      ),
      FormSection(
        id: 'Schooled',
        name: 'DOMAIN SCHOOLED',
        translatedName: 'TSA SEKOLO',
        color: const Color(0xFF9B2BAE),
        borderColor: const Color(0xFF9B2BAE),
        inputFields: [
          InputField(
            id: 'ADc3clrQRl4',
            name: 'Goal 1',
            translatedName: 'Sepheo 1',
            valueType: 'TEXT',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Better school attendance and performance',
                  name: 'Better school attendance and performance'),
              InputFieldOption(
                  code: 'Equipped with social assets for better living',
                  name: 'Equipped with social assets for better living'),
            ],
          ),
          InputField(
            id: 'efNgDIqhlNs',
            name: 'Goal 2',
            translatedName: 'Sepheo 2',
            valueType: 'TEXT',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Better school attendance and performance',
                  name: 'Better school attendance and performance'),
              InputFieldOption(
                  code: 'Equipped with social assets for better living',
                  name: 'Equipped with social assets for better living'),
            ],
          ),
        ],
      ),
    ];
  }
}
