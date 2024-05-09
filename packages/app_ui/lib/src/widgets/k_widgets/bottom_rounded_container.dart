import 'package:app_ui/app_ui.dart';

class BottomRoundedContainer extends StatelessWidget {
  const BottomRoundedContainer({
    Key? key,
    required this.child,
    this.height,
    this.backgroundColor = AppColors.white,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1.sw,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: child,
    );
  }
}
