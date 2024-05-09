import 'package:app_ui/app_ui.dart';

class IconButtonWithLabel extends StatelessWidget {
  const IconButtonWithLabel({
    super.key,
    required this.label,
    required this.imageIcon,
    this.rightIcon,
    this.onPressed,
  });
  final String label;
  final String imageIcon;
  final Widget? rightIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onDoubleTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageIcon,
              color: Colors.white,
              height: 20.h,
              width: 20.w,
            ),
            Spacer(),
            Text(
              label,
              style: AppTextStyle.m3BodyLarge.copyWith(
                color: Colors.white,
              ),
            ),
            Spacer(),
            if (rightIcon != null) rightIcon!,
            if (rightIcon == null)
              Icon(Icons.arrow_forward, color: Colors.white, size: 20.w),
          ],
        ),
      ),
    );
  }
}
