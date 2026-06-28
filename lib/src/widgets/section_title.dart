import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../utils/extensions/custom_extensions.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) => Padding(
        padding: KEdgeInsets.h16.size + KEdgeInsets.v4.size,
        child: Text(
          title,
          // Use the brand accent from the colorScheme — ThemeData.primaryColor
          // is a near-black default on the dark theme (it's never set), which
          // left section titles invisible.
          style: context.textTheme.titleSmall
              ?.copyWith(color: context.theme.colorScheme.primary),
        ),
      );
}
