// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../utils/extensions/custom_extensions.dart';

/// A small circular play button overlaid on a library cover that jumps straight
/// into the next unread chapter. Shown only when a "continue reading" target
/// exists (see the library list). Its own [InkWell] wins the tap over the
/// cover's gesture, so opening the reader never also opens the details page.
class ContinueReadingButton extends StatelessWidget {
  const ContinueReadingButton({
    super.key,
    required this.onPressed,
    this.size = 32,
  });

  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = context.theme.colorScheme;
    return Material(
      color: scheme.primary.withValues(alpha: 0.9),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox.square(
          dimension: size,
          child: Icon(
            Icons.play_arrow_rounded,
            size: size * 0.62,
            color: scheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
