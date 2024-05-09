import 'package:app_ui/app_ui.dart';

class KLeftElevatedButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? leftIcon;
  final String buttonName;
  final double? verticalpadding;
  final double? horizontalpadding;
  const KLeftElevatedButtonIcon({
    super.key,
    required this.onPressed,
    this.leftIcon,
    required this.buttonName,
    this.verticalpadding,
    this.horizontalpadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalpadding ?? 8.sp,
        vertical: verticalpadding ?? 8.sp,
      ),
      child: Row(
        children: [
          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ElevatedButton.icon(
                onPressed: onPressed,
                icon: leftIcon ??
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                label: Text(buttonName,
                    style: ContentTextStyle.m3BodyLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KLeftNotFilledElevatedButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? leftIcon;
  final String buttonName;
  final double? verticalpadding;
  final double? horizontalpadding;
  const KLeftNotFilledElevatedButtonIcon({
    super.key,
    required this.onPressed,
    this.leftIcon,
    required this.buttonName,
    this.verticalpadding,
    this.horizontalpadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalpadding ?? 8.sp,
        vertical: verticalpadding ?? 8.sp,
      ),
      child: Row(
        children: [
          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.white,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0.r),
                      side: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                onPressed: onPressed,
                icon: leftIcon ??
                    Icon(
                      Icons.check,
                      color: AppColors.primaryColor,
                    ),
                label: Text(buttonName,
                    style: ContentTextStyle.m3BodyLarge.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
