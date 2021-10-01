import 'package:flutter/material.dart';

class InterventionRecordsPageTabs {
  static final Map<String, Widget> dreamsModule = {
    'Dreams':
        Container(margin: EdgeInsets.only(top: 20), child: Text('Dreams')),
    'None Participation': Container(
        margin: EdgeInsets.only(top: 20), child: Text('None Participation')),
    'No Enrollment Criteria': Container(
        margin: EdgeInsets.only(top: 20),
        child: Text('No Enrollment Criteria')),
  };
  static final Map<String, Widget> ovcModule = {
    'Households':
        Container(margin: EdgeInsets.only(top: 20), child: Text('Households')),
    'None Participation': Container(
        margin: EdgeInsets.only(top: 20), child: Text('None Participation')),
  };
  static final Map<String, Widget> educationModule = {
    'Bursary':
        Container(margin: EdgeInsets.only(top: 20), child: Text('Bursary')),
    'None Participation': Container(
        margin: EdgeInsets.only(top: 20), child: Text('None Participation')),
  };
}
