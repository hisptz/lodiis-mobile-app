import 'package:flutter/material.dart';

class OnlineBeneficiarySearch extends StatefulWidget {
  const OnlineBeneficiarySearch({Key? key}) : super(key: key);

  @override
  _OnlineBeneficiarySearchState createState() =>
      _OnlineBeneficiarySearchState();
}

class _OnlineBeneficiarySearchState extends State<OnlineBeneficiarySearch> {
  Widget makeFilterDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return makeFilterDismissible(
        child: DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.5,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              // TODO add consumer for the current intervention
              return Container(
                padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Center(
                  child: Text('Hello World!'),
                ),
              );
            }));
  }
}
