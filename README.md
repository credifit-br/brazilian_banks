# Brazilian Banks

Brazilian Banks list and account/digit validation. We thank [BrasilApi](https://brasilapi.com.br/) for providing great api service with updated list.

## Fetch Brazilian Banks

```dart
final banks = await BrasilApiBanksModel.getBanks();
```

## Validate Brazilian Bank Account Digit

Banks currently supported:

- Banco do Brasil (001)

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
```
