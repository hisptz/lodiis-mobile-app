import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';

class ReservedValue {
  String id;
  String attribute;
  String value;
  String expireDate;

  ReservedValue({this.id, this.attribute, this.value, this.expireDate});

  factory ReservedValue.fromJson(Map<String, dynamic> json) {
    return ReservedValue(
        id: json['id'] ?? AppUtil.getUid(),
        attribute: BeneficiaryIdentification.beneficiaryIndex,
        value: json['value'],
        expireDate: json['expiryDate']);
  }

  Map toOffline(ReservedValue reservedValue) {
    var map = Map<String, dynamic>();
    map['id'] = reservedValue.id;
    map['attribute'] = reservedValue.attribute;
    map['value'] = reservedValue.value;
    map['expireDate'] = reservedValue.expireDate;
    return map;
  }

  ReservedValue.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.attribute = map['attribute'];
    this.value = map['value'];
    this.expireDate = map['expireDate'];
  }

  @override
  String toString() {
    return "reserve value is $value";
  }
}
