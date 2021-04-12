import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/pages/banks_page.dart';

Widget buildTestableWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}

main() {
  group('Banks Page', () {
    testWidgets('BanksPage has title', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(BanksPage()));
      await tester.pumpAndSettle();
      final titleFinder = find.text('Lista de Bancos Brasileiros');
      expect(titleFinder, findsOneWidget);
    });
  });
}
