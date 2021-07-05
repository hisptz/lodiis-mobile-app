class FormAutoSave {
  String id;
  String beneficiaryId;
  String pageModule;
  String nextPageModule;
  String data;

  FormAutoSave({
    this.id,
    this.beneficiaryId,
    this.data,
    this.pageModule,
    this.nextPageModule,
  }) {
    this.data = this.data ?? "";
  }

  bool hasFormAutoSaveData() {
    return data.isNotEmpty && data != "";
  }

  Map toOffline() {
    Map mapData = Map<String, dynamic>();
    mapData['id'] = id;
    mapData['beneficiaryId'] = beneficiaryId;
    mapData['pageModule'] = pageModule;
    mapData['nextPageModule'] = nextPageModule;
    mapData['data'] = data;
    return mapData;
  }

  FormAutoSave.fromOffline(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.beneficiaryId = mapData['beneficiaryId'];
    this.pageModule = mapData['pageModule'];
    this.nextPageModule = mapData['nextPageModule'];
    this.data = mapData['data'];
  }

  @override
  String toString() {
    return "id->$id pageModule->$pageModule nextPageModule->$nextPageModule";
  }
}
