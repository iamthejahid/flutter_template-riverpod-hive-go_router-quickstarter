import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';
import 'package:flutter_template/core/const_values/const_strings.dart';

class AppUpdateDialog extends StatelessWidget {
  const AppUpdateDialog({
    super.key,
    required this.isForce,
  });

  final bool isForce;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.r),

        // title: Text('New Update Available!'),
        // content: Text(
        //   isForce
        //       ? '$APP_NAME recommends that you update to the latest version.'
        //       : 'A new version of $APP_NAME is available!\n\nWould you like to update it now?',
        // ),
        // actions: <Widget>[
        //   if (!isForce)
        //     TextButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       child: Text('Skip'),
        //     ),
        // TextButton(
        //   onPressed: () => {
        //     UrlUtils.customLunch(APPLINK_GOOGLE),
        //   },
        //   child: Text('Update'),
        // )
        // ],
      ),
      child: Container(
        height: 135.h,
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.w, top: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          color: AppColors.m3RefNeutralNeutral94,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'New Update Available',
                    style: ContentTextStyle.textStyle14w500HG900
                        .copyWith(color: AppColors.m3SysLightOnSurfaceVariant),
                  ),
                  gap12,
                  Text(
                    'A new version of $APP_NAME is available!Would you like to update now?',
                    style: ContentTextStyle.textStyle14w400
                        .copyWith(color: AppColors.m3SysLightOnSurfaceVariant),
                  )
                ],
              ),
            ),
            gap12,
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      UrlUtils.customLunch(APPLINK_GOOGLE);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        'Update',
                        style: ContentTextStyle.bodyText1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                if (!isForce)
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Skip',
                        style: ContentTextStyle.bodyText1.copyWith(
                          color: AppColors.m3RefPrimaryPrimary30,
                          fontWeight: FontWeight.w400,
                        ),
                      ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
