import 'package:app_utils/app_utils.dart';

class UrlUtils {
  static customLunch(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
