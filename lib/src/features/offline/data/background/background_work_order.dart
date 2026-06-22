// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'background_token_record.dart';

class BackgroundWorkOrder {
  const BackgroundWorkOrder({
    required this.chapterIds,
    required this.mangaIdByChapter,
    required this.serverBase,
    required this.port,
    required this.addPort,
    required this.wifiOnly,
    required this.auth,
    required this.rootIsolateToken,
  });

  final List<int> chapterIds;
  final Map<int, int> mangaIdByChapter;
  final String serverBase;
  final int? port;
  final bool addPort;
  final bool wifiOnly;
  final BackgroundTokenRecord auth;
  final int rootIsolateToken;

  Map<String, Object?> toJson() => {
        'chapterIds': chapterIds,
        'mangaIdByChapter':
            mangaIdByChapter.map((k, v) => MapEntry(k.toString(), v)),
        'serverBase': serverBase,
        'port': port,
        'addPort': addPort,
        'wifiOnly': wifiOnly,
        'auth': auth.toJson(),
        'rootIsolateToken': rootIsolateToken,
      };

  factory BackgroundWorkOrder.fromJson(Map<String, Object?> j) =>
      BackgroundWorkOrder(
        chapterIds: (j['chapterIds'] as List).cast<int>(),
        mangaIdByChapter: (j['mangaIdByChapter'] as Map)
            .map((k, v) => MapEntry(int.parse(k as String), v as int)),
        serverBase: j['serverBase'] as String,
        port: j['port'] as int?,
        addPort: j['addPort'] as bool,
        wifiOnly: j['wifiOnly'] as bool,
        auth: BackgroundTokenRecord.fromJson(
            j['auth'] as Map<String, Object?>),
        rootIsolateToken: j['rootIsolateToken'] as int,
      );
}
