import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? phonValidator(String? phonnumber) {
    if (phonnumber == null || phonnumber.isEmpty) {
      return 'this field is required'.tr();
    } else if (phonnumber.length < 10) {
      return "Enter the correct number".tr();
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'this field is required'.tr();
    } else if (password.length < 8) {
      return "the password maby more than 8 charecters".tr();
    } else {
      return null;
    }
  }
}
