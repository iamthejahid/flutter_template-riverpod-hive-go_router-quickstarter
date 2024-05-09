import 'package:hive/hive.dart';

abstract class CacheHandler {
  // Core Functionalities.
  Future<void> init(String boxName);
  T? get<T>(String tag, {T defaultValue});
  void put(String tag, dynamic value);
  void delete(String tag);
  Box<dynamic> getCacheBox();
  void cleanBox();

  // locale Data
  String get locale;
  void localeSet({required String locale});

  // Theme Data

  void setThemeData({required bool isWhite});

  String get themeData;

  // Token

  String get token;
  void setToken({required String token});

  String get userId;

  void setUserId({required String userId});

  void setUserRole({required String? userRole});

  // USERROLE? getUserRoleInEnum();

  String? getUserRoleInString();

  void setUserName({required String? userName});

  String get userName;
}
