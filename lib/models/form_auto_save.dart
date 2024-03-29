import 'dart:convert';

class FormAutoSave {
  String? id;
  String? beneficiaryId;
  String? pageModule;
  String? nextPageModule;
  String? data;

  FormAutoSave({
    this.id,
    this.beneficiaryId,
    this.data,
    this.pageModule,
    this.nextPageModule,
  }) {
    // ignore: unnecessary_this
    this.data = this.data ?? "";
  }

  bool hasFormAutoSaveData() {
    return data!.isNotEmpty && data != "";
  }

  Map toOffline(FormAutoSave formAutoSave) {
    Map mapData = <String, dynamic>{};
    mapData['id'] = formAutoSave.id;
    mapData['beneficiaryId'] = formAutoSave.beneficiaryId;
    mapData['pageModule'] = formAutoSave.pageModule;
    mapData['nextPageModule'] = formAutoSave.nextPageModule;
    mapData['data'] = sanitizeJsonData(jsonObject: formAutoSave.data!);
    return mapData;
  }

  String sanitizeJsonData({String jsonObject = ''}) {
    Map<String, dynamic> jsonMap = json.decode(jsonObject);
    jsonMap.removeWhere((key, value) => value == null || value == '');
    return json.encode(jsonMap);
  }

  FormAutoSave.fromOffline(Map<String, dynamic> mapData) {
    id = mapData['id'];
    beneficiaryId = mapData['beneficiaryId'];
    pageModule = mapData['pageModule'];
    nextPageModule = mapData['nextPageModule'];
    data = mapData['data'];
  }

  @override
  String toString() {
    return "id->$id pageModule->$pageModule nextPageModule->$nextPageModule data->$data";
  }
}
