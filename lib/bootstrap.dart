// ignore_for_file: noop_primitive_operations, always_use_package_imports

import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter_template/core/flavor/build_config.dart';
import 'package:flutter_template/core/nework/netowrk.dart';

import 'package:flutter_template/core/service_locator.dart' as service_locator;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/local_cache/local_cache.dart';

class ProviderLog extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('\x1B[32m${newValue}\x1B[0m', name: '📟 NEW STATE 📟');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // FlutterError.onError = (details) {
  //   log(details.exceptionAsString(), stackTrace: details.stack);
  // };

  // final firebaseHandlerInstance = FirebaseHandler.instance;

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    log('', error: error, name: "ERROR");
    log('', error: stack, name: "ERROR STACK");

    return true;
  };

  // firebaseHandlerInstance.setCrashUserID();

  final container = ProviderContainer(
    observers: [ProviderLog()],
  );

  await service_locator.init();

  final box = container.read(hiveProvider);

  final boxName = BuildConfig.instance.config.hiveBoxName;

  await box.init(boxName);

  final netBasic = NetworkHandler.instanceBasic;
  final netNotBasic = NetworkHandler.instanceNotBasic;

  netBasic.setToken(box.get(KCacheTags.token) ?? "");
  netNotBasic.setToken(box.get(KCacheTags.token) ?? "");

  runApp(
    ProviderScope(
      parent: container,
      observers: [ProviderLog()],
      child: await builder(),
    ),
  );
}
