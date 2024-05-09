import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_template/core/local_cache/src/cache_abstract.dart';
import 'package:flutter_template/core/local_cache/src/cache_handler.dart';

final hiveProvider = Provider<CacheHandler>((_) => CacheHandlerI());

final hiveEventStreamProvider = StreamProvider<BoxEvent>((ref) {
  return ref.watch(hiveProvider).getCacheBox().watch();
});
