import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';
import 'package:flutter_template/core/nework/netowrk.dart';
import 'package:flutter_template/core/router/src/router.dart';
import 'package:flutter_template/l10n/l10n.dart';

class App extends ConsumerWidget {
  App({super.key});

  final netBasic = NetworkHandler.instanceBasic;
  final netNotBasic = NetworkHandler.instanceNotBasic;

  @override
  Widget build(BuildContext context, ref) {
    netBasic.refpopulated = ref;
    netNotBasic.refpopulated = ref;

    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 696 - 56),
      minTextAdapt: true,
      builder: (_, c) => DismissKeyboard(
        child: MaterialApp.router(
          /// For preventing system dark.
          themeMode: ThemeMode.light,
          theme:
              // themeProvider == "dark"
              //     ? const AppDarkTheme().themeData
              //     :
              const AppTheme().themeData,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    );
  }
}
