// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tsumiru/src/features/tracking/data/tracker_repository.dart';
import 'package:tsumiru/src/global_providers/global_providers.dart';

void main() {
  test('trackerRepositoryProvider builds a TrackerRepository', () {
    final fakeClient = GraphQLClient(
      link: HttpLink('http://localhost'),
      cache: GraphQLCache(),
    );
    final container = ProviderContainer(
      overrides: [
        graphQlClientProvider.overrideWithValue(fakeClient),
      ],
    );
    addTearDown(container.dispose);
    expect(container.read(trackerRepositoryProvider), isA<TrackerRepository>());
  });
}
