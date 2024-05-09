import 'package:app_ui/app_ui.dart';

class KTextDivider extends HookConsumerWidget {
  const KTextDivider({
    required this.text,
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final EdgeInsetsGeometry padding;
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              endIndent: 32.w,
              thickness: 1.1,
              color: AppColors.harrisonGrey600,
            ),
          ),
          Text(
            text.toUpperCase(),
            style: ContentTextStyle.textStyle12w600HG1000
                .copyWith(letterSpacing: 1.5.w),
          ),
          Expanded(
            child: Divider(
              indent: 32.w,
              thickness: 1.1,
              color: AppColors.harrisonGrey600,
            ),
          ),
        ],
      ),
    );
  }
}
