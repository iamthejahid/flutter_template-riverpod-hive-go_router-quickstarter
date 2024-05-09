import 'package:app_ui/app_ui.dart';

class InputCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const InputCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      padding: padding ?? EdgeInsets.all(12.w),
      decoration: CUSTOM_CARD_DECORATION.copyWith(color: color),
      child: child,
    );
  }
}

class InputCardTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const InputCardTitle({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: AppTextStyle.m3TitleMedium.copyWith(color: color),
    );
  }
}
