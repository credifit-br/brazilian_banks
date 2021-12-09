# Brazilian Banks

Brazilian Banks list and account/digit validation.

## Getting Started

```dart
import 'package:brazilian_banks/brazilian_banks.dart';
```

### Fetch Brazilian Banks

```dart
final banks = await BrasilApiBanks.getBanks();
```

### Validate Brazilian Bank Account Digit

Banks currently supported:

- Banco do Brasil (001)
- Bradesco (237)
- CEF - Caixa Econômica Federal (104)
- Itau (341)

Example:

```dart
var response = BankAccountValidationService().validateAccountNumber(
    bankAccountModel: BankAccountModel(
        bankCode: 341,
        branchNumber: '2545',
        accountNumberWithDigit: '02366-1',
        accountType: AccountType.checking),
);

if (response.errorMessage == null) {
    if (response.isValid) {
        print('account digit is correct');
    } else {
        print('the correct account digit probably is ${response.digit}');
    }
} else {
    print(response.errorMessage);
}
```

### Validate Brazilian Bank Branch Digit

Banks currently supported:

- Banco do Brasil (001)
- Bradesco (237)

```dart
final response = BankBranchValidationService().validateBranchNumber(
        bankBranchModel: BankBranchModel(
          bankCode: bankCode,
          branchNumber: text,
        ),
      ); 
```

### Use formatters for accounts and branchs

Banks currently supported:

- Banco do Brasil (001)
- Bradesco (237)
- CEF - Caixa Econômica Federal (104)
- Itau (341)

```dart

 inputFormatters: [
        AccountInputFormatter(bankCode: bankCode, accountType: accountType)
      ],

inputFormatters: [BranchInputFormatter(bankCode: bankCode)],

```

### Or use widgets that already have validations and formatters

```dart
BankBranchTextFormField(
                  decoration: const InputDecoration(label: Text("Agência")),
                  bankCode: int.tryParse(_bankTextController.text) ?? 000,
                  controller: _branchTextController,
                  invalidInputsMenssage: 'Informe valores válidos',
                  incorrectBranchDigitMenssage:
                      'Dígito da agência errado, não seria {}?',
                ),
                
BankAccountTextFormField(
                  decoration: const InputDecoration(label: Text("Conta")),
                  bankCode: int.tryParse(_bankTextController.text) ?? 000,
                  accountType: AccountType.checking,
                  controller: _accountTextController,
                  branchNumber: _branchTextController.text,
                  invalidInputsMenssage: 'Informe valores válidos',
                  incorrectAccountDigitMenssage:
                      'Dígito da conta errado, não seria {}?',
                ),
```

## Contribute

As you've seen, there are many more banks to be implemented.  
Feel free to fork the project and throw us Pull Requests (just don't forget the unit test ;-))

## Thanks to

- [BrasilApi](https://brasilapi.com.br/) for providing great api service with updated list.
- [br-bank-validator](https://github.com/fintta/br-bank-validator) for many bank account validations
