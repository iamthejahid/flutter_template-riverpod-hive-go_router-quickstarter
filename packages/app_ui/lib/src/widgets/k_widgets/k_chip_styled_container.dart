import 'package:flutter/material.dart';

class KChipStyledContainer extends StatelessWidget {
  const KChipStyledContainer({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.height = double.infinity,
    this.width,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final double? height, width;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height,
          padding: padding,
          margin: margin,
          decoration: ShapeDecoration(
            color: backgroundColor ?? Theme.of(context).colorScheme.background,
            shape: const StadiumBorder(),
            shadows: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(.1),
                offset: const Offset(2, 2),
                blurRadius: 5,
                spreadRadius: .5,
              ),
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(.1),
                offset: const Offset(-2, 2),
                blurRadius: 5,
                spreadRadius: .5,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-2, -2),
                blurRadius: 5,
                spreadRadius: .5,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(2, -2),
                blurRadius: 5,
                spreadRadius: .5,
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: child),
    );
  }
}
