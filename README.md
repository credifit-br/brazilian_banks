# Brazilian Banks

Brazilian Banks list and account/digit validation.

## Thanks to

- [BrasilApi](https://brasilapi.com.br/) for providing great api service with updated list.
- [br-bank-validator](https://github.com/fintta/br-bank-validator) for many bank account validations

## Getting Started

```dart
import 'package:brazilian_banks/brazilian_banks.dart';
```

## Fetch Brazilian Banks

```dart
final banks = await BrasilApiBanks.getBanks();
```

## Validate Brazilian Bank Account Digit

Banks currently supported:

- Banco do Brasil (001)
- Bradesco (237)

```dart
/// response.isValid = true
/// response.digit = 6
var response = BankAccountValidation.validateAccountNumber(
    accountNumber: '210169-6',
    bankCode: 001,
);

/// response.isValid = false
/// response.digit = 6
response = BankAccountValidation.validateAccountNumber(
    accountNumber: '210169-X',
    bankCode: 001,
);

/// response.errorMessage = "banco não suportado"
response = BankAccountValidation.validateAccountNumber(
    accountNumber: '12345-6',
    bankCode: 341,
);
```
