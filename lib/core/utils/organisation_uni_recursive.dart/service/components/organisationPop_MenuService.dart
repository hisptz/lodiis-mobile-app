// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/components/organisation_component.dart';
// import 'package:kb_mobile_app/models/organisation_unit.dart';

// // ignore: must_be_immutable
// class OrganisationExpanded extends StatelessWidget {
//   int length;
//   OrganisationUnit organisationUnit;
//   OrganisationExpanded({
//   @required  this.length,
//    @required this.organisationUnit
//   });
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: ScrollPhysics(),
//       child: Padding(
//         padding: EdgeInsets.only(right: 0, top: 2),
//         child: ListView.builder(
//             dragStartBehavior: DragStartBehavior.start,
//             padding: EdgeInsets.all(0),
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: length,
//             itemBuilder: (context, index) {
//               return ExpandedOrganisationWidgets(
//                 organisationUnit: null[index],
//                               );
//             }),
//       ),
//     );
//   }
// }
