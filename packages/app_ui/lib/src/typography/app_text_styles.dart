import 'package:app_ui/app_ui.dart';

/// The app consists of two main text style definitions: UI and Content.
///
/// Content text style is primarily used for all content-based components,
/// e.g. news feed including articles and sections, while the UI text style
/// is used for the rest of UI components.
///
/// The default app's [TextTheme] is [AppTheme.uiTextTheme].
///
/// Use [ContentThemeOverrideBuilder] to override the default [TextTheme]
/// to [AppTheme.contentTextTheme].

/// UI Text Style Definitions
abstract class UITextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontWeight: AppFontWeight.regular,
    fontFamily: 'NotoSansDisplay',
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  /// Display 2 Text Style
  static final TextStyle display2 = _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: AppFontWeight.bold,
    height: 1.12,
    letterSpacing: -0.25,
  );

  /// Display 3 Text Style
  static final TextStyle display3 = _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: AppFontWeight.bold,
    height: 1.15,
  );

  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: AppFontWeight.bold,
    height: 1.22,
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.bold,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.semiBold,
    height: 1.28,
  );

  /// Headline 4 Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.semiBold,
    height: 1.33,
  );

  /// Headline 5 Text Style
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: AppFontWeight.regular,
    height: 1.27,
  );

  /// Headline 6 Text Style
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: AppFontWeight.semiBold,
    height: 1.33,
  );

  /// Subtitle 1 Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Subtitle 2 Text Style
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.42,
    letterSpacing: 0.25,
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Overline Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.5,
  );

  /// Label Small Text Style
  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontSize: 11,
    height: 1.45,
    letterSpacing: 0.5,
  );
}

