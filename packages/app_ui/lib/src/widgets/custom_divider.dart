import 'package:app_ui/app_ui.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final Color? color;
  const CustomDivider({
    super.key,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1.w,
      decoration: BoxDecoration(
        color: color ?? Colors.grey,
      ),
    );
  }
}
