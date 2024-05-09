import 'package:flutter/material.dart';

class KTextButton extends StatelessWidget {
  const KTextButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.style,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
      onPressed: () => onPressed,
      child: child,
    );
  }
}
