import 'package:app_ui/app_ui.dart';

class LabeledTextRow extends StatelessWidget {
  final String label;
  final String text;
  final bool isBold;
  final Widget? midWidget;
  final TextStyle? ktextStyle;

  LabeledTextRow({
    required this.label,
    required this.text,
    this.isBold = false,
    this.midWidget,
    this.ktextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$label:",
          style: AppTextStyle.m3TitleMedium,
        ),
        midWidget ?? Spacer(),
        // gap10,
        Text(
          text,
          style: ktextStyle ??
              (isBold ? AppTextStyle.m3TitleMedium : AppTextStyle.m3BodyLarge),
          softWrap: true,
        ),
      ],
    );
  }
}

class LabeledTextRowFlexible extends StatelessWidget {
  final String label;
  final String text;
  final Widget? midGap;

  LabeledTextRowFlexible({
    required this.label,
    required this.text,
    this.midGap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label:",
          style: AppTextStyle.m3TitleMedium,
        ),
        // Spacer(),
        midGap ?? gap12,
        Expanded(
          child: Text(
            text,
            style:
                AppTextStyle.m3BodyLarge.copyWith(overflow: TextOverflow.fade),
            textAlign: TextAlign.right,

            // softWrap: true,
          ),
        ),
      ],
    );
  }
}
