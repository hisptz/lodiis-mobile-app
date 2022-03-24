import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact.dart';

class DreamsHTSIndexContactCardHeader extends StatelessWidget {
  const DreamsHTSIndexContactCardHeader({
    Key? key,
    required this.event,
    this.onToggleCard,
  }) : super(key: key);

  final IndexContact? event;

  final VoidCallback? onToggleCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                  visible: true,
                  child: Expanded(
                    flex: 10,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Index Contact Information',
                        style: const TextStyle().copyWith(
                            color: const Color(0xFF1A3518),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const LineSeparator(
          color: Color(0xFFECF5EC),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
