import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class BeneficiaryIdentification {
  static final String beneficiaryId = 'cfPJpuMGp2O';
  static final String beneficiaryIndex = 'Uth5HQFgqlb';
  static final List<String> firstNameReference = [];
  static final List<String> surnameReference = [];

  static String getBenificiaryId(
    OrganisationUnit organisationUnit,
    Map dataObject,
    String beneficiaryIndex,
  ) {
    return AppUtil.getUid();
  }
}
