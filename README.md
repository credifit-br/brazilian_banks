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
var response = BankAccountValidation.validateAccountNumber(
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

## Contribute

As you've seen, there are many more banks to be implemented.  
Feel free to fork the project and throw us Pull Requests (just don't forget the unit test ;-))

## Thanks to

- [BrasilApi](https://brasilapi.com.br/) for providing great api service with updated list.
- [br-bank-validator](https://github.com/fintta/br-bank-validator) for many bank account validations
