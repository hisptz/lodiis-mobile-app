class CurrentUserImplementingPartner {
  static final String implementPartnerAttribute = "wpiLo7DTwKF";
  static final String subImplementingPartnerAttribute = "P7YnaTZTSKl";

  static String getCurrentUserImplementingPartiner(String attributeValue) {
    Map implentingPartnerMapping = getImplementingPartnerMapping();
    return implentingPartnerMapping[attributeValue] ?? "";
  }

  static String getCurrentUserSubImplementingPartiner(String attributeValue) {
    Map subImplentingPartnerMapping = getSubImplementingPartnerMapping();
    return subImplentingPartnerMapping[attributeValue] ?? "";
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
    };
  }
}
