import 'dart:convert';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/offline_db/reserve_value_offline/reserve_value_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_attribute_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/reserved_value.dart';

class ReservedValueService {
  int maxNumberToReserve = BeneficiaryIdentification.maxNumberToReserve;
  final String attribute = BeneficiaryIdentification.beneficiaryIndex;
  //why here ?? => because this array  become null when declare in a function pace, as the result no data saved:
  List<ReservedValue> reservedValues = [];
  Future generateReservedAttributeValue() async {
    List<ReservedValue> allReservedValues =
        await ReserveValueOffline().getReserveValue();
    List<String> expireReserveValueObjectIds = await getExpiredReserveValues();
     int numberToReserve = maxNumberToReserve +
        expireReserveValueObjectIds.length -
        allReservedValues.length;
    if (numberToReserve > 0) {
      expireReserveValueObjectIds.length > 0
          ? deleteExpireValues(expireReserveValueObjectIds)
          : null;
      getReservedValuesFromTheServer(numberToReserve);
      setReservedValues(await getReservedValuesFromTheServer(numberToReserve));
    }
    
  }

  Future getReservedValuesFromTheServer(int numberToReserve) async {
    final String attribute = BeneficiaryIdentification.beneficiaryIndex;
    String url =
        'api/trackedEntityAttributes/${attribute}/generateAndReserve?numberToReserve=$numberToReserve';
    CurrentUser user = await UserService().getCurrentUser();
    HttpService http =
        HttpService(username: user.username, password: user.password);
    try {
      var response = await http.httpGet(url);
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        for (var reserveValue in responseData) {
          reservedValues.add(ReservedValue.fromJson(reserveValue));
        }
      }
    } catch (e) {}
    return reservedValues;
  }

  Future setReservedValues(List<ReservedValue> reservedValues) async {
    await ReserveValueOffline().addOrUpdateReservedValue(reservedValues);
  }

  Future<String> getReservedAttributeValue() async {
    List<ReservedValue> getReservedValueList =
        await ReserveValueOffline().getReserveValue();
    return getReservedValueList.length > 0
        ? getReservedValueList[0].value
        : null;
  }

  Future deleteExpireValues(List<String> expireReservedValueIds) async {
      return await ReserveValueOffline()
        .deleteExpireReserveValue(expireReservedValueIds);
  }

  Future<List<String>> getExpiredReserveValues() async {
    DateTime date = DateTime.now();
    List<String> expireReserveValueObjectIds = [];
    List<ReservedValue> getReservedValueList =
        await ReserveValueOffline().getReserveValue();
    for (ReservedValue reserveValue in getReservedValueList) {
      DateTime todayDate = DateTime.parse(reserveValue.expireDate);
      if (todayDate.difference(date).inDays < 0) {
        expireReserveValueObjectIds.add(reserveValue.id);
      }
    }
    return expireReserveValueObjectIds;
  }

  Future cleanUsedReservedValues() async {
    List<String> _attribute = [attribute];
    List<String> trackedEntityValues = [];
    List<String> usedReservedValueIds = [];
    List<ReservedValue> getReservedValueList =
        await ReserveValueOffline().getReserveValue();
    for (var value in await TrackedEntityInstanceOfflineAttributeProvider()
        .getTrackedEntityAttributesValuesById(_attribute)) {
      trackedEntityValues.add(value["value"]);
    }
    for (ReservedValue reserveValue in getReservedValueList) {
      if (trackedEntityValues.contains(reserveValue.value)) {
        usedReservedValueIds.add(reserveValue.id);
      }
    }
    await deleteExpireValues(usedReservedValueIds);
  }
}
