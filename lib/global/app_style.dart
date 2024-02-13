import 'dart:ui';

class AppStyle {
  static Color adjustColorBrightness(Color color, double factor) {
    // Ensure the factor is within a valid range
    factor = factor.clamp(0.0, 2.0);

    // Adjust RGB values
    int red = (color.red * factor).round().clamp(0, 255);
    int green = (color.green * factor).round().clamp(0, 255);
    int blue = (color.blue * factor).round().clamp(0, 255);

    return Color.fromARGB(color.alpha, red, green, blue);
  }
}
