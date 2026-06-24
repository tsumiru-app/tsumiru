// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tsumiru/src/features/settings/presentation/incognito/incognito_mode.dart';

void main() {
  group('incognitoModeProvider', () {
    test('defaults to off', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      expect(container.read(incognitoModeProvider), isFalse);
    });

    test('set and toggle flip the flag', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(incognitoModeProvider.notifier).set(true);
      expect(container.read(incognitoModeProvider), isTrue);

      container.read(incognitoModeProvider.notifier).toggle();
      expect(container.read(incognitoModeProvider), isFalse);
    });

    test('keepAlive: state survives with no listeners', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(incognitoModeProvider.notifier).set(true);
      // No listeners are attached; an autoDispose provider would reset here.
      await Future<void>.delayed(Duration.zero);
      expect(container.read(incognitoModeProvider), isTrue);
    });
  });
}
