import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KDarkerBGContainer extends StatelessWidget {
  const KDarkerBGContainer(
      {Key? key,
      required this.borderRadius,
      required this.padding,
      required this.child,
      this.width,
      this.height})
      : super(key: key);

  final double borderRadius, padding;
  final Widget child;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Theme.of(context).colorScheme.secondary.withOpacity(.13),
          border: Border.all(
            color: Theme.of(context).primaryColorLight.withOpacity(.1),
            width: 1.2.w,
          ),
        ),
        child: child);
  }
}
