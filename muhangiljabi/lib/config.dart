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
  static const String? _kFontPkg = null;

  static const IconData statistic =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData hamburger_menu =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData add =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData camera =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData fullscreen =
      IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData edit =
      IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chevron_down =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData check =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData document =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chevron_up =
      IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}