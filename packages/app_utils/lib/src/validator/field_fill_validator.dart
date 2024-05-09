import 'dart:developer';

import 'package:app_utils/src/toaster/toaster.dart';

abstract class FieldFillValidator {
  static bool validate({required List<dynamic> fields}) {
    for (var i = 0; i < fields.length; i++) {
      if (fields[i] == null || fields[i] == "" || fields[i] == false) {
        log("",
            error: "FieldFillValidator failed at: $i",
            name: "FieldFillValidator");
        Toaster.errorToast(
          warningMessage: "Please fill all the fields",
        );
        return false;
      }
    }
    return true;
  }
}
