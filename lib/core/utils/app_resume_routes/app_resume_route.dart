import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_services_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ogac_routes/ogac_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_services_route.dart';

class AppResumeRoute
    with
        DreamsEnrollmentRoute,
        DreamsServicesRoute,
        OgacEnrollmentRoute,
        OvcEnrollmentRoute,
        OvcServicesRoute {
  //@TODO logics for checking all routes resumes

}
