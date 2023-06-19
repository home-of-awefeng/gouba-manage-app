part of './theme.dart';

extension TextThemeExtension on TextTheme {
  TextStyle get basicTextStyle => const TextStyle(
        color: AppTheme.colorTBlack,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontFamily: FONT_NAME_NOTO_SANS,
      );
  TextStyle get T_H1 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 48,
        letterSpacing: 48 * 0.01,
        height: 60 / 48,
      );

  TextStyle get T_H1_B => T_H1.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get T_H2 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 36,
        letterSpacing: 36 * 0.01,
        height: 42 / 36,
      );

  TextStyle get T_H2_B => T_H2.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get T_H3 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 28 * 0.01,
        height: 34 / 28,
      );

  TextStyle get T_H3_B => T_H3.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get T_H4 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 24,
        letterSpacing: 24 * 0.01,
        height: 30 / 24,
      );

  TextStyle get T_H4_B => T_H4.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get T_H5 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        letterSpacing: 18 * 0.01,
        height: 24 / 18,
      );

  TextStyle get T_H5_B => T_H5.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get T_H5_BB => T_H5.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get T_H6 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 16 * 0.01,
        height: 18 / 16,
      );

  TextStyle get T_H6_B => T_H6.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get T_H7 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 20 * 0.03,
        height: 24 / 20,
      );

  TextStyle get T_Special_10 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        letterSpacing: 10 * 0.02,
        height: 12 / 10,
      );

  TextStyle get T_Special_10M => T_Special_10.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get T_Special_10B => T_Special_10.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle get T_Special_11 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 11,
        letterSpacing: 11 * 0.01,
        height: 16 / 11,
      );

  TextStyle get T_Special_11M => T_Special_11.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get T_Special_12 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 12 * 0.02,
        height: 16 / 12,
      );

  TextStyle get T_Special_13 => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        letterSpacing: 13 * 0.05,
        height: 18 / 13,
      );

  TextStyle get T_Special_13M => T_Special_13.copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get T_RedemptionCode => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        letterSpacing: 13 * 0.3,
        height: 22 / 13,
      );

  TextStyle get T_Context => basicTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 14 * 0.02,
        height: 22 / 14,
      );

  TextStyle get T_Context_M => T_Context.copyWith(fontWeight: FontWeight.w500);

  TextStyle get T_Context_B => T_Context.copyWith(
        fontWeight: FontWeight.w700,
      );
}
