import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class UserInfoProvider extends OfflineDbProvider {
  final String table = "current_user_info";
  // columns
  final String id = "id";
  final String email = "email";
  final String phoneNumber = "phoneNumber";
  final String userRoles = "userRoles";
  final String userGroups = "userGroups";

  // more functions
}
