import 'package:kb_mobile_app/models/input_field.dart';

class OnlineBeneficiarySearchInput {
  String label;
  List<String>? interventions;
  InputField inputField;

  OnlineBeneficiarySearchInput(
      {required this.label,
      required this.inputField,
      this.interventions = const []});
}
