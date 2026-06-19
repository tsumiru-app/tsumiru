import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';

/// Minimal color tokens for a named theme at one brightness.
/// Dark values mirror theme-kit; light values are hand-designed companions.
class ThemeTokens {
  const ThemeTokens({
    required this.bg,
    required this.ink,
    required this.muted,
    required this.faint,
    required this.accent,
    required this.accent2,
    required this.danger,
  });

  final Color bg; // scaffold / surface
  final Color ink; // onSurface text
  final Color muted; // onSurfaceVariant
  final Color faint; // outline
  final Color accent; // primary
  final Color accent2; // secondary / tertiary
  final Color danger; // error
}

// --- Dark token sets: mirror ~/Projects/theme-kit/themes/<id>.css ---
const _indigoDark = ThemeTokens(
  bg: Color(0xFF0B0D1A),
  ink: Color(0xFFEEF0FB),
  muted: Color(0xFF9AA0C4),
  faint: Color(0xFF6B7099),
  accent: Color(0xFF7C7BFF),
  accent2: Color(0xFF33D6FF),
  danger: Color(0xFFFF6B6B),
);
const _carbonDark = ThemeTokens(
  bg: Color(0xFF08100E),
  ink: Color(0xFFEAFCF6),
  muted: Color(0xFF8FB6AC),
  faint: Color(0xFF5D7E76),
  accent: Color(0xFF19E6B0),
  accent2: Color(0xFF22D3EE),
  danger: Color(0xFFFF6F6F),
);
const _plumDark = ThemeTokens(
  bg: Color(0xFF120A16),
  ink: Color(0xFFFBEEFB),
  muted: Color(0xFFCAA0C9),
  faint: Color(0xFF946B93),
  accent: Color(0xFFFF5DB1),
  accent2: Color(0xFFFF9F5C),
  danger: Color(0xFFFF7A6B),
);

// --- Light token sets: hand-designed companions (deeper accents for contrast
//     on light surfaces). Subject to visual-preview tuning. ---
const _indigoLight = ThemeTokens(
  bg: Color(0xFFFBFBFF),
  ink: Color(0xFF11142A),
  muted: Color(0xFF5B6080),
  faint: Color(0xFF9AA0C4),
  accent: Color(0xFF6361F0),
  accent2: Color(0xFF1693C2),
  danger: Color(0xFFD92D2D),
);
const _carbonLight = ThemeTokens(
  bg: Color(0xFFF6FFFB),
  ink: Color(0xFF0C1714),
  muted: Color(0xFF4E6B63),
  faint: Color(0xFF8FB6AC),
  accent: Color(0xFF0FA17C),
  accent2: Color(0xFF1496AD),
  danger: Color(0xFFD92D2D),
);
const _plumLight = ThemeTokens(
  bg: Color(0xFFFFF8FD),
  ink: Color(0xFF1B0F22),
  muted: Color(0xFF7A5479),
  faint: Color(0xFFCAA0C9),
  accent: Color(0xFFD6398B),
  accent2: Color(0xFFD9701F),
  danger: Color(0xFFD92D2D),
);

ThemeTokens tokensFor(AppTheme theme, Brightness brightness) {
  assert(theme != AppTheme.custom, 'custom theme has no fixed tokens');
  final isDark = brightness == Brightness.dark;
  return switch (theme) {
    AppTheme.indigoNight => isDark ? _indigoDark : _indigoLight,
    AppTheme.carbon => isDark ? _carbonDark : _carbonLight,
    AppTheme.plum => isDark ? _plumDark : _plumLight,
    AppTheme.custom => throw StateError('unreachable'),
  };
}
