import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_template/core/local_cache/src/cache_abstract.dart';
import 'package:flutter_template/core/local_cache/src/cache_tags.dart';

class CacheHandlerI with ChangeNotifier implements CacheHandler {
  // CacheHandlerI();

  late Box<dynamic> _cacheBox;

  @override
  Box<dynamic> getCacheBox() {
    return _cacheBox;
  }

  @override
  Future<void> init(String baxName) async {
    await Hive.initFlutter();
    _cacheBox = await Hive.openBox(baxName);
  }

  @override
  T? get<T>(String tag, {T? defaultValue}) {
    final dynamic value = _cacheBox.get(tag, defaultValue: defaultValue);
    if (value is T) {
      return value;
    } else {
      return defaultValue;
    }
  }

  @override
  void put(String tag, dynamic value) {
    _cacheBox.put(tag, value);
  }

  @override
  void delete(String tag) {
    _cacheBox.delete(tag);
  }

  @override
  String get locale => get(KCacheTags.locale, defaultValue: 'en') ?? 'en';

  @override
  void localeSet({required String locale}) => put(KCacheTags.locale, locale);

  @override
  void setToken({required String token}) => put(KCacheTags.token, token);

  @override
  String get token => get(KCacheTags.token, defaultValue: '') ?? '';

  @override
  void cleanBox() => _cacheBox.clear();

  @override
  void setThemeData({required bool isWhite}) =>
      put(KCacheTags.themeData, isWhite ? "white" : "dark");

  @override
  String get themeData =>
      get(KCacheTags.themeData, defaultValue: 'white') ?? 'white';

  @override
  void setUserId({required String userId}) {
    put(
      KCacheTags.userId,
      userId,
    );
  }

  @override
  String get userId => get(KCacheTags.userId, defaultValue: '') ?? "";

  @override
  void setUserRole({required String? userRole}) {
    if (userRole == null) return;
    put(
      KCacheTags.userRole,
      userRole,
    );
  }

  // @override
  // USERROLE? getUserRoleInEnum() =>
  //     convertStringToRoleEnum(get(KCacheTags.userRole));

  @override
  String? getUserRoleInString() => get(KCacheTags.userRole);

  @override
  void setUserName({required String? userName}) {
    if (userName == null) return;
    put(
      KCacheTags.userName,
      userName,
    );
  }

  @override
  String get userName => get(KCacheTags.userName, defaultValue: '') ?? "";
}
