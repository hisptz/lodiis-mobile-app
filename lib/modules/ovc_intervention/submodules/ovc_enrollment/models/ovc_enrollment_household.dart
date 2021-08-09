import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentHousehold {
  static List<String> getMandatoryField() {
    return [];
  }

  static List<String> getHiddenField() {
    return ['yk0OH9p09C1', 'PN92g65TkVI'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Household Information',
          color: Color(0xFF1A3518),
          subSections: [
            FormSection(name: '', color: Color(0xFF737373), inputFields: [
              InputField(
                id: 'location',
                name: 'Location',
                translatedName: 'Sebaka',
                isReadOnly: true,
                allowedSelectedLevels: [3, 4],
                valueType: 'ORGANISATION_UNIT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
              ),
              InputField(
                id: 'RB8Wx75hGa4',
                name: 'Village',
                translatedName: 'Motse',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
              ),
              InputField(
                  id: 'xiI8aC8RwjC',
                  name: 'Sub-village',
                  translatedName: 'Motsana',
                  valueType: 'TEXT',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373))
            ]),
            FormSection(
                name: 'Caregiver',
                translatedName: "Mohlokomeli",
                color: Color(0xFF737373),
                inputFields: [
                  InputField(
                    id: 'WTZ7GLTrE8Q',
                    name: 'First Name',
                    translatedName: 'Lebitso la pele',
                    valueType: 'TEXT',
                    isReadOnly: true,
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 's1HaiT6OllL',
                    name: 'Middle Name',
                    translatedName: 'Lebitso le mahareng',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'rSP9c21JsfC',
                    name: 'Surname',
                    translatedName: 'Le Fane',
                    valueType: 'TEXT',
                    isReadOnly: true,
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'tNdoR0jYr7R',
                    name: 'Phone Number',
                    translatedName: 'Nomoro ea mohala',
                    valueType: 'PHONE_NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'qZP982qpSPS',
                    name: 'Date of Birth',
                    translatedName: 'Letsatsi la tsoalo ',
                    valueType: 'DATE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                    minAgeInYear: 18,
                    hint: "Beneficiary's age should be 18 years and above",
                    translatedHint: "Lilemo tsa setho li be 18+",
                  ),
                  InputField(
                    id: 'ls9hlz2tyol',
                    name: 'Age',
                    translatedName: 'Lilemo',
                    isReadOnly: true,
                    valueType: 'NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                      id: 'vIX4GTSCX4P',
                      name: 'Sex',
                      translatedName: 'Boleng',
                      isReadOnly: true,
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      renderAsRadio: true,
                      options: [
                        InputFieldOption(
                            code: 'Male',
                            name: 'Male',
                            translatedName: 'Botona'),
                        InputFieldOption(
                            code: 'Female',
                            name: 'Female',
                            translatedName: 'Botsehali'),
                      ]),
                  InputField(
                      id: 's1eRvsL2Ly4',
                      name: 'Marital Status',
                      translatedName: 'Maemo a lenyalo',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Married', name: 'Married'),
                        InputFieldOption(code: 'Single', name: 'Single'),
                        InputFieldOption(code: 'Widowed', name: 'Widowed'),
                        InputFieldOption(
                            code: 'Divorced/separated',
                            name: 'Divorced/separated'),
                      ]),
                  InputField(
                    id: 'l9tcZ2TNgx6',
                    name:
                        'Male aged above 18 years and above currently living in household',
                    translatedName:
                        'Palo ea banna ba fetang lilemo tse 18 ba phelang kahare ho lelapa',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'rGAQnszNGVN',
                    name:
                        'Female aged 18 years and above currently living in household',
                    translatedName:
                        'Palo ea basali ba ka holimo ho lilemo tse 18 ba phelang kahare ho lelapa',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'kQehaqmaygZ',
                    isReadOnly: true,
                    name: 'Male aged below 18 years living in household',
                    translatedName:
                        'Kakaretso ea bashanyana ba ka tlase ho lilemo tse 18 ba lula kahare ho lelapa',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'BXUNH6LXeGA',
                    isReadOnly: true,
                    name:
                        'Female aged below 18 years currently living in household',
                    translatedName:
                        'Kakaretso ea banana ba ka tlase ho lilemo tse 18 ba lula kahare ho lelapa',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                ]),
          ]),
      //   FormSection(
      //       name: 'THEMATIC AREA',
      //       translatedName: 'LIPOTSO KA MEKHAHLELO',
      //       color: Color(0xFF1A3518),
      //       subSections: [
      //         FormSection(
      //             name: 'ECONOMIC STRENGTHENING',
      //             translatedName: 'NTLAFATSO EA MAEMO A MORUO',
      //             color: Color(0xFF4B9F46),
      //             borderColor: Color(0xFF4B9F46),
      //             inputFields: [
      //               InputField(
      //                 id: 'j0S43gUicDQ',
      //                 name:
      //                     '2. In the last 6 months, has there been at least one member of the household who has consistently had formal or informal employment or is self-employed or has a business or is engaged in an economically productive activity',
      //                 translatedName:
      //                     '2. Likhoeling tse tšeletseng tse fetileng, na ho na le e mong oa lelapa ea fumaneng mosebetsi oa nako eohle kapa oa nakoana kapa ea itsebetsang kapa ea nang le khoebo?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF4B9F46),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'a1GCj5jDaQo',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF4B9F46)),
      //               ),
      //               InputField(
      //                 id: 'E35x1FwfeW7',
      //                 name:
      //                     '3. The last time there was an unexpected urgent household expense (e.g. emergency medical expense, natural disaster – flooding, hail, drought, fire, funeral or house repair), someone in the household was able to pay for that expense',
      //                 translatedName:
      //                     '3. Nakong e fitileng haeba le kile la ba boemong ba ho ba le litlhoko tsa ts’ohanyetso tse hlokang chelete (joaloka, lefu, ho lokisa ntlo, likoluoa tse kang likhohola, sefako, komello, mollo), na ho na le motho lapeng moo ea ileng a lefa lišenyehelo tseo?',
      //                 valueType: 'TEXT',
      //                 options: [
      //                   InputFieldOption(
      //                       code: 'Yes', name: 'Yes', translatedName: 'E'),
      //                   InputFieldOption(
      //                       code: 'No', name: 'No', translatedName: 'Cha'),
      //                   InputFieldOption(
      //                       code: 'N/A', name: 'N/A', translatedName: 'N/A'),
      //                 ],
      //                 inputColor: Color(0xFF4B9F46),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'DoiVyCUvNwh',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF4B9F46)),
      //               ),
      //               InputField(
      //                 id: 'DDpCbfzDCIn',
      //                 name:
      //                     '4. Does the primary caregiver have any form of severe disability that prevents him/her from engaging in economically productive activities? (e.g., physical, speech, visual, hearing, or intellectual disability)',
      //                 translatedName:
      //                     '4. Na mohlokomeli o phela le bokooa bo mo sitisang ho sebetsa (joaloka, bokooa ba masapo, ba puo, ba pono, ba kutlo, ba kelello?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF4B9F46),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'p1FAnyICtQ7',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF4B9F46)),
      //               ),
      //               InputField(
      //                 id: 'ItSpu4jJ4IM',
      //                 name: 'ECONOMIC STRENGTHENING - Vulnerability',
      //                 translatedName: 'Lelapa le tlokotsing ea moruo?',
      //                 valueType: 'BOOLEAN',
      //                 isReadOnly: true,
      //                 background: Color(0xFFECF5EC),
      //                 inputColor: Color(0xFF4B9F46),
      //               )
      //             ]),
      //         FormSection(
      //             name: 'SURVIVAL AND HEALTH',
      //             translatedName: 'NTLAFATSO EA MAEMO A MORUO',
      //             color: Color(0xFF9C27B0),
      //             borderColor: Color(0xFF9C27B0),
      //             inputFields: [
      //               InputField(
      //                 id: 'tIl7nKaeO0K',
      //                 name:
      //                     '5. Has the household eaten at least 2 healthy (balanced) meals a day, every day, for the last month',
      //                 translatedName:
      //                     '5. Na lelapa le jele bonyane ha 2 letsatsi le leng le le leng lijo tse nepahetseng  khoeling e fetileng?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF9C27B0),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'NYhFMrN0Fl2',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF9C27B0)),
      //               ),
      //               InputField(
      //                 id: 'rGHJIwsGFhM',
      //                 name:
      //                     '6. In the last month, did any child in the household go a whole day without eating anything because there wasn’t enough to eat? [In case of visibly malnourished child, Circle yes and refer]',
      //                 translatedName:
      //                     '6. Na ho na le ngoana lapeng moo ea ileng a qeta letsatsi lohle a sa je hobane ho ne ho se na lijo khoeling e fetileng,?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF9C27B0),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'q8qSTyjhTmz',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF9C27B0)),
      //               ),
      //               InputField(
      //                 id: 'TpjxuuSY2Do',
      //                 name:
      //                     '7. Did the household produce any crops and vegetables in the last 6 months?',
      //                 translatedName:
      //                     '7. Na lelapa le lemme meroho jareteng kapa lijo thollo masimong likhoeli tse 6 tse fetileng?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF9C27B0),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'SI5Rgq5PBNy',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF9C27B0)),
      //               ),
      //               InputField(
      //                 id: 'Txd5uH337SN',
      //                 name:
      //                     '8. Did the household preserve any food in the last 6 months',
      //                 translatedName:
      //                     '8. Na lelapa le khonne ho boloka lijo likhoeli tse 6 tse fetileng',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF9C27B0),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'XPgmF5o8PrH',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF9C27B0)),
      //               ),
      //               InputField(
      //                 id: 'jCbVjOXRozX',
      //                 name: 'Food Security - Vulnerability',
      //                 translatedName: 'Lelapa le tlokotsing ea lijo?',
      //                 valueType: 'BOOLEAN',
      //                 isReadOnly: true,
      //                 background: Color(0xFFF5E9F7),
      //                 inputColor: Color(0xFF9C27B0),
      //               )
      //             ]),
      //         FormSection(
      //             name: 'HEALTH, WATER, SANITATION & SHELTER',
      //             translatedName: 'BOPHELO BO BOTLE, METSI LE BOHLOEKI',
      //             color: Color(0xFF2196F3),
      //             borderColor: Color(0xFF2196F3),
      //             inputFields: [
      //               InputField(
      //                 id: 'ZPlqhoOZ8YD',
      //                 name:
      //                     '9. Does the household have a source of safe water (from taps, protected wells) for domestic use where they can fetch it to/from within half an hour',
      //                 translatedName:
      //                     '9. Na lelapa le na le mohloli oa metsi a bolokehileng (joaloka pompo, liliba tse sirelelitsoeng) moo ba a khang ba sa tsamaee ho feta metsotso e 30?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF2196F3),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'WoqSoxZu02l',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF2196F3)),
      //               ),
      //               InputField(
      //                 id: 'UDbgJl7AEse',
      //                 name:
      //                     '10. Does the household have a stable shelter that is adequate, safe, and dry',
      //                 translatedName:
      //                     '10. Na ntlo e le lekane, e bolokehile hape ha ena mongobo/ ha e nele?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF2196F3),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'KAUFdysMR57',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF2196F3)),
      //               ),
      //               InputField(
      //                 id: 'M9uM11xcHG3',
      //                 name:
      //                     '11. Is there anyone in this household who is HIV positive',
      //                 translatedName:
      //                     '11. Na ho na le e mong oa lelapa ea nang le tšoaetso ea HIV? ',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF2196F3),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'FPgGtzXg9DA',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF2196F3)),
      //               ),
      //               InputField(
      //                 id: 'gybZY8lq4Ky',
      //                 name: 'Number of members who are HIV positive',
      //                 translatedName: 'Palo ea litho tse nang le tšoaetso ea HIV',
      //                 valueType: 'NUMBER',
      //                 inputColor: Color(0xFF2196F3),
      //               ),
      //               InputField(
      //                 id: 'R0U52RV4Cxe',
      //                 name:
      //                     '12. Does the caregiver know the HIV status of ALL children in the household?',
      //                 translatedName:
      //                     '12. Na mohlokomeli o tseba boemo ba HIV ba Bana bohle ka lapeng?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF2196F3),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'FGKsQQsRxoY',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF2196F3)),
      //               ),
      //               InputField(
      //                 id: 'aRRUFQvF8Xs',
      //                 name: 'Health, Water, Sanitation & Shelter - Vulnerability',
      //                 translatedName: 'Bophelo bo botle, metsi le bohloeki?',
      //                 valueType: 'BOOLEAN',
      //                 isReadOnly: true,
      //                 background: Color(0xFFE9F4FE),
      //                 inputColor: Color(0xFF2196F3),
      //               )
      //             ]),
      //         FormSection(
      //             name: 'EDUCATION AND DEVELOPMENT',
      //             translatedName: 'THUTO LE KHOLO',
      //             color: Color(0xFF009688),
      //             borderColor: Color(0xFF009688),
      //             inputFields: [
      //               InputField(
      //                 id: 'UCMMhdQ3OrB',
      //                 name:
      //                     '13. Are there any children aged 6 to 21 years in this household who are not enrolled in school?',
      //                 translatedName:
      //                     '13. Na ho na le bana ba lilemo li 6 ho ea ho tse 20 lapeng moo ba sa keneng sekolo?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF009688),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'KP1jF4igaNo',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF009688)),
      //               ),
      //               InputField(
      //                 id: 'NAMKqy2KVKk',
      //                 name:
      //                     '14. Are there any children aged < 5 years in this household who are not enrolled in ECCD?',
      //                 translatedName:
      //                     '14. Na ho na le bana ba lilemo li <5 lapeng ba kenang likonyaneng (ECCD)?)',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF009688),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'Vqf14OQmR6o',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF009688)),
      //               ),
      //               InputField(
      //                 id: 'zpnWLMc2oYc',
      //                 name:
      //                     '15. Are there any children aged 6 to 21 years in this household who are enrolled in school and have missed school for more than 15 days in the last school term?',
      //                 translatedName:
      //                     '15. Na ho na le bana ba lilemo li 6 ho ea ho tse 20 lapeng moo ba kenang sekolo, ba kileng ba lofa sekolo matsatsi a fetang a 15 nako ee ea sekolo?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF009688),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'wzpYuu4WPkE',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF009688)),
      //               ),
      //               InputField(
      //                 id: 'NqoQ5BNNoob',
      //                 name:
      //                     '16. Are there any children in this household who are not growing appropriately compared to their age',
      //                 translatedName:
      //                     '16. Na ho na le bana lapeng moo ba bonahalang ba sa holeng ka tsela e loketseng ho latela le lilemo tsa bona?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF009688),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'j254uH8eLrj',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF009688)),
      //               ),
      //               InputField(
      //                 id: 'fX6Amzn0Bpo',
      //                 name: 'EDUCATION AND DEVELOPMENT - Vulnerability',
      //                 translatedName: 'Thuto?',
      //                 valueType: 'BOOLEAN',
      //                 isReadOnly: true,
      //                 inputColor: Color(0xFF009688),
      //                 background: Color(0xFFE6F3F3),
      //               ),
      //             ]),
      //         FormSection(
      //             name: 'PSYCHOSOCIAL SUPPORT AND BASIC CARE',
      //             translatedName: 'TSEHETSO EA MAIKUTLO',
      //             color: Color(0xFF9E9D24),
      //             borderColor: Color(0xFF9E9D24),
      //             inputFields: [
      //               InputField(
      //                 id: 'ae9oO3q6zJx',
      //                 name:
      //                     '17. Are there any children in this household who are withdrawn or consistently sad, unhappy or depressed, not able to participate in daily activities including playing with friends and family?',
      //                 translatedName:
      //                     '17. Na ho na le bana lapeng lee ba lulang ba thotse kapa ba saretsoe, ba sa thabang kapa ba na le khatello ea maikutlo, ba sa khone ho etsa mesebetsi ea letsatsi le letsatsi ho kenyelletsa le ho bapala le metsoalle le ba lelapa?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFF9E9D24),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'MVjb8ODAmtV',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFF9E9D24)),
      //               ),
      //               InputField(
      //                   id: 'qGcHUqHsIL3',
      //                   name:
      //                       'Psychosocial support and basic care - Vulnerability',
      //                   translatedName: 'Tsehetso ea maikutlo?',
      //                   valueType: 'BOOLEAN',
      //                   isReadOnly: true,
      //                   background: Color(0xFFF5F5E9),
      //                   inputColor: Color(0xFF9E9D24))
      //             ]),
      //         FormSection(
      //             name: 'CHILD CARE & PROTECTION',
      //             translatedName: 'TŠIRELETSO LE TLHOKOMELO EA BANA',
      //             color: Color(0xFFEF6C00),
      //             borderColor: Color(0xFFEF6C00),
      //             inputFields: [
      //               InputField(
      //                 id: 'SAlR1x703Ly',
      //                 name:
      //                     'Has any child in the household experienced repeated physical/emotional abuse?',
      //                 translatedName:
      //                     'Na ho na le ngoana ka lapeng ea nang le boiphihlelo ba Hlekefetso ea mmeleng le maikhutlong?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'doZOa8hYrly',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'rbplnN6qdKz',
      //                 name:
      //                     'Has any child in the household experienced child marriage?',
      //                 translatedName:
      //                     'Na ho na le ngoana ka lapeng ea nang le boiphihlelo ba lenyalo la bana?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'doZOa8hYrly',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'zFpq6eXlVFX',
      //                 name:
      //                     'Has any child in the household experienced teenage pregnancy or teenage mother/ father?',
      //                 translatedName:
      //                     'Na ho na le ngoana ka lapeng ea nang le boiphihlelo ba Bokhachane ba bana kapa \'mè / ntate ea tlase lilemong?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'doZOa8hYrly',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'WpzsqW5qNs4',
      //                 name: 'Has any child in the household experienced neglect?',
      //                 translatedName:
      //                     'Na ho na le ngoana ka lapeng ea nang le boiphihlelo ba Bana ba sa hlokomeloeng?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'doZOa8hYrly',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'nKzcIaTPLbi',
      //                 name:
      //                     'Has any child in the household experienced child Labor?',
      //                 translatedName:
      //                     'Na ho na le ngoana ka lapeng ea nang le boiphihlelo ba Bana ba sebelisoang?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'doZOa8hYrly',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'thdtCERG6s5',
      //                 name:
      //                     'Has any child in the household experienced sexually abuse?',
      //                 translatedName:
      //                     'Na ho na le ngoana ka lapeng ea nang le boiphihlelo ba Hlekefetsoa ka motabo?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'doZOa8hYrly',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'xNIIkXQdxcO',
      //                 name: 'Has any child in the household experienced bullying',
      //                 translatedName:
      //                     'Na ho na le ngoana ka lapeng ea nang le boiphihlelo ts’osoang kapa ho sotloa',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'doZOa8hYrly',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'mZsmHPVyXV1',
      //                 name:
      //                     '19. Is there any child with a disability this household',
      //                 translatedName:
      //                     '19. Na ho na le ngoana ea nang le bokooa lelapeng lee?',
      //                 valueType: 'BOOLEAN',
      //                 isReadOnly: true,
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'HntYAvr9rHc',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'GjAeG3Mj2da',
      //                 name:
      //                     '20. Is there any child in this household who does not have a birth certificate',
      //                 translatedName:
      //                     '20. Na ho na le ngoana ea se nang lengolo la tlhaho lapeng lee?',
      //                 valueType: 'BOOLEAN',
      //                 inputColor: Color(0xFFEF6C00),
      //                 hasSubInputField: true,
      //                 subInputField: InputField(
      //                     id: 'aKEuLJsRTCp',
      //                     name: 'Referral',
      //                     valueType: 'TRUE_ONLY',
      //                     inputColor: Color(0xFFEF6C00)),
      //               ),
      //               InputField(
      //                 id: 'Caul8vihx2O',
      //                 name: 'CHILD CARE & PROTECTION - Vulnerability',
      //                 translatedName: 'Tsireletso ea bana?',
      //                 valueType: 'BOOLEAN',
      //                 isReadOnly: true,
      //                 inputColor: Color(0xFFEF6C00),
      //                 background: Color(0xFFFDF0E5),
      //               ),
      //             ]),
      //       ])
    ];
  }
}
