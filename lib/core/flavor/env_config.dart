class EnvConfig {
  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.hiveBoxName,
    this.shouldCollectCrashLog = false,
  });
  final String appName;
  final bool shouldCollectCrashLog;
  final String baseUrl;
  final String hiveBoxName;
}
