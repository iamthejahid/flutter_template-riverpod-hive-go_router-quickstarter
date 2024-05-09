// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool isLoading;
  final bool isLoggedIn;
  final bool isSplashDone;
  final AppUpdateType appUpdateType;
  const SplashState({
    required this.isLoading,
    required this.isLoggedIn,
    required this.isSplashDone,
    required this.appUpdateType,
  });

  @override
  List<Object> get props => [
        isLoading,
        isLoggedIn,
        isSplashDone,
        appUpdateType,
      ];

  SplashState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    bool? isSplashDone,
    AppUpdateType? appUpdateType,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isSplashDone: isSplashDone ?? this.isSplashDone,
      appUpdateType: appUpdateType ?? this.appUpdateType,
    );
  }

  factory SplashState.init() => const SplashState(
        isLoading: false,
        isLoggedIn: false,
        isSplashDone: false,
        appUpdateType: AppUpdateType.INITIAL,
      );

  @override
  bool get stringify => true;
}

enum AppUpdateType {
  /// Force Update: Requires the user to update the app before further use.
  FORCE,

  /// Soft Update: Encourages the user to update but allows continued app usage.
  SOFT,

  /// No Update: No update is required, the app is up to date.
  NOUPDATE,

  INITIAL,
}
