import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';

class GlobalFunctions {
  static String warning =
      "[🚫][Provider] : Debug print is encoded, please follow the code of conduct. [🚫] ";

  static bool isPrint = true;

  // For printing stuff.
  static void customPrntr(dynamic object) {
    if (isPrint) {
      log("[🌶️] : " + object.toString());
    } else {
      print(warning);
    }
  }

  // For printing white stuff.
  static void customPrntrWhite(dynamic object) {
    if (isPrint) {
      log('\x1b[37m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  // For printing yellow stuff.
  static void customPrntrYellow(dynamic object) {
    if (isPrint) {
      log('\x1b[93m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  // For printing green stuff.
  static void customPrntrGreen(dynamic object) {
    if (isPrint) {
      log('\x1b[32m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  static void attention(dynamic object) {
    if (isPrint) {
      log(
        '\x1b[47m' +
            '\x1b[36m' +
            '            [Attention] : $object            ' +
            '\x1b[0m',
      );
    } else {
      print(warning);
    }
  }

  static void errorPrint(dynamic object) {
    log("", error: '\x1b[41m' + '\x1b[47m' + ' [Error] : $object ' + '\x1b[0m');
  }

  Future<File?> imageCompressor(File file, String str) async {
    int _quality;
    final bytes = (await file.readAsBytes()).lengthInBytes;
    final imageSizeInMb = bytes / 1048576;

    if (imageSizeInMb > 5) {
      _quality = 25;
    } else if (imageSizeInMb > 3) {
      _quality = 40;
    } else {
      _quality = 50;
    }

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      str,
      quality: _quality,
    );
    File resultFile = File(result!.path);
    return resultFile;
  }

  Future<double> imageSizeInMB(File file) async {
    final bytes = (await file.readAsBytes()).lengthInBytes;
    final imageSizeInMb = bytes / 1048576;
    return imageSizeInMb;
  }

  static String fromDateFromWeek(String input) {
    RegExp dateRegExp = RegExp(r'(\d{2}/\d{2}/\d{4})');
    Iterable<Match> matches = dateRegExp.allMatches(input);

    List<String> dates = matches.map((match) => match.group(0)!).toList();

    String fromDate = dates[0];
    return fromDate;
  }

  static String toDateFromWeek(String input) {
    RegExp dateRegExp = RegExp(r'(\d{2}/\d{2}/\d{4})');
    Iterable<Match> matches = dateRegExp.allMatches(input);

    List<String> dates = matches.map((match) => match.group(0)!).toList();

    String toDate = dates[1];
    return toDate;
  }

  static String convertDateFormat(String? date) {
    if (date == null) {
      return "";
    }

    try {
      List<String> parts = date.split('/');
      String year = parts[2];
      String month = parts[1].length == 1 ? "0${parts[1]}" : parts[1];
      String day = parts[0].length == 1 ? "0${parts[0]}" : parts[0];

      return "$year-$month-$day";
    } catch (e) {
      log("", error: "Problem arised from: $date");
      return "";
    }
  }

  static String dateTOUIFormat(DateTime? date) {
    if (date == null) {
      return "";
    }
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // File to base64
  static String fileToBase64(File? file) {
    if (file == null) {
      return "string";
    }
    return "${base64Encode(File(file.path).readAsBytesSync())}";

    // return "data:image/jpeg;base64,${base64Encode(File(file.path).readAsBytesSync())}";
  }

  static String serverFormat(String date) {
    return DateFormat('yyyy-MM-dd')
        .format(DateFormat('dd/MM/yyyy').parse(date))
        .toString();
  }
}
