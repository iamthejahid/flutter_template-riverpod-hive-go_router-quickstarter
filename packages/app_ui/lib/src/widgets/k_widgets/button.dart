import 'package:app_ui/app_ui.dart';

class KIconElevatedButton extends HookConsumerWidget {
  const KIconElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.loading = false,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final bool? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        // shape: MaterialStateProperty.all(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.r),
        //   ),
        // ),
        minimumSize: MaterialStateProperty.all(Size.fromHeight(55.h)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : Row(
              children: [
                Expanded(child: Center(child: Text(text))),
                Material(
                  elevation: 4,
                  color: backgroundColor ?? Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(100.r),
                  child: Padding(
                    padding: EdgeInsets.all(6.w),
                    child: icon,
                  ),
                ),
              ],
            ),
    );
  }
}

class KElevatedButton extends HookConsumerWidget {
  const KElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
    this.child,
    this.isSecondary = false,
    this.textStyle,
    this.size,
  }) : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;
  final bool isSecondary;
  final TextStyle? textStyle;
  final Size? size;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(55.h)),
        textStyle: MaterialStateProperty.all(textStyle),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return context.theme.disabledColor;
          }
          return backgroundColor ??
              (isSecondary
                  ? context.color.secondary
                  : context.color.primary); // Use the component's default.
        }),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        overlayColor: MaterialStateProperty.all(
          isSecondary ? context.color.secondary : context.color.primary,
        ),
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  isSecondary
                      ? context.color.onSecondaryContainer
                      : context.color.onPrimaryContainer,
                ),
              ),
            )
          : child ??
              Text(
                text,
              ),
    );
  }
}

class KOutlinedButton extends HookConsumerWidget {
  const KOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
    this.textStyle,
    this.borderColor,
    this.size,
    this.isSecondary = true,
  }) : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? loading;
  final TextStyle? textStyle;
  final Size? size;
  final bool isSecondary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: ButtonStyle(
        // shape: MaterialStateProperty.all(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.r),
        //   ),
        // ),

        minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(48.h)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        side: MaterialStateProperty.all(
          BorderSide(
            color: borderColor ??
                (isSecondary
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary),
          ),
        ),
        overlayColor: MaterialStateProperty.all(
          (isSecondary
              ? Theme.of(context).colorScheme.secondary.withOpacity(.1)
              : Theme.of(context).colorScheme.primary.withOpacity(.1)),
        ),
      ),
      onPressed: onPressed,
      child: (loading != null && loading!.value)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: isSecondary
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                letterSpacing: 1.50,
                fontFamily: "Open Sans",
              ),
            ),
    );
  }
}

class KButton extends HookConsumerWidget {
  const KButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
    this.child,
  }) : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      // style: ButtonStyle(
      //   // shape: MaterialStateProperty.all(
      //   //   RoundedRectangleBorder(
      //   //     borderRadius: BorderRadius.circular(10.r),
      //   //   ),
      //   // ),
      //   // minimumSize: MaterialStateProperty.all(Size.fromHeight(55.h)),
      //   backgroundColor: MaterialStateProperty.all(backgroundColor),
      //   foregroundColor: MaterialStateProperty.all(foregroundColor),
      // ),

      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : child ??
              Text(
                text,
              ),
    );
  }
}
