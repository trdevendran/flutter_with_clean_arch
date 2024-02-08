import 'dart:ui';

/// Construct a color from the lower 32 bits of an [int]
extension ColorUtils on Color {
  static Color parse(String hexCode) {
    hexCode = hexCode.toUpperCase().replaceAll('#', '');
    if (hexCode.length == 6) {
      hexCode = 'FF$hexCode';
    }
    return Color(int.parse(hexCode, radix: 16));
  }
}
