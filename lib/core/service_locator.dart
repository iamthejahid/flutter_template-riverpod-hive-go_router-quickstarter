import 'package:get_it/get_it.dart';
import 'package:flutter_template/core/local_cache/src/cache_abstract.dart';
import 'package:flutter_template/core/local_cache/src/cache_handler.dart';
import 'package:flutter_template/features/splash_screen/data/splash_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerLazySingleton<CacheHandler>(CacheHandlerI.new)
    ..registerLazySingleton<SplashRepo>(SplashRepoImpl.new);
}
