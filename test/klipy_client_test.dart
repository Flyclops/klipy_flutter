import 'package:flutter/material.dart';
import 'package:klipy_flutter/src/components/components.dart';
import 'package:klipy_flutter/klipy_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('KlipyClient >', () {
    const klipyClient = KlipyClient(apiKey: '12345');

    test('Make sure it is the right type', () {
      expect(klipyClient, isA<KlipyClient>());
    });
  });

  testWidgets('Make sure bottom sheet opens and closes', (tester) async {
    final klipyClient = KlipyClient(
      apiKey: '12345',
      client: MockKlipyHttpClient(),
    );
    late BuildContext savedContext;

    // create an app that we can show bottom sheet in
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            savedContext = context;
            return Container();
          },
        ),
      ),
    );

    // show bottom sheet
    klipyClient.showAsBottomSheet(context: savedContext);
    await tester.pump();

    // make sure it opens by finding a widget
    expect(find.byType(KlipySheet), findsOneWidget);

    // close bottom sheet
    await tester.tapAt(const Offset(20.0, 20.0));
    await tester.pumpAndSettle();

    // make sure it closes by finding no widgets
    expect(find.byType(KlipySheet), findsNothing);
  });
}
