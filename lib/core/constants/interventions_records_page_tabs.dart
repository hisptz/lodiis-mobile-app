import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_records/pages/beneficiaries_without_dreams_enrollment_criteria_records_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_records/pages/dreams_none_participation_records.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_records/pages/ovc_enrollment_records.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_records/pages/ovc_none_participation_records.dart';

class InterventionRecordsPageTabs {
  static final Map<String, Widget> dreamsModule = {
    'AGYW/DREAMS':
        Container(margin: EdgeInsets.only(top: 20), child: Text('Dreams')),
    'None Participation': DreamsNoneParticipationRecordsPage(),
    'No Enrollment Criteria':
        BeneficiariesWithoutDreamsEnrollmentCriteriaRecordsPage(),
  };
  static final Map<String, Widget> ovcModule = {
    'Households': OvcEnrollmentRecords(),
    'None Participation': OvcNoneParticipationRecords(),
  };
  static final Map<String, Widget> educationModule = {
    'Bursary':
        Container(margin: EdgeInsets.only(top: 20), child: Text('Bursary')),
    'None Participation': Container(
        margin: EdgeInsets.only(top: 20), child: Text('None Participation')),
  };
}
