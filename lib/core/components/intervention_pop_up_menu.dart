import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/login_form_field_seperator.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionPopUpMenu extends StatelessWidget {
  const InterventionPopUpMenu({
    Key key,
    @required this.activeInterventionProgram,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 45),
      child: Column(
        children: [
          Container(
            child: GestureDetector(
              onTap: () => {Navigator.pop(context, activeInterventionProgram)},
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Helolo',
                          style: TextStyle(color: Colors.amber),
                        ),
                      )
                    ],
                  ),
                  LoginFormFieldSeperator(
                    color: Colors.red,
                    height: 1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
