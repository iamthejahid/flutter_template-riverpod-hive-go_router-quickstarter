import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KExitDialog extends StatelessWidget {
  const KExitDialog({
    Key? key,
    this.content,
    this.onYesPressed,
    this.onNoPressed,
  }) : super(key: key);
  final String? content;
  final Function? onYesPressed;
  final Function? onNoPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure?"),
      content: content == null
          ? const SizedBox.shrink()
          : Text(
              content!,
              style: const TextStyle(
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
      actions: [
        SizedBox(
          width: 125.w,
          child: OutlinedButton(
            onPressed: () {
              onYesPressed?.call();
              Navigator.pop(context, true);
            },
            // foregroundColor: context.theme.primaryColor,
            child: const Text("Yes"),
          ),
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: 125.w,
          child: ElevatedButton(
            onPressed: () {
              onNoPressed?.call();
              Navigator.pop(context, false);
            },
            child: const Text("No"),
          ),
        ),
      ],
    );
  }
}
