import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class DreamsHomeContainer extends StatelessWidget {
  final String header;
  final Widget bodyContents;

  const DreamsHomeContainer({
    Key key,
    this.header,
    @required this.bodyContents,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: header != null && header != ''
            ? AppBar(
                title: Text(
                  header,
                  style: TextStyle().copyWith(
                      color: Color(0xFF82898D),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Color(0xFFFFFFFF),
                elevation: 1,
              )
            : null,
        body: Stack(
          children: [
            Consumer<IntervetionCardState>(
              builder: (context, intervetionCardState, child) {
                InterventionCard activeInterventionProgram =
                    intervetionCardState.currentIntervetionProgram;
                return Container(
                  decoration: BoxDecoration(
                      color: activeInterventionProgram.background),
                );
              },
            ),
            SingleChildScrollView(child: bodyContents)
          ],
        ));
  }
}
