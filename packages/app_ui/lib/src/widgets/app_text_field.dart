import 'package:app_ui/app_ui.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  /// {@macro app_text_field}
  const AppTextField({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = true,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obSecureText = false,
    this.formFieldKey,
    this.validator,
    this.labelText,
    this.labelStyle,
    this.prefixText,
    this.contentPadding,
    this.isRequired = true,
    this.maxLines,
  });

  /// A value to initialize the field to.
  final String? initialValue;

  /// List of auto fill hints.
  final Iterable<String>? autoFillHints;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to enable autocorrect.
  /// Defaults to true.
  final bool autocorrect;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool readOnly;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that appears below the field.
  final String? errorText;

  /// A widget that appears before the editable part of the text field.
  final Widget? prefix;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// The type of keyboard to use for editing the text.
  /// Defaults to [TextInputType.text] if maxLines is one and
  /// [TextInputType.multiline] otherwise.
  final TextInputType? keyboardType;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field has been tapped.
  final VoidCallback? onTap;

  /// For obsecuring
  final bool obSecureText;

  final GlobalKey<FormFieldState>? formFieldKey;
  final FormFieldValidator<String>? validator;

  final String? labelText;

  final TextStyle? labelStyle;

  final String? prefixText;
  final EdgeInsetsGeometry? contentPadding;
  final bool isRequired;
  final int? maxLines;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObSecure = false;

  toggleObsecure() => setState(() => isObSecure = !isObSecure);

  @override
  void initState() {
    isObSecure = widget.obSecureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: widget.maxLines,
          key: widget.formFieldKey,
          initialValue: widget.initialValue,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          autocorrect: widget.autocorrect,
          readOnly: widget.readOnly,
          autofillHints: widget.autoFillHints,
          // cursorColor: AppColors.darkAqua,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
          onFieldSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            prefixText: widget.prefixText,
            // labelText: widget.labelText,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Text(
                  widget.labelText ?? "",
                  overflow: TextOverflow.ellipsis,
                )),
                if (widget.isRequired)
                  Text("*", style: const TextStyle(color: Colors.red)),
              ],
            ),
            suffixStyle: TextStyle(
              color: Colors.red,
            ),
            labelStyle: widget.labelStyle,
            hintText: widget.hintText,
            errorText: widget.errorText,
            prefixIcon: widget.prefix,
            suffixIcon: widget.obSecureText
                ? isObSecure
                    ? IconButton(
                        onPressed: toggleObsecure,
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                        ))
                    : IconButton(
                        onPressed: toggleObsecure,
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.m3KeyColorsPrimary,

                          // size: 16.sw,
                        ))
                : widget.suffix,
            suffixIconConstraints: const BoxConstraints.tightFor(
              width: 32,
              height: 32,
            ),
            prefixIconConstraints: const BoxConstraints.tightFor(
              width: 48,
            ),
            contentPadding: widget.contentPadding,
          ),
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          obscureText: isObSecure,
          validator: widget.validator,
        ),
      ],
    );
  }
}
