// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_test/flutter_test.dart';
import 'package:tsumiru/src/features/settings/presentation/downloads/data/delete_chapters_settings_repository.dart';

void main() {
  group('DeleteChaptersSettings.fromMeta', () {
    test('defaults to all-off when the keys are absent', () {
      final s = DeleteChaptersSettings.fromMeta(const {});
      expect(s.deleteManuallyMarkedRead, isFalse);
      expect(s.deleteWhileReading, 0);
      expect(s.deleteWithBookmark, isFalse);
    });

    test('parses the server values from the webUI_ global-meta keys', () {
      final s = DeleteChaptersSettings.fromMeta(const {
        kDeleteChaptersManuallyMarkedReadKey: 'true',
        kDeleteChaptersWhileReadingKey: '2',
        kDeleteChaptersWithBookmarkKey: 'true',
      });
      expect(s.deleteManuallyMarkedRead, isTrue);
      expect(s.deleteWhileReading, 2);
      expect(s.deleteWithBookmark, isTrue);
    });

    test('treats anything but "true" as false, and bad numbers as 0', () {
      final s = DeleteChaptersSettings.fromMeta(const {
        kDeleteChaptersManuallyMarkedReadKey: 'false',
        kDeleteChaptersWhileReadingKey: 'nonsense',
        kDeleteChaptersWithBookmarkKey: '1',
      });
      expect(s.deleteManuallyMarkedRead, isFalse);
      expect(s.deleteWhileReading, 0);
      expect(s.deleteWithBookmark, isFalse, reason: '"1" is not "true"');
    });

    test('uses the exact key names the WebUI reads/writes', () {
      expect(kDeleteChaptersManuallyMarkedReadKey,
          'webUI_deleteChaptersManuallyMarkedRead');
      expect(kDeleteChaptersWhileReadingKey, 'webUI_deleteChaptersWhileReading');
      expect(
          kDeleteChaptersWithBookmarkKey, 'webUI_deleteChaptersWithBookmark');
    });
  });

  test('copyWith replaces only the named field', () {
    const base = DeleteChaptersSettings();
    final next = base.copyWith(deleteWhileReading: 5);
    expect(next.deleteWhileReading, 5);
    expect(next.deleteManuallyMarkedRead, isFalse);
    expect(next.deleteWithBookmark, isFalse);
  });
}
