import 'package:flutter/material.dart';

/// App-level curated themes. Replaces direct use of the third-party
/// `FlexScheme` enum. Dark hexes mirror ~/Projects/theme-kit/themes/*.css.
enum AppTheme {
  indigoNight,
  carbon,
  plum,
  custom;

  /// (accent, accent2) used for the picker swatch preview.
  (Color, Color) get swatch => switch (this) {
        AppTheme.indigoNight =>
          (const Color(0xFF7C7BFF), const Color(0xFF33D6FF)),
        AppTheme.carbon => (const Color(0xFF19E6B0), const Color(0xFF22D3EE)),
        AppTheme.plum => (const Color(0xFFFF5DB1), const Color(0xFFFF9F5C)),
        AppTheme.custom =>
          (const Color(0xFF7C7BFF), const Color(0xFF33D6FF)),
      };
}