/// Content Text Style Definitions
abstract class ContentTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontWeight: AppFontWeight.regular,
    fontFamily: 'NotoSerif',
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  /// Display 1 Text Style
  static final TextStyle display1 = _baseTextStyle.copyWith(
    fontSize: 64,
    fontWeight: AppFontWeight.bold,
    height: 1.18,
    letterSpacing: -0.5,
  );

  /// Display 2 Text Style
  static final TextStyle display2 = _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: AppFontWeight.bold,
    height: 1.12,
    letterSpacing: -0.25,
  );

  /// Display 3 Text Style
  static final TextStyle display3 = _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: AppFontWeight.bold,
    height: 1.15,
  );

  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: AppFontWeight.semiBold,
    height: 1.22,
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.medium,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.medium,
    height: 1.28,
  );

  /// Headline 4 Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.semiBold,
    height: 1.33,
  );

  /// Headline 5 Text Style
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 22,
    height: 1.27,
  );

  /// Headline 6 Text Style
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: AppFontWeight.semiBold,
    height: 1.33,
  );

  /// Subtitle 1 Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Subtitle 2 Text Style
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.42,
    letterSpacing: 0.25,
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontFamily: 'NotoSansDisplay',
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
  );

  /// Overline Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontFamily: 'NotoSansDisplay',
    fontWeight: AppFontWeight.semiBold,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.5,
  );

  /// Label Small Text Style
  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontFamily: 'NotoSansDisplay',
    fontSize: 11,
    height: 1.45,
    letterSpacing: 0.5,
  );

  static TextStyle textStyle32w600 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.harrisonGrey1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle30w700 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.harrisonGrey1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle24w700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.harrisonGrey1000,
  );

  static TextStyle textStyle18w600HG1000 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.harrisonGrey1000,
  );

  static TextStyle textStyle18w500HG1000 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.harrisonGrey1000,
  );

  static TextStyle textStyle18w500Red = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.error,
  );

  static TextStyle textStyle18w500HG800 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.harrisonGrey800,
  );

  static TextStyle textStyle16w600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static TextStyle textStyle16w600White = textStyle16w600.copyWith(
    color: AppColors.white,
  );

  static TextStyle textStyle16w600secondary = textStyle16w600.copyWith(
    color: AppColors.secondary,
  );

  static TextStyle textStyle16w600HG900 = textStyle16w600.copyWith(
    color: AppColors.harrisonGrey900,
    letterSpacing: 0,
  );

  static TextStyle textStyle16w600HG1000 = textStyle16w600.copyWith(
    color: AppColors.harrisonGrey1000,
    letterSpacing: .15,
  );

  static TextStyle textStyle16w500HG1000 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.harrisonGrey1000,
  );

  static TextStyle textStyle16w500HG900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.harrisonGrey900,
  );

  static TextStyle textStyle16w400HG1000 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.harrisonGrey1000,
  );

  static TextStyle textStyle16w400HG900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.harrisonGrey900,
  );

  static TextStyle textStyle16w400secondary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static TextStyle textStyle14w600 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle textStyle14w600secondary = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  static TextStyle textStyle14w500HG1000 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.harrisonGrey1000,
  );

  static TextStyle textStyle14w500HG900 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.harrisonGrey900,
  );

  static TextStyle textStyle14w500HG800 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.harrisonGrey800,
  );

  static TextStyle textStyle14w500Red = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.error,
  );

  static TextStyle textStyle14w500Primary = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    // color: AppColors.primary,
  );

  static TextStyle textStyle14w400 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle14w400HG900 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.harrisonGrey900,
  );

  static TextStyle textStyle14w400HG800 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.harrisonGrey800,
  );

  static TextStyle textStyle13w400HG800 = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.harrisonGrey800,
  );

  static TextStyle textStyle12w600Secondary = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  static TextStyle textStyle12w600HG1000 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.harrisonGrey1000,
  );

  static TextStyle textStyle12w500Secondary = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );

  static TextStyle textStyle12w500HG800 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.harrisonGrey800,
  );

  static TextStyle textStyle12w400HG800 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.harrisonGrey800,
  );

  static TextStyle textStyle10w600Secondary = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  static TextStyle textStyle8w600White = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
  );

  // **************** FROM  FIGMA **************** //
  // m3DisplayLarge Text Style
  static const TextStyle m3DisplayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400, // regular
    height: 1.12, // 64px
    letterSpacing: -0.25,
    fontFamily: 'Lexend',
  );
  // m3DisplayMedium Text Style
  static const TextStyle m3DisplayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400, // regular
    height: 1.16, // 52px
    fontFamily: 'Lexend',
  );
  // m3DisplaySmall Text Style
  static const TextStyle m3DisplaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400, // regular
    height: 1.22, // 44px
    fontFamily: 'Lexend',
  );
  // m3HeadlineLarge Text Style
  static const TextStyle m3HeadlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400, // regular
    height: 1.25, // 40px
    fontFamily: 'Lexend',
  );
  // m3HeadlineMedium Text Style
  static const TextStyle m3HeadlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400, // regular
    height: 1.29, // 36px
    fontFamily: 'Lexend',
  );
  // m3HeadlineSmall Text Style
  static const TextStyle m3HeadlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400, // regular
    height: 1.33, // 32px
    fontFamily: 'Lexend',
  );
  // m3TitleLarge Text Style
  static const TextStyle m3TitleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400, // regular
    height: 1.27, // 28px
    fontFamily: 'Lexend',
  );
  // m3TitleMedium Text Style
  static TextStyle m3TitleMedium = GoogleFonts.lexendMega(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 24px
    letterSpacing: 0.15,
  );
  // m3TitleSmall Text Style
  static const TextStyle m3TitleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.43, // 20px
    letterSpacing: 0.1,
    fontFamily: 'Lexend',
  );
  // m3BodyLarge Text Style
  // static const TextStyle m3BodyLarge = TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w400, // regular
  //   height: 1.5, // 24px
  //   letterSpacing: 0.5,
  //   fontFamily: 'Lexend',
  // );

  static TextStyle m3BodyLarge = GoogleFonts.lexendMega(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 24px
    letterSpacing: 0.5,
  );
  // m3BodyMedium Text Style
  static TextStyle m3BodyMedium = GoogleFonts.lexendMega(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    height: 1.43, // 20px
    letterSpacing: 0.25,
  );
  // m3BodySmall Text Style
  static const TextStyle m3BodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400, // regular
    height: 1.33, // 16px
    fontFamily: 'Lexend',
  );
  // m3LabelLargeProminent Text Style
  static const TextStyle m3LabelLargeProminent = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.43, // 20px
    letterSpacing: 0.1,
    fontFamily: 'Lexend',
  );
  // m3LabelLarge Text Style
  static TextStyle m3LabelLarge = GoogleFonts.lexendMega(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500, // medium
    height: 1.43, // 20px
    letterSpacing: 0.1,
  );
  // m3LabelMediumProminent Text Style
  static const TextStyle m3LabelMediumProminent = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.33, // 16px
    letterSpacing: 0.5,
    fontFamily: 'Lexend',
  );
  // m3LabelMedium Text Style
  static const TextStyle m3LabelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500, // medium
    height: 1.33, // 16px
    letterSpacing: 0.5,
    fontFamily: 'Lexend',
  );
  // m3LabelSmall Text Style
  static const TextStyle m3LabelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500, // medium
    height: 1.6, // 16px
    letterSpacing: 0.5,
    fontFamily: 'Lexend',
  );
  // **************** | - | **************** //
}

