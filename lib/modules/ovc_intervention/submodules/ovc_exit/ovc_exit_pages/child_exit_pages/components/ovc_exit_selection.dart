import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/constants/ovc_exit_constant.dart';

class OvcChildExitSelection extends StatefulWidget {
  final List<String> programStageIdsWithData;

  const OvcChildExitSelection({
    Key key,
    @required this.programStageIdsWithData,
  }) : super(key: key);

  @override
  _OvcChildExitSelectionState createState() => _OvcChildExitSelectionState();
}

class _OvcChildExitSelectionState extends State<OvcChildExitSelection> {
  List<String> exitTitles;

  @override
  void initState() {
    exitTitles = [];
    Map programStageMap = OvcExitConstant.getOvcExitProgramStageMap();
    super.initState();
    for (String id in programStageMap.keys.toList()) {
      if (widget.programStageIdsWithData.indexOf(id) == -1) {
        exitTitles.add(programStageMap[id]);
      }
    }
    if (widget.programStageIdsWithData.isEmpty) {
      setState(() {
        exitTitles.remove(programStageMap[OvcExitConstant.caseClosureKey]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'SELECT EXIT TYPE',
              style: TextStyle(
                  color: Color(0xFF4B9F46),
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
          ),
          Container(
            child: Column(
              children: exitTitles.map((exitTitle) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: LineSeparator(
                        color: Color(0xFFE0E6E0),
                        height: 1.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => Navigator.pop(context, exitTitle),
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    exitTitle,
                                    style: TextStyle(
                                        color: Color(0xFF1A3518),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
