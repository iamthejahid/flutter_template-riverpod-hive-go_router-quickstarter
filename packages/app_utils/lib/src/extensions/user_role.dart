// Role Converter
extension RoleConverter on String {
  String get toRole {
    switch (this) {
      case "SP":
        return "SalesPromoter";
      case "TA":
        return "TechnicalAssistant";
      case "SE":
        return "SalesEngineer";
      case "ASH":
        return "AreaSalesHead";
      default:
        return "";
    }
  }

  String get toRoleTitle {
    switch (this) {
      case "SP":
        return "Sales Promoter";
      case "TA":
        return "Technical Assistant";
      case "SE":
        return "Sales Engineer";
      case "ASH":
        return "Area Sales Head";
      default:
        return "";
    }
  }

  // Combined to title
  String get roleComboToTitle {
    switch (this) {
      case "SalesPromoter":
        return "Sales Promoter";
      case "TechnicalAssistant":
        return "Technical Assistant";
      case "SalesEngineer":
        return "Sales Engineer";
      case "AreaSalesHead":
        return "Area Sales Head";
      default:
        return "";
    }
  }
}
