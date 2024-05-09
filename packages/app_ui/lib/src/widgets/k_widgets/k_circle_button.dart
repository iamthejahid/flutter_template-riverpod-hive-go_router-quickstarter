import 'package:flutter/material.dart';

class KCircleButton extends StatelessWidget {
  const KCircleButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.size = 16,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        minimumSize: MaterialStateProperty.all(Size(size, size)),
        maximumSize: MaterialStateProperty.all(Size(size, size)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
