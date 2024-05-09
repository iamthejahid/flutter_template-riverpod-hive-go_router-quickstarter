import 'package:app_ui/app_ui.dart';
import 'package:flutter_template/features/splash_screen/presentation/state/splash_state.dart';
import 'package:flutter_template/features/splash_screen/presentation/state/splash_state_notifier.dart';
import 'package:flutter_template/features/splash_screen/presentation/widgets/app_update_dialog.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  static String get path => '/splashScreen';
  static String get name => '/splashScreen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    forcingForUpate(bool isForce) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) => AppUpdateDialog(
          isForce: isForce,
        ),
      );
    }

    ref.listen(splashNotifierProvider, (prev, next) {
      if (next.appUpdateType == AppUpdateType.FORCE ||
          next.appUpdateType == AppUpdateType.SOFT) {
        forcingForUpate(next.appUpdateType == AppUpdateType.FORCE);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.m3KeyColorsPrimary,
      body: Container(
        padding: EdgeInsets.all(6.w),
        child: Center(
          child: Container(
            child: FlutterLogo(
              size: 100.w,
            ),
          ).animate().scale(
                begin: Offset(.5, .5),
                duration: const Duration(seconds: 1),
              ),
        ),
      ),
    );
  }
}
