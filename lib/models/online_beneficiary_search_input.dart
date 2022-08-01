import 'package:kb_mobile_app/models/input_field.dart';

class BeneficiarySearchInput {
  String label;
  List<String>? interventions;
  InputField inputField;

  BeneficiarySearchInput(
      {required this.label,
      required this.inputField,
      this.interventions = const []});
}
