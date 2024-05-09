import 'package:flutter/material.dart';

class KIconCircleButton extends StatelessWidget {
  const KIconCircleButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.padding = 8,
  }) : super(key: key);
  final VoidCallback? onTap;
  final Widget child;
  final double padding;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      // elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: InkWell(onTap: onTap, child: child),
      ),
    );
  }
}
