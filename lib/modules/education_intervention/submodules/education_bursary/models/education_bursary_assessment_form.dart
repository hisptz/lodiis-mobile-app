import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';

class EducationBursaryAssessment {
  static List<String> getMandatoryField() {
    return ["location"];
  }

  static List<FormSection> getFormSections() {
    return [
      // TODO number the fields
      FormSection(
        id: '',
        name: "SECTION A: GEOGRAPHICAL INFORMATION",
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'location',
            name: 'Location',
            translatedName: 'Sebaka',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [3],
            // filteredPrograms: [BursaryInterventionConstant.program],
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'RB8Wx75hGa4',
            name: 'Village',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'fEPLlRZiwve',
            name: 'Nearby available schools for the child',
            valueType: 'LONG_TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
          id: '',
          name: "SECTION B: CHILD DEMOGRAPHIC AND INFORMATION",
          color: Color(0xFF009688),
          inputFields: [
            InputField(
              id: 'WTZ7GLTrE8Q',
              name: 'First Name',
              translatedName: 'Lebitso la pele',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 's1HaiT6OllL',
              name: 'Middle Name',
              translatedName: 'Lebitso le mahareng',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'rSP9c21JsfC',
              name: 'Surname',
              translatedName: 'Le Fane',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'pJ5NAEmwnDq',
              name: '2. Birth certificate available',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'cYn1nmlwBdW',
              name: 'Reason why birth certificate is not available',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'WXhb5L2Zisd',
              name: '3. Identification card available',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'qWXojsKR6VU',
              name: 'Reasong why Identification card is not available',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'qZP982qpSPS',
              name: '4. Date of Birth',
              translatedName: 'Letsatsi la tsoalo',
              valueType: 'DATE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'ls9hlz2tyol',
              name: 'Age',
              translatedName: 'Lilemo',
              isReadOnly: true,
              valueType: 'NUMBER',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'vIX4GTSCX4P',
              name: '5. Sex',
              translatedName: 'Boleng',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              renderAsRadio: true,
              options: [
                InputFieldOption(
                  code: "Male",
                  name: "Male",
                  translatedName: 'Botona',
                ),
                InputFieldOption(
                  code: "Female",
                  name: "Female",
                  translatedName: 'Botsehali',
                ),
              ],
            ),
            InputField(
              id: 'OL0bjS9XQsh',
              name: '6. Schooling',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'why_not_schooling',
              name: '7. Why out of school?',
              valueType: 'CHECK_BOX',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "o6hMHAcDejV",
                  name: "Cost of fee",
                ),
                InputFieldOption(
                  code: "zQPns75P1XA",
                  name: "Disabled",
                ),
                InputFieldOption(
                  code: "Ne8BaB6rCZX",
                  name: "Caregiver can't afford necessity",
                ),
                InputFieldOption(
                  code: "Az3Rtp5Mtey",
                  name: "Not important",
                ),
                InputFieldOption(
                  code: "eOOYt94C8G7",
                  name: "Not interested",
                ),
                InputFieldOption(
                  code: "oIGWbCQTZ8w",
                  name: "Pregnancy",
                ),
                InputFieldOption(
                  code: "yK3ovFC1uGO",
                  name: "School too far",
                ),
                InputFieldOption(
                  code: "h2LrMC9ep8E",
                  name: "Other",
                ),
              ],
            ),
            InputField(
              id: 'tbzi0t27D8l',
              name: '8. Grade to be attended',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "Grade 8",
                  name: "Grade 8",
                ),
                InputFieldOption(
                  code: "Grade 9",
                  name: "Grade 9",
                ),
                InputFieldOption(
                  code: "Grade 10",
                  name: "Grade 10",
                ),
                InputFieldOption(
                  code: "Grade 11",
                  name: "Grade 11",
                ),
              ],
            ),
            InputField(
              id: 'Ze2W9vkrfrL',
              name:
                  '9. If given an opportunity would you like to go back to school',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'zLn55LntBLP',
              name: 'If not, please state the reasons',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            // TODO see how to present this
            // InputField(
            //   id: '',
            //   name: '10. What do you think can be done to support you as a student to succeed or thrive in school',
            //   valueType: 'TEXT',
            //   inputColor: Color(0xFF009688),
            //   labelColor: Color(0xFF737373),
            // ),
            InputField(
              id: 'type_of_disability',
              name: '11. Do you or any of your sibling have a disability?',
              valueType: 'CHECK_BOX',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "TPRVr4ua9f9",
                  name: "Vision",
                ),
                InputFieldOption(
                  code: "",
                  name: "Hearing",
                ),
                InputFieldOption(
                  code: "X3MQhmVA1Jt",
                  name: "Physical",
                ),
                InputFieldOption(
                  code: "KPsuBw6mn81",
                  name: "Speech",
                ),
                InputFieldOption(
                  code: "BfbiOanp9Pi",
                  name: "Mental",
                ),
                InputFieldOption(
                  code: "ZAgwp8OV3Az",
                  name: "Multiple disability",
                ),
                // TODO no others option
              ],
            ),
          ]),
      FormSection(
        id: '',
        name: "SECTION C. CAREGIVER INFORMATION",
        color: Color(0xFF009688),
      ),
      FormSection(
          id: '',
          name: 'SECTION D. VULNERABILITY',
          color: Color(0xFF009688),
          inputFields: [
            InputField(
                id: 'x7HZOLCazVg',
                name: '1. How many times a day does the household eat?',
                valueType: 'TEXT',
                inputColor: Color(0xFF009688),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: "Always", name: "Always"),
                  InputFieldOption(code: "Often", name: "Often"),
                  InputFieldOption(code: "Sometimes", name: "Sometimes"),
                  InputFieldOption(code: "Never", name: "Never"),
                ]),
            InputField(
                id: 'PyAH5nY83o3',
                name:
                    '2. Does the household experience hunger that it cannot address on regular basis?',
                valueType: 'TEXT',
                inputColor: Color(0xFF009688),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: "More than 4 times", name: "More than 4 times"),
                  InputFieldOption(code: "3 to 4 times", name: "3 to 4 times"),
                  InputFieldOption(code: "1 to 2 times", name: "1 to 2 times"),
                  InputFieldOption(code: "Often 0", name: "Often 0"),
                ]),
            InputField(
                id: 'om8s3kpQnjI',
                inputColor: Color(0xFF009688),
                labelColor: Color(0xFF737373),
                name:
                    '3. Is any member of the household unable to perform their daily activities due to a physical or mental disability?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'ZhNIc0pp5IC',
                name:
                    '4. If you responded yes to question 3 who is his/her primary caregiver?',
                valueType: 'TEXT',
                inputColor: Color(0xFF009688),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Myself (caregiver)', name: 'Myself (caregiver)'),
                  InputFieldOption(code: 'Sibling', name: 'Sibling'),
                  InputFieldOption(
                      code: 'Another household member',
                      name: 'Another household member'),
                ]),
            InputField(
                id: 'illness',
                name:
                    'Does anyone in the household suffer from one of the following chronic/terminal illness?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF009688),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'ZYHhJzDEROg', name: 'HIV'),
                  InputFieldOption(code: 'x3fV8DsCs1V', name: 'Cancer'),
                  InputFieldOption(code: 'SEmpuVncKMP', name: 'TB'),
                  InputFieldOption(
                      code: 'FYQGgPhYQcy', name: 'Both TB and HIV'),
                  // TODO no others option
                  // InputFieldOption(code: '', name: ''),
                ])
          ]),
      FormSection(
          id: '',
          name: 'SECTION E. HOUSEHOLD ASSETS',
          color: Color(0xFF009688),
          inputFields: [
            InputField(
              id: 'used_for_cooking',
              name: '1. What does the household use for cooking?',
              valueType: 'CHECK_BOX',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "TPRVr4ua9f9",
                  name: "Vision",
                ),
                InputFieldOption(
                  code: "",
                  name: "Hearing",
                ),
                InputFieldOption(
                  code: "X3MQhmVA1Jt",
                  name: "Physical",
                ),
                InputFieldOption(
                  code: "KPsuBw6mn81",
                  name: "Speech",
                ),
                InputFieldOption(
                  code: "BfbiOanp9Pi",
                  name: "Mental",
                ),
                InputFieldOption(
                  code: "ZAgwp8OV3Az",
                  name: "Multiple disability",
                ),
              ],
            ),
            InputField(
              id: 'used_for_cooking',
              name: '2. How many rooms does the house have?',
              hint: 'including kitchen, bathroom and stand-alone rooms',
              valueType: 'TEXT',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "1",
                  name: "1",
                ),
                InputFieldOption(
                  code: "2",
                  name: "2",
                ),
                InputFieldOption(
                  code: "3",
                  name: "3",
                ),
                InputFieldOption(
                  code: "4",
                  name: "4",
                ),
                InputFieldOption(
                  code: "5",
                  name: "5",
                ),
                InputFieldOption(
                  code: "More than 5",
                  name: "More than 5",
                ),
              ],
            ),
            InputField(
              id: 'type_of_toilet',
              name: '3. What type of toilet is frequently used?',
              valueType: 'CHECK_BOX',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "TPRVr4ua9f9",
                  name: "Vision",
                ),
                InputFieldOption(
                  code: "",
                  name: "Hearing",
                ),
                InputFieldOption(
                  code: "X3MQhmVA1Jt",
                  name: "Physical",
                ),
                InputFieldOption(
                  code: "KPsuBw6mn81",
                  name: "Speech",
                ),
                InputFieldOption(
                  code: "BfbiOanp9Pi",
                  name: "Mental",
                ),
                InputFieldOption(
                  code: "ZAgwp8OV3Az",
                  name: "Multiple disability",
                ),
              ],
            ),
            InputField(
              id: 'household_items',
              name: '4. Does the household have the following items?',
              valueType: 'CHECK_BOX',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "",
                  name: "Electric or gas stove",
                ),
                InputFieldOption(
                  code: "",
                  name: "Refrigerator/Freezer ",
                ),
                InputFieldOption(
                  code: "",
                  name: "Television",
                ),
                InputFieldOption(
                  code: "",
                  name: "Radio/Audio Equipment",
                ),
                InputFieldOption(
                  code: "",
                  name: "Cell phone",
                ),
                InputFieldOption(
                  code: "",
                  name: "Land line",
                ),
                InputFieldOption(
                  code: "",
                  name: "Sewing or knitting machine",
                ),
                InputFieldOption(
                  code: "",
                  name: "Motorised vehicle",
                ),
              ],
            ),
            InputField(
              id: 'z4z7ow7yriM',
              name: 'Number of Electric or gas stove',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'BnYxw1cOirn',
              name: 'Number of Refrigerator/Freezer',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'l9thzEZzGrK',
              name: 'Number of Television',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'rzeyShjMVHO',
              name: 'Number of Radio/Audio Equipment',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'FMLuCvm2yTI',
              name: 'Number of Cell phone',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'ziBNi3VfdQU',
              name: 'Number of Land line',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'o4Bi74oylwo',
              name: 'Number of Sewing or knitting machine',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'Z0XaEgRPvkM',
              name: 'Number of Motorised vehicle',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'household_animals',
              name:
                  '5. Is the household in possession of one or more of the following?',
              valueType: 'CHECK_BOX',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "",
                  name: "Horse",
                ),
                InputFieldOption(
                  code: "",
                  name: "Cattle",
                ),
                InputFieldOption(
                  code: "",
                  name: "Sheep",
                ),
                InputFieldOption(
                  code: "",
                  name: "Goat",
                ),
                InputFieldOption(
                  code: "",
                  name: "Poultry",
                ),
                InputFieldOption(
                  code: "",
                  name: "Donkey",
                ),
              ],
            ),
            InputField(
              id: 'yKUVT2msSLT',
              name: 'Number of Horse',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'QBxpDou3jlE',
              name: 'Number of Cattle',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'pkVU7LVIO9W',
              name: 'Number of Sheep',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'WoSdTNgH4Mz',
              name: 'Number of Goat',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'LtyzmIBWl7w',
              name: 'Number of Poultry',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'VQbVQea2s7n',
              name: 'Number of Donkey',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'household_properties',
                name:
                    '6. Does the household own any of the following properties?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF009688),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                    code: "OeEHpwWkzgf",
                    name: "Rental Houses",
                  ),
                  InputFieldOption(
                    code: "dUwwS3Gp7OU",
                    name: "Residential House",
                  ),
                ]),
            InputField(
              id: 'ykg7pxiVcSc',
              name: 'Number of Rental Houses',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'BjIO7hTeor3',
              name: 'Number of Residential House',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'OgtRbjHVRsL',
              name: '7. Does the family have any source of food?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'source_of_food',
              name: '8. Where does the family get the food?',
              valueType: 'CHECK_BOX',
              inputColor: Color(0xFF009688),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                  code: "ZXh2TONkbpg",
                  name: "Home gardens",
                ),
                InputFieldOption(
                  code: "Cl7FM19srOJ",
                  name: "Fields",
                ),
                InputFieldOption(
                  code: "iwDJ7qX8FIH",
                  name: "Keyhole gardening",
                ),
                InputFieldOption(
                  code: "YKU1ZAeRlVc",
                  name: "Store-bought",
                ),
              ],
            ),
          ]),
      FormSection(
        id: '',
        color: Color(0xFF009688),
        name: 'Vulnerability Criteria',
        inputFields: [
          InputField(
            id: '',
            name: 'Needy double orphan',
            valueType: 'TRUE_ONLY',
            isReadOnly: true,
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: '',
            name: 'Needy single orphan',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF009688),
            isReadOnly: true,
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: '',
            name: 'Needy children with both parents',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF009688),
            isReadOnly: true,
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: '',
            name: 'Abandoned children',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF009688),
            isReadOnly: true,
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: '',
            name: 'Needy children with disability',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF009688),
            isReadOnly: true,
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: '',
            name: 'Aged 13-17 boys and girls',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF009688),
            isReadOnly: true,
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: '',
            name: 'In post primary',
            translatedName: 'Mafu a likobo',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF009688),
            isReadOnly: true,
            labelColor: Color(0xFF737373),
          ),
        ],
      )
    ];
  }
}
