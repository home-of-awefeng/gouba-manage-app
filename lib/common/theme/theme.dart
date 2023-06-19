import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shop_app/constant/theme.dart';

part './text_theme_extension.dart';

class AppTheme {
  AppTheme._();

  //*****************************************
  // Public accessor
  //*****************************************
  static final ThemeData theme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: FONT_NAME_NOTO_SANS,
    inputDecorationTheme: const InputDecorationTheme(
      border: inputBorder,
      focusedBorder: inputFocusedBorder,
      errorBorder: inputErrorBorder,
      focusedErrorBorder: inputFocusedBorder,
    ),
    primaryColor: AppTheme.colorTBlack,
    // for iOS
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: AppTheme.colorTBlack,
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.colorTBlack),
        systemOverlayStyle: SystemUiOverlayStyle.dark),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(radius4x),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(radius4x)),
    ),
    tooltipTheme: TooltipThemeData(
      preferBelow: false,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: colorTBlack..withOpacity(0.8),
        borderRadius: const BorderRadius.all(radius2x),
      ),
      showDuration: const Duration(seconds: TOOLTIP_SHOW_DURATION_IN_SECONDS),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: colorTBlack.withOpacity(0.5)),
    // tabBarTheme: const TabBarTheme(
    //     labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)
    // )
  );

  static const Color colorTBlue = Color(0xFF307FE2);
  static const Color colorTYellow = Color(0xFFFAE18C);
  static const Color colorTDarkBlue = Color(0xFF19428A);
  static const Color colorTRed = Color(0xFFF94E4E);
  static const Color colorTGreen = Color(0xFF46A147);
  static const Color colorTBlack = Color(0xFF444444);
  static const Color colorTDarkGrey = Color(0xFF333333);
  static const Color colorTGrey = Color(0xFF999999);
  static const Color colorTLightGrey = Color(0xFFCCCCCC);
  static const Color colorTDisable = Color(0xFFE6E6E6);
  static const Color colorTSilver = Color(0xFFF2F2F2);
  static const Color colorTWhite = Color(0xFFFFFFFF);

  static const double space1x = 6.0;
  static const double space2x = 12.0;
  static const double space3x = 18.0;
  static const double space4x = 24.0;
  static const double space5x = 30.0;
  static const double space6x = 36.0;
  static const double space7x = 42.0;
  static const double space8x = 48.0;
  static const double space9x = 54.0;
  static const double space10x = 60.0;
  static const double space12x = 72.0;
  static const double space20x = 120.0;

  static const InputBorder inputBorder =
  UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.colorTLightGrey, width: borderWidth1));
  static const InputBorder inputFocusedBorder =
  UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.colorTBlack, width: borderWidth1));
  static const InputBorder inputErrorBorder =
  UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.colorTRed, width: borderWidth1));

  static const double borderWidth1 = 1.0;
  static const double borderWidth2 = 2.0;

  static const Radius radius1x = Radius.circular(4.0);
  static const Radius radius2x = Radius.circular(8.0);
  static const Radius radius3x = Radius.circular(12.0);
  static const Radius radius4x = Radius.circular(16.0);
  static const Radius radius5x = Radius.circular(20.0);
  static const Radius radius6x = Radius.circular(24.0);
  static const Radius radius7x = Radius.circular(28.0);
  static const Radius radius8x = Radius.circular(32.0);
  static const Radius radius9x = Radius.circular(36.0);

  // x and y: offset(x, y)
  // b: blurRadius
  // 20: opacity
  static const shadow_x0_y0_b2_20 = Shadow(
    color: Color.fromRGBO(0, 0, 0, 0.2),
    offset: Offset(0, 0),
    blurRadius: 2,
  );
  static const boxShadow_x0_y0_b4_10 = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(0, 0),
    blurRadius: 4,
  );
  static const boxShadow_x0_y3_b6_10 = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(0, 3.0),
    blurRadius: 6,
  );
  static const boxShadow_x0_y4_b12_10 = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(0, 4.0),
    blurRadius: 12,
  );

  ///******** Basic Html Text Style ********///
  /// Should add style supporting in future for:
  /// * hyper link (a tag)
  /// * h1
  /// * divider
  static final html_h5_style = Style(
    fontWeight: FontWeight.w700,
    fontSize: FontSize.medium,
    lineHeight: const LineHeight(22 / 14),
  );

  static final html_context_style = Style(
    fontWeight: FontWeight.w500,
    fontSize: FontSize.medium,
    lineHeight: const LineHeight(22 / 14),
  );
}
