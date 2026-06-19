# Tsumiru brand assets

Canonical source-of-truth for the Tsumiru mark. Theme: **Indigo Night**
(indigo `#7c7bff` → cyan `#33d6ff`, navy `#02061d` / `#0b0d1a`, cream stroke).

| File | Background | Use |
|---|---|---|
| `tsumiru-mark-transparent.png` | **transparent (alpha)** | Website hero & navbar logo, README, favicon, marketing — anywhere the mark overlays a surface. Looks best on dark surfaces (the outer glow blooms into a dark surround). |
| `tsumiru-icon-fullbleed.png` | navy `#02061d`, full-bleed | Android/iOS/desktop **launcher icon** source, where the OS supplies the masked tile. Wired in `pubspec.yaml` via `flutter_launcher_icons`. Do NOT bake a rounded square — the OS masks it. |

Generated with Codex `$imagegen` (gpt-image-2). The transparent version was derived
by extracting the navy backdrop from the full-bleed mark, which softens the outer glow
slightly — fine on the dark site. For a crisp-on-light variant, regenerate transparent-native.
