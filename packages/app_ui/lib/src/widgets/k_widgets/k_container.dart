import 'package:app_ui/app_ui.dart';

class KContainer extends StatelessWidget {
  const KContainer({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding:
          padding ?? EdgeInsetsDirectional.fromSTEB(12.w, 16.h, 12.w, 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: radius6,
      ),
      child: child,
    );
  }
}
