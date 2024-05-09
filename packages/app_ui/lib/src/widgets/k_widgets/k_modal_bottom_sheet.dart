import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

kShowBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showBottomSheet(
    // expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    builder: (context) => Container(
      // height: height,
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IntrinsicHeight(child: child),
    ),
  );
}

class KShowBottomSheet extends HookConsumerWidget {
  const KShowBottomSheet({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
