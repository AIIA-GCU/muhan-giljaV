import 'package:flutter/widgets.dart';

///
/// 색상
///
const int app_background = 0xFFF8F8FA;
const int widget_background = 0xFFFFFFFF;
const int btn_background = 0xFF0063D1;
const int line_color = 0xFFDBDBDB;
const int font_color_1 = 0xFF191919;
const int font_color_2 = 0xFF767676;
const int etc_color_1 = 0xFFF1F1F5;
const int etc_color_2 = 0xFFFF3120;
const int etc_color_3 = 0xFF00438C;

///
/// 글자
///
// 테마
const String font_family = "pretendard";
// 사이즈
const List<double> font_size = [11, 12, 14, 16, 18, 30];
// 가중치
const FontWeight bold = FontWeight.w900;
const FontWeight medium = FontWeight.w600;
const FontWeight regular = FontWeight.w300;

///
/// 아이콘
/// - 사용법 : Icon(CustomIcon.~~~)
///
class CustomIcon {
  CustomIcon._();

  static const _kFontFam = 'CustomIcon';

  static const IconData hamburger_menu =
      IconData(0xe800, fontFamily: _kFontFam);
  static const IconData statistic = IconData(0xeba5, fontFamily: _kFontFam);
  static const IconData camera = IconData(0xeba6, fontFamily: _kFontFam);
  static const IconData document = IconData(0xeba7, fontFamily: _kFontFam);
  static const IconData add_1 = IconData(0xeba8, fontFamily: _kFontFam);
  static const IconData edit_1 = IconData(0xeba9, fontFamily: _kFontFam);
  static const IconData fullscreen_1 = IconData(0xebaa, fontFamily: _kFontFam);
}
