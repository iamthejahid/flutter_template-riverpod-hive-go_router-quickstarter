import 'package:app_ui/app_ui.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    Key? key,
    required this.hintText,
    required TextEditingController controller,
    this.isObscure = false,
    this.readOnly = false,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = Colors.transparent,
    this.fillColor = AppColors.white,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.textInputAction,
    this.maxLines = 1,
    this.hintStyle,
    this.contentPadding,
  })  : _controller = controller,
        super(key: key);

  final String hintText;
  final TextEditingController _controller;
  final bool isObscure, readOnly;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon, suffixIcon;
  final Color? fillColor;
  final Color borderColor;
  final TextInputType keyboardType;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onEditingComplete, onTap;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context, ref) {
    final hideText = useState(true);

    final border = OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(4.r)),
      borderSide: BorderSide(color: borderColor),
    );
    return TextFormField(
      controller: _controller,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      style: GoogleFonts.openSans(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: AppColors.black,
        letterSpacing: 1.2,
      ),
      obscureText: isObscure ? hideText.value : false,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        disabledBorder: border,
        isDense: true,
        filled: true,
        fillColor: fillColor,
        // contentPadding: EdgeInsets.symmetric(
        //   horizontal: 12.w,
        //   vertical: 6.h,
        // ),
        hintText: hintText,
        hintStyle: hintStyle ??
            GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.harrisonGrey600,
            ),
        prefixIcon: prefixIcon,
        // suffix: suffixIcon,
        suffixIcon: suffixIcon ??
            (isObscure
                ? KInkWell(
                    borderRadius: radius12,
                    onTap: () {
                      hideText.value = !hideText.value;
                    },
                    child: hideText.value
                        ? Container(
                            height: 4.w,
                            width: 4.w,
                            padding: EdgeInsets.all(18.w),
                            decoration: const BoxDecoration(
                                // image: DecorationImage(
                                //   image: AssetImage(
                                //     'assets/cross_eye.png',
                                //   ),
                                //   fit: BoxFit.fitWidth,
                                // ),
                                // color: Colors.amber,
                                ),
                            child: Image.asset(
                              'assets/cross_eye.png',
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : Icon(
                            Icons.remove_red_eye,
                            size: 20.sp,
                            color: Theme.of(context).primaryColorLight,
                          ),
                  )
                : null),
      ),
    );
  }
}

class KTextFormField2 extends HookConsumerWidget {
  const KTextFormField2({
    Key? key,
    this.controller,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.readOnly = false,
    this.isLabel = false,
    this.onTap,
    this.prefix,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsetsDirectional.only(
        start: 16, end: 16, top: 10, bottom: 10),
    this.fillColor = Colors.transparent,
    this.borderColor = AppColors.harrisonGrey600,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final bool readOnly, isLabel;
  final VoidCallback? onTap;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;
  final int? maxLines;
  final EdgeInsetsGeometry contentPadding;
  final Color fillColor, borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(
        color: AppColors.harrisonGrey600,
        width: 1,
      ),
    );
    return TextFormField(
      obscureText: isObscure ? hideText.value : false,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: ContentTextStyle.textStyle16w400HG1000,
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: isLabel ? null : hintText,
        hintStyle: ContentTextStyle.textStyle16w400HG1000,
        labelText: isLabel ? hintText : null,
        labelStyle: ContentTextStyle.textStyle16w400HG1000,
        contentPadding: contentPadding,
        fillColor: fillColor,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        filled: true,
        prefix: prefix,
        suffixIcon: suffixIcon ??
            (isObscure
                ? KInkWell(
                    borderRadius: radius24,
                    onTap: () {
                      hideText.value = !hideText.value;
                    },
                    child: hideText.value
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off),
                  )
                : null),
      ),
      onTap: onTap,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

class KTextFormField3 extends HookConsumerWidget {
  const KTextFormField3({
    super.key,
    this.controller,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const border = InputBorder.none;
    return TextFormField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        border: border,
        focusedBorder: const UnderlineInputBorder(
            // borderSide: BorderSide(color: AppColors.harrisonGrey600),
            ),
        enabledBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        errorBorder: border,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 0.h,
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.transparent,
      ),
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
