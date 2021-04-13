# Brazilian Banks

Brazilian Banks list and account/digit validation.

## Thanks to

- [BrasilApi](https://brasilapi.com.br/) for providing great api service with updated list.
- [br-bank-validator](https://github.com/fintta/br-bank-validator) for many bank account validations

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
- Itau (341)

Example:

```dart
var response = BankAccountValidation.validateAccountNumber(
    branchNumber: '2545'
    accountNumberWithDigit: '02366-1',
    bankCode: 341,
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
