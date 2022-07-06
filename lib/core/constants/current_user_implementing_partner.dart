class CurrentUserImplementingPartner {
  static const String implementPartnerAttribute = "wpiLo7DTwKF";
  static const String subImplementingPartnerAttribute = "P7YnaTZTSKl";

  static String getCurrentUserImplementingPartner(String? attributeValue) {
    Map implementingPartnerMapping = getImplementingPartnerMapping();
    return implementingPartnerMapping[attributeValue] ?? "";
  }

  static String getCurrentUserSubImplementingPartner(String? attributeValue) {
    Map subImplementingPartnerMapping = getSubImplementingPartnerMapping();
    return subImplementingPartnerMapping[attributeValue] ?? "";
  }

  static Map getSubImplementingPartnerMapping() {
    return {
      "v0RtZnT4oUe": "LENEPHWA",
      "xawuXnP4XI8": "WLSA",
      "Na89xcqc7BT": "CBA",
      "fNDeWzs0aso": "CRS - CIL",
      "pQqafIBx2vk": "CRS - LIRAC",
      "IuPPi2GpRMV": "CRS - SWAALES",
      "hmGY74BllyO": "CRS - Sentebale",
    };
  }

  static Map getImplementingPartnerMapping() {
    return {
      "H2CE3Iwdf7v": "Super user",
      "vVMJBQvvm5D": "PSI",
      "tmuVlsiEjUi": "EGPAF",
      "SdDDPA28oVh": "KB-Case Management",
      "KixA3B2O8Rp": "KB-AGYW/DREAMS",
      "NuxoYkqopE2": "CLO",
      "RoLA6GyxTlS": "Paralegal",
      "A5VS8GCyb8t": "JHPIEGO",
      "sSdwtoDAj0H": "PP_PREV/EDUCATION",
    };
  }
}
