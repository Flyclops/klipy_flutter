import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klipy_flutter/src/providers/providers.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

void main() {
  const testQuery = 'some search query';
  const testDuration = Duration(milliseconds: 500);
  const testKeyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag;
  final testCategory = KlipyCategoryObject(
    image: 'test image',
    name: 'test name',
    path: 'test path',
    searchTerm: 'test seach term',
  );

  group('KlipyAppBarProvider >', () {
    test('Initializes as expected', () async {
      final provider = KlipyAppBarProvider(
        testQuery,
        testDuration,
        keyboardDismissBehavior: testKeyboardDismissBehavior,
      );

      expect(provider.queryText, testQuery);
      expect(provider.debounce, testDuration);
      expect(provider.keyboardDismissBehavior, testKeyboardDismissBehavior);
      expect(provider.selectedCategory, null);
    });

    test('Can set queryText', () async {
      const updatedQuery = 'updated query';
      final provider = KlipyAppBarProvider(
        testQuery,
        testDuration,
        keyboardDismissBehavior: testKeyboardDismissBehavior,
      );

      expect(provider.queryText, testQuery);

      provider.queryText = updatedQuery;

      expect(provider.queryText, updatedQuery);
    });

    test('Can set selectedCategory', () async {
      final provider = KlipyAppBarProvider(
        testQuery,
        testDuration,
        keyboardDismissBehavior: testKeyboardDismissBehavior,
      );

      expect(provider.selectedCategory, null);

      provider.selectedCategory = testCategory;

      expect(provider.selectedCategory, testCategory);
    });

    test('Resets selectedCategory when queryText cleared', () async {
      final provider = KlipyAppBarProvider(
        testQuery,
        testDuration,
        keyboardDismissBehavior: testKeyboardDismissBehavior,
      );

      expect(provider.queryText, testQuery);
      expect(provider.selectedCategory, null);

      provider.selectedCategory = testCategory;

      provider.queryText = '';

      expect(provider.queryText, '');
      expect(provider.selectedCategory, null);
    });
  });
}
