import 'package:flutter/material.dart';

class OvcEnrollmentChildViewEditContainer extends StatefulWidget {
  const OvcEnrollmentChildViewEditContainer({Key? key}) : super(key: key);

  @override
  State<OvcEnrollmentChildViewEditContainer> createState() =>
      _OvcEnrollmentChildViewEditContainerState();
}

class _OvcEnrollmentChildViewEditContainerState
    extends State<OvcEnrollmentChildViewEditContainer> {
  // OvcEnrollmentChild
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(),
        child: const Text("Here"),
      ),
    );
  }
}
