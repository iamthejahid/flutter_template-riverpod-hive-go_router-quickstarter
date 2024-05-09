import 'package:app_ui/app_ui.dart';

class CustomSqButton extends StatelessWidget {
  const CustomSqButton({
    super.key,
    this.onPressed,
    this.color = Colors.green,
    required this.buttonName,
    this.buttonTextColor,
    this.prevWidget,
  });

  final GestureTapCallback? onPressed;
  final Color color;
  final Color? buttonTextColor;
  final String buttonName;
  final Widget? prevWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8.r))),
        padding: EdgeInsets.all(6.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prevWidget != null) prevWidget!,
            Text(
              buttonName,
              textAlign: TextAlign.center,
              style: AppTextStyle.m3BodyLarge.copyWith(
                color: buttonTextColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
