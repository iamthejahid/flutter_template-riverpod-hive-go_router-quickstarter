import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KListViewSeparated extends StatelessWidget {
  const KListViewSeparated({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.separator,
    this.alternateWidget,
    this.scrollDirection = Axis.vertical,
    this.gap = 10,
    this.controller,
    this.edgePadding,
    this.padding,
    this.reverse = false,
  });

  final bool shrinkWrap;
  final ScrollPhysics physics;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget? separator;
  final Widget? alternateWidget;
  final int itemCount;
  final Axis scrollDirection;
  final double gap;
  final ScrollController? controller;
  final double? edgePadding;
  final EdgeInsetsGeometry? padding;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding ??
          (scrollDirection == Axis.vertical
              ? EdgeInsets.symmetric(
                  vertical: edgePadding ?? gap.h,
                  horizontal: 10.w,
                )
              : EdgeInsets.symmetric(
                  horizontal: edgePadding ?? gap.w,
                  vertical: 10.h,
                )),
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemBuilder: itemCount == 0
          ? (context, index) =>
              Center(child: alternateWidget ?? const Text('No data found'))
          : itemBuilder,
      controller: controller,
      reverse: reverse,
      separatorBuilder: (context, index) {
        return separator ??
            (scrollDirection == Axis.vertical
                ? SizedBox(
                    height: gap.h,
                  )
                : SizedBox(
                    width: gap.w,
                  ));
      },
      itemCount: itemCount == 0 ? 1 : itemCount,
    );
  }
}
