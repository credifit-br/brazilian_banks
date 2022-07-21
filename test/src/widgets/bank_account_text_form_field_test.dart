import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/widgets/bank_account_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final _formKey = GlobalKey<FormState>();

Widget _bankAccountTextFormFieldTest({
  required int bankCode,
  required String branchNumber,
  bool notAllowAccountWithOnlyZeros = false,
  AccountType accountType = AccountType.checking,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: BankAccountTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              accountType: accountType,
              notAllowAccountWithOnlyZeros: notAllowAccountWithOnlyZeros,
              bankCode: bankCode,
              branchNumber: branchNumber,
              controller: TextEditingController(),
              incorrectAccountDigitMenssage: 'incorrectAccountDigitMenssage {}',
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
  testWidgets('Validate isEmpty text BankAccountTextFormField teste',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankAccountTextFormFieldTest(bankCode: 001, branchNumber: '0526-6'));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Banco do Brasil BankAccountTextFormField invalid account teste',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankAccountTextFormFieldTest(bankCode: 001, branchNumber: '0526-6'));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "013180");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("00001318-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("incorrectAccountDigitMenssage 8");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Banco do Brasil BankAccountTextFormField teste',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankAccountTextFormFieldTest(bankCode: 001, branchNumber: '0526-6'));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "013188");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("00001318-8");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();
  });

  testWidgets('Bradesco BankAccountTextFormField teste',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankAccountTextFormFieldTest(bankCode: 237, branchNumber: '1425-7'));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "02380692");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("0238.069-2");
    expect(accountTextFinder, findsOneWidget);
  });

  testWidgets('CEF BankAccountTextFormField test AccountType.checking',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _bankAccountTextFormFieldTest(bankCode: 104, branchNumber: '2004'));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "001  00000448-6");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("001  00000448-6");
    expect(accountTextFinder, findsOneWidget);
  });

  testWidgets('CEF BankAccountTextFormField test AccountType.saving',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _bankAccountTextFormFieldTest(
        bankCode: 104,
        branchNumber: '2004',
        accountType: AccountType.saving,
      ),
    );

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "013  00000448-6");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("013  00000448-6");
    expect(accountTextFinder, findsOneWidget);
  });

  testWidgets('NuBank(not supported) BankAccountTextFormField test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _bankAccountTextFormFieldTest(
        bankCode: 260,
        branchNumber: '0001',
        accountType: AccountType.saving,
      ),
    );

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "7487355-8");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("7487355-8");
    expect(accountTextFinder, findsOneWidget);
  });

  testWidgets('Not Allow Bradesco account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankAccountTextFormFieldTest(
        bankCode: 237,
        branchNumber: '0001',
        notAllowAccountWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "0000.000-0");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("0000.000-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Not Allow BB account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankAccountTextFormFieldTest(
        bankCode: 001,
        branchNumber: '0526-6',
        notAllowAccountWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "00000000-0");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("00000000-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Not Allow BB account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankAccountTextFormFieldTest(
        bankCode: 341,
        branchNumber: '0000-0',
        notAllowAccountWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "00000-0");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("00000-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets('Not Allow NuBank account with only zeros',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankAccountTextFormFieldTest(
        bankCode: 260,
        branchNumber: '0000-0',
        notAllowAccountWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "00000-0");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("00000-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });

  testWidgets(
      'Not Allow CEF account with only zeros when account type is saving',
      (WidgetTester tester) async {
    await tester.pumpWidget(_bankAccountTextFormFieldTest(
        bankCode: 104,
        accountType: AccountType.saving,
        branchNumber: '0000',
        notAllowAccountWithOnlyZeros: true));

    await tester.pumpAndSettle();
    final accountFieldFinder = find.byType(BankAccountTextFormField);
    expect(accountFieldFinder, findsOneWidget);
    await tester.tap(accountFieldFinder);
    await tester.pumpAndSettle();
    await tester.enterText(accountFieldFinder, "00000-0");
    await tester.pumpAndSettle();

    final accountTextFinder = find.text("013  00000000-0");
    expect(accountTextFinder, findsOneWidget);

    final buttonFieldFinder = find.byType(ElevatedButton);
    await tester.tap(buttonFieldFinder);
    await tester.pumpAndSettle();

    final erroText = find.text("invalidInputsMenssage");
    expect(erroText, findsOneWidget);
  });
}
