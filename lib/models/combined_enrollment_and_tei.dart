import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class CombinedEnrollmentAndTei {
  Enrollment enrollment;
  TrackedEntityInstance trackedEntityInstance;

  CombinedEnrollmentAndTei({
    required this.enrollment,
    required this.trackedEntityInstance,
  });
}
