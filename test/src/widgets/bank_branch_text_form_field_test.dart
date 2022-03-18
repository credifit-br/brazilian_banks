import 'package:brazilian_banks/src/widgets/bank_branch_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final _formKey = GlobalKey<FormState>();

Widget _bankBranchTextFormFieldTest(int bankCode,
    {bool notAllowBranchWithOnlyZeros = false}) {
  return MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: BankBranchTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              bankCode: bankCode,
              controller: TextEditingController(),
              notAllowBranchWithOnlyZeros: notAllowBranchWithOnlyZeros,
              incorrectBranchDigitMenssage: 'incorrectBranchDigitMenssage {}',
              invalidInputsMenssage: 'invalidInputsMenssage',
            ),
          ),
          ElevatedButton(
            onPressed: () => _formKey.currentState?.validate(),
            child: const Text('Test Validation'),
          )
        ],
      ),
    ),
  );
}

void main() {
  testWidgets('Validate isEmpty text BankBranchTextFormField teste',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankBranchTextFormFieldTest(001));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Banco do Brasil BankBranchTextFormField invalid account teste',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankBranchTextFormFieldTest(001));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(branchFieldFinder, "0526-0");
    await tester.pumpAndSettle();

    final branchTextFinder = find.text("0526-0");
    expect(branchTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("incorrectBranchDigitMenssage 6");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Bradesco BankBranchTextFormField invalid account teste',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankBranchTextFormFieldTest(237));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(branchFieldFinder, "014250");
    await tester.pumpAndSettle();

    final branchTextFinder = find.text("1425-0");
    expect(branchTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("incorrectBranchDigitMenssage 7");
    expect(erroText, findsOneWidget);
  });

  testWidgets('NuBank(not supported) BankAccountTextFormField test',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankBranchTextFormFieldTest(260));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(branchFieldFinder, "0001");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("0001");
    expect(accountTextFinder, findsOneWidget);
  });

  testWidgets('Not Allow NuBank account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankBranchTextFormFieldTest(260, notAllowBranchWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(branchFieldFinder, "0000");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("0000");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Not Allow BB account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankBranchTextFormFieldTest(001, notAllowBranchWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(branchFieldFinder, "0000-0");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("0000-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Not Allow Bradesco account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankBranchTextFormFieldTest(237, notAllowBranchWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(branchFieldFinder, "0000-0");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("0000-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Not Allow Itau account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankBranchTextFormFieldTest(341, notAllowBranchWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final branchFieldFinder = find.byType(BankBranchTextFormField);
    expect(branchFieldFinder, findsOneWidget);
    await tester.tap(branchFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(branchFieldFinder, "0000");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("0000");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });
}
