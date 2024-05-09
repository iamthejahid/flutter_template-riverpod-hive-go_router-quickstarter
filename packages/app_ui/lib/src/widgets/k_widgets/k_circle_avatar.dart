import 'package:app_ui/app_ui.dart';

class KCircleAvatar extends StatelessWidget {
  const KCircleAvatar({
    Key? key,
    required this.imgUrl,
    this.radius = 20,
    this.onTap,
    this.icon,
    this.enableBorder = false,
    this.bgColor,
  }) : super(key: key);

  final String imgUrl;
  final double radius;
  final bool enableBorder;
  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.w),
      padding: EdgeInsets.all(4.w),
      child: Hero(
        tag: imgUrl.isEmpty ? UniqueKey() : imgUrl,
        child: CircleAvatar(
          radius: enableBorder ? radius + 1 : radius - 1,
          backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary,
          child: CircleAvatar(
            radius: radius,
            backgroundColor:
                bgColor ?? Theme.of(context).colorScheme.background,
            backgroundImage: imgUrl.isNotEmpty
                ? CachedNetworkImageProvider(
                    imgUrl,
                    errorListener: (e) =>
                        const Icon(Icons.error_outline_outlined),
                  )
                : null,
            child: icon,
          ),
        ),
      ),
    );
  }
}

class KCircularButton extends StatelessWidget {
  const KCircularButton({
    Key? key,
    this.radius = 20,
    this.onTap,
    this.icon,
    this.bgColor,
  }) : super(key: key);

  final double radius;

  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(200.w),
      color: Colors.transparent,
      child: KInkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(200.w),
        padding: EdgeInsets.all(4.w),
        child: Ink(
          color: Colors.transparent,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            child: icon,
          ),
        ),
      ),
    );
  }
}
