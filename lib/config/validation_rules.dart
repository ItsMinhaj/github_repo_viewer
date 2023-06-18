class ValidationRules {
  static String? regularField(String? text) {
    if (text!.isEmpty) {
      return "Please Enter username";
    }
    return null;
  }
}
