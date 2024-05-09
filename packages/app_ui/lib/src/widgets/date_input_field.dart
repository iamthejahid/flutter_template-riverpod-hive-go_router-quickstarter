import 'package:app_ui/app_ui.dart';
// import 'package:app_ui/src/formattors/date_time_formattors.dart';
// import 'package:app_ui/src/validator/input_validator.dart';
// import 'package:flutter/services.dart';

class DateInputField extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState>? formFieldKey;
  final String labelText;
  final String hintText;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final bool prevDateSelectionBlock;
  final bool todaysDateOnly;
  final bool isRequired;

  DateInputField({
    required this.controller,
    this.formFieldKey,
    required this.labelText,
    this.hintText = "DD/MM/YYYY",
    this.onSubmitted,
    this.onChanged,
    this.prevDateSelectionBlock = false,
    this.todaysDateOnly = false,
    this.isRequired = true,
  });

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  formatDate(DateTime date) {
    // Convert dateTime to 12/03/2021 format
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  void initState() {
    dateHandler();
    super.initState();
  }

  dateHandler() {
    if (widget.todaysDateOnly) {
      widget.controller.text = formatDate(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      readOnly: true,
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: "DD/MM/YYYY",
      isRequired: widget.isRequired,
      onTap: widget.todaysDateOnly
          ? null
          : () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: widget.prevDateSelectionBlock
                    ? DateTime.now()
                    : DateTime(1990),
                lastDate: DateTime(2090),
              );
              if (selectedDate != null) {
                widget.controller.text = formatDate(selectedDate);
              }
            },
    );
  }
}
