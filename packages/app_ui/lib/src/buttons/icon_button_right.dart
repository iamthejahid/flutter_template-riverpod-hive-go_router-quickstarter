import 'package:app_ui/app_ui.dart';

class KRightElevatedButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? leftIcon;
  final String buttonName;
  final double? verticalpadding;
  final double? horizontalpadding;
  const KRightElevatedButtonIcon({
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
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: onPressed,
                icon: leftIcon ??
                    Icon(
                      Icons.arrow_back,
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

class KRighttNotFilledElevatedButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? righticon;
  final String buttonName;
  final double? verticalpadding;
  final double? horizontalpadding;
  const KRighttNotFilledElevatedButtonIcon({
    super.key,
    required this.onPressed,
    this.righticon,
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
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: onPressed,
                icon: righticon ??
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                label: Text(
                  buttonName,
                  style: ContentTextStyle.m3BodyLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KRightNotFilledElevatedButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? righticon;
  final String buttonName;
  final double? verticalpadding;
  final double? horizontalpadding;
  const KRightNotFilledElevatedButtonIcon({
    super.key,
    required this.onPressed,
    this.righticon,
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
              textDirection: TextDirection.rtl,
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
                icon: righticon ??
                    Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryColor,
                    ),
                label: Text(
                  buttonName,
                  style: ContentTextStyle.m3BodyLarge.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
