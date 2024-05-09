import 'package:app_ui/app_ui.dart';

class KCheckBoxTile extends StatelessWidget {
  const KCheckBoxTile(
      {Key? key,
      this.value,
      this.onChanged,
      required this.title,
      this.trailing,
      this.padding})
      : super(key: key);

  final bool? value;
  final void Function(bool?)? onChanged;
  final String title;
  final String? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: () => onChanged?.call(value),
      child: Padding(
        padding: padding ?? EdgeInsetsDirectional.fromSTEB(4.w, 0, 20.w, 0),
        child: Row(
          crossAxisAlignment: crossCenter,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              tristate: true,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
              ),
            ),
            Text(
              title,
              style: UITextStyle.headline1,
            ),
            const Spacer(),
            trailing != null
                ? Text(
                    trailing!,
                    style: UITextStyle.headline2,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
