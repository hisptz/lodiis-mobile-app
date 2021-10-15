import 'package:flutter/material.dart';

class EdcucationLbseReferralOutcomeFollowUpContainer extends StatelessWidget {
  const EdcucationLbseReferralOutcomeFollowUpContainer({
    Key? key,
    required this.isFollowingUpNeeded,
    this.onAddOutComeFollowingUp,
  }) : super(key: key);

  final bool isFollowingUpNeeded;
  final VoidCallback? onAddOutComeFollowingUp;

  //@TODO editing outcome following ups

  Container _getActionButton({
    required Color backgroundColor,
    required String label,
    required Color labelColor,
    required VoidCallback onTap,
  }) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          child: Container(
            child: InkWell(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle().copyWith(
                      color: labelColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: isFollowingUpNeeded,
        child: Column(
          children: [
            //@TODO adding container for following ups
            Visibility(
              child: _getActionButton(
                backgroundColor: Color(0xFF009688),
                label: 'ADD FOLLOW UP',
                labelColor: Colors.white,
                onTap: onAddOutComeFollowingUp!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
