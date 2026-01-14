import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:klipy_flutter/src/components/components.dart';
import 'package:klipy_flutter/klipy_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Category Widget >', () {
    testWidgets('If category is null, find nothing', (tester) async {
      await tester.pumpWidget(const KlipyCategoryWidget());

      expect(find.byType(GestureDetector), findsNothing);
    });

    testWidgets('Keep hashtag', (tester) async {
      final klipyCategoryTest = KlipyCategoryObject(
        name: '#test',
        searchTerm: 'test search term',
        path: 'path/to/category',
        image: 'https://flyclops.com/images/logo.png',
      );

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: KlipyCategoryWidget(
            category: klipyCategoryTest,
            style: const KlipyCategoryStyle(stripHashtag: false),
          ),
        ),
      );

      expect(find.text('test'), findsNothing);
      expect(find.text('#test'), findsOneWidget);
    });

    testWidgets('Strip hashtag', (tester) async {
      final klipyCategoryTest = KlipyCategoryObject(
        name: '#test',
        searchTerm: 'test search term',
        path: 'path/to/category',
        image: 'https://flyclops.com/images/logo.png',
      );

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: KlipyCategoryWidget(
            category: klipyCategoryTest,
            style: const KlipyCategoryStyle(stripHashtag: true),
          ),
        ),
      );

      expect(find.text('test'), findsOneWidget);
      expect(find.text('#test'), findsNothing);
    });

    testWidgets('Make sure it renders and is tappable', (tester) async {
      // track if the tap was tapped
      bool hasTapped = false;

      // category to populate with
      final klipyCategoryTest = KlipyCategoryObject(
        name: 'test',
        searchTerm: 'test search term',
        path: 'path/to/category',
        image: 'https://flyclops.com/images/logo.png',
      );

      // display the category widget
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: KlipyCategoryWidget(
            category: klipyCategoryTest,
            onTap: (klipyCategory) {
              expect(klipyCategory, klipyCategoryTest);
              hasTapped = true;
            },
          ),
        ),
      );

      // it should not have been tapped at this point
      expect(hasTapped, false);

      // tap it
      await tester.tap(find.byType(GestureDetector));

      // make sure the tap went through
      expect(hasTapped, true);
    });
  });
}
