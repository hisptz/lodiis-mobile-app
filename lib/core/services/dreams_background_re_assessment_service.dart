import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/local_notification_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/combined_enrollment_and_tei.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_enrollment_constant.dart';

class DreamsBackgroundReAssessmentService {
  static Future<void> startProcess() async {
    try {
      LocalNotificationService.show(
        message: "Started evaluation of DREAMS beneficiaries to re-assess",
        title: "DREAMS Re-assessment",
      );
      await _evaluateDreamsTrackedEntityInstancesToUpdate();
    } catch (e) {
      //
    } finally {
      LocalNotificationService.show(
        message: "Finished evaluation of DREAMS beneficiaries to re-assess",
        title: "DREAMS Re-assessment",
      );
    }
  }

  static Future<void> _evaluateDreamsTrackedEntityInstancesToUpdate() async {
    try {
      int enrollmentCount = await EnrollmentOfflineProvider()
          .getEnrollmentsToReAssessCount(AgywDreamsEnrollmentConstant.program);
      if (enrollmentCount > 0) {
        for (var page = 0;
            page <=
                (enrollmentCount / PaginationConstants.searchingPaginationLimit)
                    .ceil();
            page++) {
          List<Enrollment> enrollments =
              await EnrollmentOfflineProvider().getEnrollmentsByProgram(
            AgywDreamsEnrollmentConstant.program,
            page: page,
          );
          List<String> trackedEntityInstancesIds = enrollments
              .map((Enrollment enrollment) => enrollment.trackedEntityInstance!)
              .toList();
          List<TrackedEntityInstance> teiList =
              await TrackedEntityInstanceOfflineProvider()
                  .getTrackedEntityInstanceByIds(trackedEntityInstancesIds);
          List<CombinedEnrollmentAndTei> trackedEntityInstances = teiList
              .map((tei) => CombinedEnrollmentAndTei(
                  trackedEntityInstance: tei,
                  enrollment: enrollments.firstWhere((enrollment) =>
                      enrollment.trackedEntityInstance ==
                      tei.trackedEntityInstance)))
              .toList();
          await _discoverDreamsBeneficiariesWhoShiftedAgeGroup(
              trackedEntityInstances);
        }
      }
    } catch (e) {
      //
    }
  }

  static Future<void> _discoverDreamsBeneficiariesWhoShiftedAgeGroup(
      List<CombinedEnrollmentAndTei> dreamsBeneficiaries) async {
    List<Enrollment> enrollmentsToUpdate = [];

    List<CombinedEnrollmentAndTei> beneficiariesAbove14years =
        _getBeneficiariesAbove14years(dreamsBeneficiaries);

    Map<String, List<CombinedEnrollmentAndTei>> groupedBeneficiaries =
        _groupBeneficiariesByReAssessment(beneficiariesAbove14years);

    List<Enrollment> neverReAssessedEnrollmentsToBeReAssessed =
        await _reAssessBeneficiariesNotReAssessedBefore(
      groupedBeneficiaries['beneficiariesNotReAssessed'] ?? [],
    );
    if (neverReAssessedEnrollmentsToBeReAssessed.isNotEmpty) {
      enrollmentsToUpdate.addAll(neverReAssessedEnrollmentsToBeReAssessed);
    }

    List<Enrollment> alreadyReAssessedEnrollmentsToBeReAssessed =
        await _evaluateReAssessmentForBeneficiariesAlreadyReAssessed(
      groupedBeneficiaries['reAssessedBeneficiaries'] ?? [],
    );
    if (alreadyReAssessedEnrollmentsToBeReAssessed.isNotEmpty) {
      enrollmentsToUpdate.addAll(alreadyReAssessedEnrollmentsToBeReAssessed);
    }

    try {
      await EnrollmentOfflineProvider()
          .addOrUpdateMultipleEnrollments(enrollmentsToUpdate);
    } catch (e) {
      //
    }
  }

