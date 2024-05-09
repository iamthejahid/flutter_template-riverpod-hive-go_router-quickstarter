import 'package:app_ui/app_ui.dart';

// ignore: non_constant_identifier_names
BoxDecoration CUSTOM_CARD_DECORATION = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(6.w),
    boxShadow: [
      BoxShadow(
        color: Color(0x26000000),
        blurRadius: 3,
        offset: Offset(0, 1),
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Color(0x4C000000),
        blurRadius: 2,
        offset: Offset(0, 1),
        spreadRadius: 0,
      )
    ]);

EdgeInsetsGeometry CUSTOM_CARD_PADDING = EdgeInsets.symmetric(
  horizontal: 12.w,
  vertical: 12.w,
);

EdgeInsetsGeometry CUSTOM_CARD_MARGIN = EdgeInsets.symmetric(
  horizontal: 12.w,
);
