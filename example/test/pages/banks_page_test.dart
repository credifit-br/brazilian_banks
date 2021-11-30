import 'package:example/pages/banks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildTestableWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}

main() {
  group('Banks Page', () {
    testWidgets('BanksPage has title', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const BanksPage()));
      await tester.pumpAndSettle();
      final titleFinder = find.text('Lista de Bancos Brasileiros');
      expect(titleFinder, findsOneWidget);
    });
  });
}
