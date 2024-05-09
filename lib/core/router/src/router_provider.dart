import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: always_use_package_imports
import 'router.dart';

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});
