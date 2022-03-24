import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EnrolledChildrenList extends StatefulWidget {
  final List<String?> childrenList;

  const EnrolledChildrenList({Key? key, required this.childrenList})
      : super(key: key);

  @override
  State<EnrolledChildrenList> createState() => _EnrolledChildrenListState();
}

class _EnrolledChildrenListState extends State<EnrolledChildrenList> {
  final String title = 'Enrolled Children';
  @override
  Widget build(BuildContext context) {
    return MaterialCard(
      elevation: 2.0,
      body: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/children_ovc_icon.svg',
                        ),
                      ),
                      Expanded(
                        child: Text(
                          currentLanguage == 'lesotho'
                              ? 'Lethathamo la bana'
                              : 'Children List',
                          style: const TextStyle().copyWith(
                            fontSize: 14.0,
                            color: const Color(0xFF536852),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: title != '',
                  child: LineSeparator(
                    color: const Color(0xFF1A3518).withOpacity(0.1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widget.childrenList.map((child) {
                      int index = widget.childrenList.indexOf(child);
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                              bottom: 4.0,
                            ),
                            child: Text(
                              '${index + 1}. $child',
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
        },
      ),
    );
  }
}
