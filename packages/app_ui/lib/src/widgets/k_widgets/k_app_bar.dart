import 'package:app_ui/app_ui.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    Key? key,
    required this.titleText,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.titleTextStyle,
    this.centerTitle = true,
    this.bottom,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  final Widget? leading;
  final String titleText;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: AppColors.black,
      leading: leading,
      title: Text(
        titleText,
        style: titleTextStyle ?? ContentTextStyle.textStyle16w600,
      ),
      actions: actions,
      bottom: bottom,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
