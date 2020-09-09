import 'package:flutter/material.dart';

class InterventionSelectionCollapsableCard extends StatefulWidget {
  double animatedHeight;
  InterventionSelectionCollapsableCard({@required this.animatedHeight});
  @override
  _InterventionSelectionCollapsableCardState createState() =>
      _InterventionSelectionCollapsableCardState(
          animatedHeight: animatedHeight);
}

class _InterventionSelectionCollapsableCardState
    extends State<InterventionSelectionCollapsableCard> {
  double animatedHeight;

  _InterventionSelectionCollapsableCardState({@required this.animatedHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10.0,bottom: 10.0),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            width: 367,
            height: 0,
            color: Colors.tealAccent,
            child: Card(
                elevation: 1,
                child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 12,
                      top: 5,
                    ),
                    child: Text("Children")))));
  }
}
