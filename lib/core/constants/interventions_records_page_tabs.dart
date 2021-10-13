import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_records/pages/beneficiaries_without_dreams_enrollment_criteria_records_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_records/pages/dreams_enrollment_records.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_records/pages/dreams_none_participation_records.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_records/pages/non_agyw_records.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_records/pages/bursary_records_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_records/pages/bursary_without_vulnerability_records_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_records/pages/lbse_records_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_records/pages/ovc_enrollment_records.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_records/pages/ovc_none_participation_records.dart';

class InterventionRecordsPageTabs {
  InterventionRecordsPageTabs({required this.page, this.implementingPartners});
  Widget page;
  List<String>? implementingPartners;

  static final Map<String, InterventionRecordsPageTabs> dreamsModule = {
    'AGYW/DREAMS': InterventionRecordsPageTabs(page: DreamsEnrollmentRecords()),
    'None Participation':
        InterventionRecordsPageTabs(page: DreamsNoneParticipationRecordsPage()),
    'No Enrollment Criteria': InterventionRecordsPageTabs(
        page: BeneficiariesWithoutDreamsEnrollmentCriteriaRecordsPage(),
        implementingPartners: []),
    'Kb PrEP': InterventionRecordsPageTabs(
        page: NonAgywRecords(),
        implementingPartners: ['KB-AGYW/DREAMS', 'Super user'])
  };
  static final Map<String, InterventionRecordsPageTabs> ovcModule = {
    'Households': InterventionRecordsPageTabs(page: OvcEnrollmentRecords()),
    'None Participation':
        InterventionRecordsPageTabs(page: OvcNoneParticipationRecords()),
  };

  static final Map<String, InterventionRecordsPageTabs> educationModule = {
    'LBSE': InterventionRecordsPageTabs(page: LbseRecordsPage()),
    'Bursary': InterventionRecordsPageTabs(page: BursaryRecordsPage()),
    'No Vulnerability Criteria': InterventionRecordsPageTabs(
        page: BursaryWithoutVulnerabilityRecordsPage()),
  };
}
