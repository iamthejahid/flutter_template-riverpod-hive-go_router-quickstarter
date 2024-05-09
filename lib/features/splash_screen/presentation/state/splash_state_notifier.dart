import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_template/core/const_values/const_strings.dart';
import 'package:flutter_template/core/local_cache/src/cache_provider.dart';
import 'package:flutter_template/core/router/src/router.dart';
import 'package:flutter_template/core/service_locator.dart';
import 'package:flutter_template/features/home_page/presentation/home_page.dart';
import 'package:flutter_template/features/login_screen/presentation/login_screen.view.dart';
import 'package:flutter_template/features/splash_screen/data/splash_repo.dart';
import 'package:flutter_template/features/splash_screen/presentation/state/splash_state.dart';

final splashNotifierProvider =
    StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return SplashNotifier(
    ref: ref,
    splashRepo: sl(),
  )..initFunc();
});

class SplashNotifier extends StateNotifier<SplashState> {
  final Ref ref;
  final SplashRepo splashRepo;
  SplashNotifier({
    required this.ref,
    required this.splashRepo,
  }) : super(SplashState.init());

  stateMaker(SplashState st) => state = st;

  firingToMainOps() {
    final String? token = ref.watch(hiveProvider).token;
    if (token == null || token.isEmpty) {
      ref.watch(routerProvider).goNamed(LoginScreen.name);
    } else {
      ref.watch(routerProvider).goNamed(HomeScreen.name);
    }
  }

  initFunc() async {
    stateMaker(state.copyWith(isLoading: true));

    try {
      AppVersionRes? versionCheck =
          await splashRepo.getAppVersion(currenAppVersion: APP_VERSION);
      stateMaker(state.copyWith(isLoading: false, isSplashDone: true));
      if (versionCheck?.data?.isForce ?? false) {
        stateMaker(state.copyWith(appUpdateType: AppUpdateType.FORCE));
      } else if (versionCheck?.data?.isSoft ?? false) {
        stateMaker(state.copyWith(appUpdateType: AppUpdateType.SOFT));
      } else {
        stateMaker(state.copyWith(appUpdateType: AppUpdateType.NOUPDATE));
        firingToMainOps();
      }
    } catch (e) {
      stateMaker(state.copyWith(appUpdateType: AppUpdateType.NOUPDATE));
      firebaseOpertion();
      firingToMainOps();
    }
    stateMaker(state.copyWith(isLoading: false));
  }
}

firebaseOpertion() async {
  // bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowed) {
  //   await AwesomeNotifications().requestPermissionToSendNotifications();
  // }
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   _notifyUser(message);
  // });

  // // FirebaseMessaging.instance
  // //     .getToken()
  // //     .then((value) => Clipboard.setData(ClipboardData(text: '$value')));

  // // ON clicking functionality.
  // // AwesomeNotifications().actionStream.listen((event) => _pageFiring(event));

  // AwesomeNotifications()
  //     .setListeners(onActionReceivedMethod: onActionReceivedMethod);

  // FirebaseMessaging.onMessageOpenedApp
  //     .listen((RemoteMessage message) => _coldStart(message));

  // FirebaseMessaging.instance
  //     .getInitialMessage()
  //     .then((value) => _coldStart(value));
}

  // @pragma('vm:entry-point')
  // Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async =>
  //     _pageFiring(receivedAction);

  // _coldStart(RemoteMessage? message) {
    // if (isNotNullOrEmpty(message?.data["outer_link"])) {
    //   DocChatUtils.customLunch(message!.data["outer_link"]!);
    // } else if (isNotNullOrEmpty(message?.data["page_link"])) {
    //   if (message?.data["page_link"] == "chatViewV2" &&
    //       (isNotNullOrEmpty(message?.data["page_val_1"]) &&
    //           isNotNullOrEmpty(message?.data["page_val_2"]))) {
    //     ref.read(routerProvider).goNamed(
    //           message?.data["page_link"]!,
    //           extra: ChatViewModel(
    //             title: message?.data["page_val_1"]!,
    //             chatType:
    //                 DocChatUtils.enumGenerator(message?.data["page_val_1"]!),
    //           ),
    //         );
    //   } else {
    //     ref.read(routerProvider).goNamed(message?.data["page_link"]!);
    //   }
    // }
  // }

  // _pageFiring(ReceivedAction event) {
    // if (isNotNullOrEmpty(event.payload?["outer_link"])) {
    //   DocChatUtils.customLunch(event.payload!["outer_link"]!);
    // } else if (isNotNullOrEmpty(event.payload?["page_link"])) {
    //   if (event.payload?["page_link"] == "chatViewV2" &&
    //       (isNotNullOrEmpty(event.payload?["page_val_1"]) &&
    //           isNotNullOrEmpty(event.payload?["page_val_2"]))) {
    //     ref.read(routerProvider).goNamed(
    //           event.payload!["page_link"]!,
    //           extra: ChatViewModel(
    //             title: event.payload!["page_val_1"]!,
    //             chatType:
    //                 DocChatUtils.enumGenerator(event.payload!["page_val_1"]!),
    //           ),
    //         );
    //   } else {
    //     ref.read(routerProvider).goNamed(event.payload!["page_link"]!);
    //   }
    // }
  // }

//   _notifyUser(RemoteMessage msg) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//           channelKey: msg.notification?.android?.channelId ?? "basic",
//           id: Random().nextInt(2147483647),
//           body: msg.notification?.body,
//           title: msg.notification?.title,
//           bigPicture: msg.notification?.android?.imageUrl ?? "",
//           largeIcon: "resource://drawable/push_two",
//           notificationLayout: msg.notification?.android?.imageUrl != null
//               ? NotificationLayout.BigPicture
//               : NotificationLayout.BigText,
//           autoDismissible: true,
//           payload:
//               msg.data.map((key, value) => MapEntry(key, value.toString()))),
//     );
//   }
// }

// bool isNotNullOrEmpty(String? object) => object != null && object.isNotEmpty;