abstract class AppTextStyle {
  // m3DisplayLarge Text Style
  static const TextStyle m3DisplayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400, // regular
    height: 1.12, // 64px
    letterSpacing: -0.25,
    fontFamily: 'Lexend',
  );
  // m3DisplayMedium Text Style
  static const TextStyle m3DisplayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400, // regular
    height: 1.16, // 52px
    fontFamily: 'Lexend',
  );
  // m3DisplaySmall Text Style
  static const TextStyle m3DisplaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400, // regular
    height: 1.22, // 44px
    fontFamily: 'Lexend',
  );
  // m3HeadlineLarge Text Style
  static const TextStyle m3HeadlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400, // regular
    height: 1.25, // 40px
    fontFamily: 'Lexend',
  );
  // m3HeadlineMedium Text Style
  static const TextStyle m3HeadlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400, // regular
    height: 1.29, // 36px
    fontFamily: 'Lexend',
  );
  // m3HeadlineSmall Text Style
  static const TextStyle m3HeadlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400, // regular
    height: 1.33, // 32px
    fontFamily: 'Lexend',
  );
  // m3TitleLarge Text Style
  static const TextStyle m3TitleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400, // regular
    height: 1.27, // 28px
    fontFamily: 'Lexend',
  );
  // m3TitleMedium Text Style
  static const TextStyle m3TitleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 24px
    letterSpacing: 0.15,
    fontFamily: 'Lexend',
  );
  // m3TitleSmall Text Style
  static const TextStyle m3TitleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.43, // 20px
    letterSpacing: 0.1,
    fontFamily: 'Lexend',
  );
  // m3BodyLarge Text Style
  static const TextStyle m3BodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 24px
    letterSpacing: 0.5,
    fontFamily: 'Lexend',
  );
  // m3BodyMedium Text Style
  static const TextStyle m3BodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    height: 1.43, // 20px
    letterSpacing: 0.25,
    fontFamily: 'Lexend',
  );
  // m3BodySmall Text Style
  static const TextStyle m3BodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400, // regular
    height: 1.33, // 16px
    fontFamily: 'Lexend',
  );
  // m3LabelLargeProminent Text Style
  static const TextStyle m3LabelLargeProminent = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.43, // 20px
    letterSpacing: 0.1,
    fontFamily: 'Lexend',
  );
  // m3LabelLarge Text Style
  static const TextStyle m3LabelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.43, // 20px
    letterSpacing: 0.1,
    fontFamily: 'Lexend',
  );
  // m3LabelMediumProminent Text Style
  static const TextStyle m3LabelMediumProminent = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.33, // 16px
    letterSpacing: 0.5,
    fontFamily: 'Lexend',
  );
  // m3LabelMedium Text Style
  static const TextStyle m3LabelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500, // medium
    height: 1.33, // 16px
    letterSpacing: 0.5,
    fontFamily: 'Lexend',
  );
  // m3LabelSmall Text Style
  static const TextStyle m3LabelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500, // medium
    height: 1.6, // 16px
    letterSpacing: 0.5,
    fontFamily: 'Lexend',
  );
}
