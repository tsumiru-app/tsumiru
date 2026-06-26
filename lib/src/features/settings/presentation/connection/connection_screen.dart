// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/endpoints.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/section_title.dart';
import '../server/widget/authentication/authentication_section.dart';
import '../server/widget/client/server_port_tile/server_port_tile.dart';
import '../server/widget/client/server_url_tile/server_url_tile.dart';

class ConnectionScreen extends ConsumerWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.connection),
      ),
      body: ListTileTheme(
        data: const ListTileThemeData(
          subtitleTextStyle: TextStyle(color: Colors.grey),
        ),
        child: ListView(
          children: [
            SectionTitle(title: context.l10n.serverAddress),
            const ServerUrlTile(),
            const ServerPortTile(),
            const AuthenticationSection(),
            if (!kIsWeb)
              ListTile(
                leading: const Icon(Icons.web_rounded),
                title: Text(context.l10n.webUI),
                onTap: () {
                  final url = Endpoints.baseApi(
                    baseUrl: ref.read(serverUrlProvider),
                    port: ref.read(serverPortProvider),
                    addPort: ref.read(serverPortToggleProvider).ifNull(),
                    appendApiToUrl: false,
                  );
                  if (url.isNotBlank) {
                    launchUrlInWeb(context, url, ref.read(toastProvider));
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