  static Future<List<Enrollment>> _reAssessBeneficiariesNotReAssessedBefore(
      List<CombinedEnrollmentAndTei> dreamsBeneficiaries) async {
    List<Enrollment> enrollmentsToReAssess = [];

    for (CombinedEnrollmentAndTei beneficiary in dreamsBeneficiaries) {
      Enrollment enrollment = beneficiary.enrollment;
      TrackedEntityInstance trackedEntityInstance =
          beneficiary.trackedEntityInstance;

      List attributes = trackedEntityInstance.attributes ?? [];
      Map? dateOfBirthAttribute = attributes.firstWhere((dataRow) =>
          dataRow['attribute'] == AgywDreamsEnrollmentConstant.dateOfBirthId);
      int currentAge = AppUtil.getAgeInYear(dateOfBirthAttribute!['value']);
      int ageAtEnrollment = AppUtil.getAgeInYear(dateOfBirthAttribute['value'],
          currentDate:
              AppUtil.getDateIntoDateTimeFormat(enrollment.enrollmentDate!));
      bool hasTurnedAgeBand = (ageAtEnrollment <= 14 && currentAge >= 15) ||
          (ageAtEnrollment <= 19 && currentAge >= 20 && currentAge <= 24);
      if (hasTurnedAgeBand) {
        enrollment.shouldReAssess = 'true';
        enrollmentsToReAssess.add(enrollment);
      }
    }

    return enrollmentsToReAssess;
  }

  static Future<List<Enrollment>>
      _evaluateReAssessmentForBeneficiariesAlreadyReAssessed(
          List<CombinedEnrollmentAndTei> dreamsBeneficiaries) async {
    List<Enrollment> enrollmentsToReAssess = [];
    for (CombinedEnrollmentAndTei beneficiary in dreamsBeneficiaries) {
      TrackedEntityInstance tei = beneficiary.trackedEntityInstance;
      List attributes = tei.attributes ?? [];
      Map? reAssessmentCriteriaAttribute = attributes.firstWhere((dataRow) =>
          dataRow['attribute'] ==
          AgywDreamsEnrollmentConstant.reAssessmentCriteriaId);
      Map? dateOfBirthAttribute = attributes.firstWhere((dataRow) =>
          dataRow['attribute'] == AgywDreamsEnrollmentConstant.dateOfBirthId);
      String reAssessmentAgeBand = reAssessmentCriteriaAttribute!['value'];
      List<int> ageRange = reAssessmentAgeBand
          .split('-')
          .map((range) => int.parse(range.trim()))
          .toList();
      int age = AppUtil.getAgeInYear(dateOfBirthAttribute!['value']);
      if (ageRange.isNotEmpty &&
          (age < ageRange.first || age > ageRange.last)) {
        var enrollment = beneficiary.enrollment;
        enrollment.shouldReAssess = 'true';
        enrollmentsToReAssess.add(enrollment);
      }
    }

    return enrollmentsToReAssess;
  }

  static List<CombinedEnrollmentAndTei> _getBeneficiariesAbove14years(
      List<CombinedEnrollmentAndTei> dreamsBeneficiaries) {
    return dreamsBeneficiaries.where((beneficiary) {
      TrackedEntityInstance teiObject = beneficiary.trackedEntityInstance;
      List attributes = teiObject.attributes ?? [];
      Map? dateOfBirthAttribute = attributes.firstWhere(
          (dataRow) =>
              dataRow['attribute'] ==
              AgywDreamsEnrollmentConstant.dateOfBirthId,
          orElse: () => null);
      return dateOfBirthAttribute == null
          ? false
          : AppUtil.getAgeInYear(dateOfBirthAttribute['value']) > 14;
    }).toList();
  }

  static Map<String, List<CombinedEnrollmentAndTei>>
      _groupBeneficiariesByReAssessment(
          List<CombinedEnrollmentAndTei> beneficiariesAbove14years) {
    Map<String, List<CombinedEnrollmentAndTei>>
        groupedBeneficiariesByReAssessment = {};
    List<CombinedEnrollmentAndTei> reAssessedBeneficiaries = [];
    List<CombinedEnrollmentAndTei> beneficiariesNotReAssessed = [];

    for (CombinedEnrollmentAndTei beneficiary in beneficiariesAbove14years) {
      TrackedEntityInstance tei = beneficiary.trackedEntityInstance;
      List attributes = tei.attributes ?? [];
      Map? reAssessmentCriteriaAttribute = attributes.firstWhere(
          (dataRow) =>
              dataRow['attribute'] ==
              AgywDreamsEnrollmentConstant.reAssessmentCriteriaId,
          orElse: () => null);

      if (reAssessmentCriteriaAttribute != null &&
          reAssessmentCriteriaAttribute['value'] != '' &&
          reAssessmentCriteriaAttribute['value'] != null) {
        reAssessedBeneficiaries.add(beneficiary);
      } else {
        beneficiariesNotReAssessed.add(beneficiary);
      }
    }

    groupedBeneficiariesByReAssessment['reAssessedBeneficiaries'] =
        reAssessedBeneficiaries;
    groupedBeneficiariesByReAssessment['beneficiariesNotReAssessed'] =
        beneficiariesNotReAssessed;
    return groupedBeneficiariesByReAssessment;
  }
}
