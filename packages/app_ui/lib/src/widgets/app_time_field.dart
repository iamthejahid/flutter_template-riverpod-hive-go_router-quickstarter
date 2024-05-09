import 'package:app_ui/app_ui.dart';
import 'package:intl/intl.dart' show DateFormat;

class AppTimeField extends StatelessWidget {
  const AppTimeField({
    super.key,
    required this.controller,
    required this.format,
    this.hintText,
    this.labelText,
    required this.isTimeSelected,
    this.onClearPressed,
  });

  final TextEditingController controller;
  final DateFormat format;
  final String? hintText;
  final String? labelText;
  final bool isTimeSelected;
  final VoidCallback? onClearPressed;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: isTimeSelected
            ? IconButton(
                onPressed: onClearPressed,
                icon: Icon(
                  Icons.close,
                ))
            : Icon(
                Icons.calendar_month,
                color: AppColors.m3KeyColorsPrimary,
              ),

        // size: 16.sw,

        suffixIconConstraints: const BoxConstraints.tightFor(
          width: 32,
          height: 32,
        ),
        prefixIconConstraints: const BoxConstraints.tightFor(
          width: 48,
        ),
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
    );
  }
}
