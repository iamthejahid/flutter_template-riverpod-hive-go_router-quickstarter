import 'package:app_ui/app_ui.dart';

class AppbarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget? customTitle;
  const AppbarWithBackButton({
    super.key,
    required this.title,
    this.customTitle,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      centerTitle: true,
      elevation: 2,
      backgroundColor: AppColors.blue,
      title: customTitle == null
          ? Text(
              title,
              style: UITextStyle.subtitle1,
            )
          : customTitle,
    );
  }
}
