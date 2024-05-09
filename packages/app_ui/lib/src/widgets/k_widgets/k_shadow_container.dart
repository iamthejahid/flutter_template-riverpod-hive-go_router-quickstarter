import 'package:app_ui/app_ui.dart';

class KShadowContainer extends StatelessWidget {
  const KShadowContainer({
    required this.child,
    super.key,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.blurRadius = 10,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;
  final Widget child;
  final BorderRadius borderRadius;
  final double blurRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: borderRadius,
        border: Border.all(
          color: AppColors.spaceScape100,
          width: .2,
        ),
        boxShadow: [
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.8),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(0, 4),
          // ),
          // const BoxShadow(
          //   color: Colors.white,
          //   blurRadius: 10,
          //   spreadRadius: 4,
          //   offset: Offset(4, 0),
          // ),
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.05),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(1, 0),
          // ),
          // const BoxShadow(
          //   color: Colors.white,
          //   blurRadius: 10,
          //   spreadRadius: 4,
          //   offset: Offset(-4, 0),
          // ),
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.05),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(-1, 0),
          // ),
          // const BoxShadow(
          //   color: Colors.white,
          //   blurRadius: 3,
          //   spreadRadius: 1,
          //   offset: Offset(0, -4),
          // ),
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.05),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(0, -4),
          // ),
          BoxShadow(
            color: const Color(0xffa6abbd).withOpacity(.35),
            blurRadius: blurRadius,
            offset: const Offset(5, 5),
          ),
          // BoxShadow(
          //   color: AppColors.shadowBorderColor,
          //   blurRadius: blurRadius,
          //   spreadRadius: 0,
          //   offset: const Offset(-2, 0),
          // ),
          // BoxShadow(
          //   color: AppColors.white,
          //   blurRadius: blurRadius,
          //   spreadRadius: 0,
          //   offset: const Offset(-3, -3),
          // ),
        ],
      ),
      child: KInkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
