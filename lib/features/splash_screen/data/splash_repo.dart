import 'package:flutter_template/core/nework/src/network_handler.dart';
import 'package:flutter_template/features/splash_screen/domain/app_version_res.dart';
export 'package:flutter_template/features/splash_screen/domain/app_version_res.dart';

abstract class SplashRepo {
  Future<AppVersionRes?> getAppVersion({required String currenAppVersion});
}

class SplashRepoImpl extends SplashRepo {
  final netWorkHandler = NetworkHandler.instanceBasic;

  @override
  Future<AppVersionRes?> getAppVersion(
      {required String currenAppVersion}) async {
    final res = await netWorkHandler.get(
        url: "version/current-app-version/$currenAppVersion");
    if (res.response != null) {
      return AppVersionRes.fromJson(res.response!);
    } else {
      return null;
    }
  }
}
