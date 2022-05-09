import 'package:flutter/material.dart';

class DreamsHTSAddFollowUpConfirmation extends StatelessWidget {
  const DreamsHTSAddFollowUpConfirmation({Key? key, required this.name})
      : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Column(
        children: [
          Visibility(
            visible: name != '',
            child: Container(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Text(
                'Follow up added successfully',
                style: const TextStyle().copyWith(
                  color: const Color(0XFF1A3518),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              'Add Another Follow up?',
              style: const TextStyle().copyWith(
                color: const Color(0XFF1A3518),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Not Now',
                  style: const TextStyle().copyWith(
                    color: const Color(0xFF1A3518),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  'Yes',
                  style: const TextStyle().copyWith(
                    color: const Color(0xFF258DCC),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
