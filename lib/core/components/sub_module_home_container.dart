import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class SubModuleHomeContainer extends StatelessWidget {
  final String header;
  final Widget bodyContents;
  final Function onOpenInfo;
  final bool hasInfo;

  const SubModuleHomeContainer(
      {Key key,
      this.header,
      @required this.bodyContents,
      this.onOpenInfo,
      this.hasInfo = false})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: header != null && header != ''
            ? AppBar(
                title: Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        header,
                        style: TextStyle().copyWith(
                            color: Color(0xFF82898D),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      )),
                      Visibility(
                          visible: hasInfo,
                          child: InkWell(
                            onTap: onOpenInfo,
                            child: Icon(
                              Icons.info_outline,
                              color: Color(0xFF82898D),
                              size: 24.0,
                            ),
                          )),
                    ],
                  ),
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
            Container(child: bodyContents)
          ],
        ));
  }
}
