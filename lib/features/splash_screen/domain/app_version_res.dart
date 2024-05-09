import 'dart:convert';

class AppVersionRes {
  final Data? data;
  final dynamic message;
  final dynamic stack;

  AppVersionRes({
    this.data,
    this.message,
    this.stack,
  });

  factory AppVersionRes.fromRawJson(String str) =>
      AppVersionRes.fromJson(json.decode(str));

  factory AppVersionRes.fromJson(Map<String, dynamic> json) => AppVersionRes(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        stack: json["stack"],
      );
}

class Data {
  final String? latestVersion;
  final bool? isForce;
  final bool? isSoft;

  Data({
    this.latestVersion,
    this.isForce,
    this.isSoft,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        latestVersion: json["latestVersion"],
        isForce: json["isForce"],
        isSoft: json["isSoft"],
      );
}
