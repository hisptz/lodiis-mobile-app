import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/models/index_contact_model.dart';

class DreamsHTSIndexContactCardHeader extends StatelessWidget {
  DreamsHTSIndexContactCardHeader({
    Key key,
    @required this.event,
    this.onToggleCard,
  }) : super(key: key);

  final IndexContactModel event;

  final VoidCallback onToggleCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                  visible: true,
                  child: Expanded(
                    flex: 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Index Contact Information',
                        style: TextStyle().copyWith(
                            color: Color(0xFF1A3518),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        LineSeperator(
          color: Color(0xFFECF5EC),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
