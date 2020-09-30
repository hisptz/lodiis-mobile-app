import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcCasePlanReferralFollowUpService {
  static List<FormSection> getFormSections() {
    return [
    FormSection(
        borderColor: Color(0xFF9C27B0),
         name: " ",
         color: Color(0xFF9C27B0),
      subSections: [
          FormSection(
        borderColor: Color(0xFF9C27B0),
         name: "Health services",
         color: Color(0xFF9C27B0),
         inputFields: [


InputField(
  id: "nsGf9zTVrR8",
   name: "HIVSCREEN Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
      ]),


InputField(
  id: "c3YpE03Omap",
   name: "Reasons HIVSCREEN not completed",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "qoT16RqF0AW",
   name: "HTS Results",
    valueType: "TEXT",
      inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),


    InputField(
  id: "jBlJhUFzHDN",
   name: "Reasons HTS not completed",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "AxGWsUhzPdO",
   name: "HIVTREAT Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

    
       InputField(
  id: "whIcXFKztLy",
   name: "Reasons HIVTREAT not completed",
    valueType: "TEXT",
      inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "ZrX6iFwSFdI",
   name: "HIVS&D Results",
    valueType: "TEXT",
       inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

       InputField(
  id: "mNKqSsW5FyE",
   name: "Reasons HIVS&D not completed",
    valueType: "TEXT",
       inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "FLxulMZBB8P",
   name: "HEALTH Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),


       InputField(
  id: "gEiKTWFdTDR",
   name: "Reasons HEALTH not completed",
    valueType: "TEXT",
      inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "GXiyFeuJAEO",
   name: "PRG&L Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),
      
       InputField(
  id: "QSGJF5uy3s1",
   name: "Reasons PRG&L not completed",
    valueType: "TEXT",
        inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "i37SPKK7tv2",
   name: "SAIDS Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

   
       InputField(
  id: "IZyIR4gdGHH",
   name: "Reasons SAIDS  not completed",
    valueType: "TEXT",
      inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "FKqpxT2LoVK",
   name: "IMMUNIZE Results",
    valueType: "TEXT",
     inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

    
       InputField(
  id: "O6Qu5NzSgQn",
   name: "Reasons IMMUNIZE not completed",
    valueType: "TEXT",
        inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "jFOpXW5vEdz",
   name: "MALNU Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),
       
       InputField(
  id: "BYoXCG1xAro",
   name: "Reasons MALNU not completed",
    valueType: "TEXT",
     inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "txZRxI3C8wW",
   name: "CCFLS Results",
    valueType: "TEXT",
      inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

       
       InputField(
  id: "euIQlU1MKYj",
   name: "Reasons CCFLS not completed",
    valueType: "TEXT",
       inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "jH9hAU5NhWB",
   name: "STIMULATE Results",
    valueType: "TEXT",
      inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

         
       InputField(
  id: "ruf1RhT5l9k",
   name: "Reasons STIMULATE not completed",
    valueType: "TEXT",
       inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "pvonlFmi4K0",
   name: "TBSCREEN Results",
    valueType: "TEXT",
       inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

 InputField(
  id: "kzv81ioLFRX",
   name: "Reasons TBSCREEN not completed",
    valueType: "TEXT",
       inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "TgCXgdny2Xe",
   name: "TBREFER Results",
    valueType: "TEXT",
       inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

       InputField(
  id: "ArkWJ0TUaSi",
   name: "Reasons TBREFER not completed",
    valueType: "TEXT",
     inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "midyHOIjh5q",
   name: "FOODPREP Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

    
       InputField(
  id: "FkCg8sWsq07",
   name: "Reasons FOODPREP not completed",
    valueType: "TEXT",
        inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "lmYzX0g8YqA",
   name: "FOODPREV  Results",
    valueType: "TEXT",
    inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

     
       InputField(
  id: "FVVQ9E2DrD7",
   name: "FOODSUPP Results",
    valueType: "TEXT",
      inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
      ),

InputField(
  id: "I7UH0WwKGZI",
   name: "Reasons FOODSUPP not completed",
    valueType: "TEXT",
     inputColor: Color(0xFF1A3518),
    labelColor: Color(0xFF9C27B0),
     options:[
              InputFieldOption(code: 'Achieved', name: 'Achieved'),
              InputFieldOption(code: 'In progress', name: 'In progress'),
              InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
            ]
    ),

      
         ]
         
         
           )
      ]
    
    ),
        FormSection(
          name: "Stable Services",
          borderColor: Color(0xFF9C27B0),
          color: Color(0xFF9C27B0),
          inputFields: [
            InputField(
                id: "XAdRNtFaJrW",
                name: "OVCFUND Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "uUVW07YYELA",
              name: "Reasons OVCFUND not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),
            InputField(
                id: "Fhuw28RcqJf",
                name: "SGROUP Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "RIhHpWTry4e",
              name: "Reasons SGROUP not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),
            InputField(
                id: "ofKPDgInoED",
                name: "EST COOPRTVS Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "rqoRLKfOz1X",
              name: "Reasons EST COOPRTVS not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),
            InputField(
                id: "rCoESQBRoWQ",
                name: "FUNCT COOPRTVS Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "U3OirYxhmZ3",
              name: "Reasons FUNCT COOPRTVS not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),
            InputField(
                id: "Jyr5fwQFmin",
                name: "MARKT COOPRTVS Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "RCG0ohFiNym",
              name: "Reasons MARKT COOPRTVS  not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),
          ]),


             FormSection(
          name: "Safe Services",
          borderColor: Color(0xFF9C27B0),
          color: Color(0xFF9C27B0),
          inputFields: [
            InputField(
                id: "kUahCyGuIra",
                name: "FCARE Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "B2dFwKf4AmX",
              name: "Reasons FCARE not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),


              InputField(
                id: "Rg2LB1YtRaY",
                name: "SHELTER Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "GgpyEuYY7cm",
              name: "Reasons SHELTER not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),
         

            InputField(
                id: "glwwR6j93BC",
                name: "ABUSE Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "x4V6Yh6LvJs",
              name: "Reasons ABUSE not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),


              InputField(
                id: "ujRjcCXrDIQ",
                name: "LEGALPROT Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "DTHXODoARku",
              name: "Reasons LEGALPROT not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),


              InputField(
                id: "N3EJnMcHYhd",
                name: "BIRTHCERT Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "uhwmhQuRbUy",
              name: "Reasons BIRTHCERT not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),
          ]),

            FormSection(
          name: "Schooled Services",
          borderColor: Color(0xFF9C27B0),
          color: Color(0xFF9C27B0),
          inputFields: [
            InputField(
                id: "BDk0CYuQYGB",
                name: "AFLAS Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "dPXH2ODY0aD",
              name: "Reasons AFLAS not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),


             InputField(
                id: "VhxUu6aLkMA",
                name: "PTS4G  Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "vV9iBTXHtCv",
              name: "Reasons PTS4G  not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),

        InputField(
                id: "LW6zZlSlP9P",
                name: "HWCLUB  Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "pKgBXzMDJgd",
              name: "Reasons HWCLUB not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),

              InputField(
                id: "LW6zZlSlP9P",
                name: "BURSARY Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "ZdTCSQMnqIz",
              name: "Reasons BURSARY not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),

               InputField(
                id: "FCz2oClbBs2",
                name: "SFEES  Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "bGhjAinKNWT",
              name: "Reasons SFEES not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),


               InputField(
                id: "DRsYIjVp8a6",
                name: "SMATERIAL Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "NejOFo7hXcl",
              name: "Reasons SMATERIAL not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),


               InputField(
                id: "aGPDNhnjIBK",
                name: "REENROL Results",
                valueType: "TEXT",
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF9C27B0),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved'),
                ]),
            InputField(
              id: "yuI2h1iaF0S",
              name: "Reasons REENROL not completed",
              valueType: "TEXT",
              inputColor: Color(0xFF1A3518),
              labelColor: Color(0xFF9C27B0),
            ),

          ])





    ];
  }
}
