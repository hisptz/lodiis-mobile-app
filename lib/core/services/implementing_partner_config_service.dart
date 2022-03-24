import 'dart:convert';
import 'package:kb_mobile_app/core/constants/default_implementing_partner_config.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';

class ImplementingPartnerConfigService {
  final String url = "api/dataStore/kb-mobile-app/implementing-partner-program";

  Future<dynamic> getImplementingPartnerConfigFromTheServer(
    String? username,
    String? password,
  ) async {
    String defaultImplementingPartnerConfig =
        DefaultImplementingPartnerConfig.getDefaultConfig();
    String currentImplementingPartnerConfig = '';

    try {
      HttpService http = HttpService(
        username: username,
        password: password,
      );
      var response = await http.httpGet(url);
      currentImplementingPartnerConfig = response.statusCode == 200
          ? response.body
          : defaultImplementingPartnerConfig;
    } catch (error) {
      rethrow;
    }
    return json.decode(currentImplementingPartnerConfig);
  }
}
