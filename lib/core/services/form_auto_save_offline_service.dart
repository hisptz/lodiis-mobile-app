import 'package:kb_mobile_app/core/offline_db/form_auto_save/form_auto_save_offline_provider.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';

class FormAutoSaveOfflineService {
  // functions for access offline providers
  Future saveFormAutoSaveData(FormAutoSave formAutoSave) async {
    return await FormAutoSaveOfflineProvider()
        .addOrUpdateFormAutoSaveFormData(formAutoSave);
  }

  Future<FormAutoSave> getSavedFormAutoData(String formAutoSaveId) async {
    return await FormAutoSaveOfflineProvider()
        .getSavedFormAutoSaveFormDataById(formAutoSaveId);
  }

  Future deleteSavedFormAutoData(String formAutoSaveId) async {
    return await FormAutoSaveOfflineProvider()
        .deleteSavedFormAutoFormData(formAutoSaveId);
  }
}
