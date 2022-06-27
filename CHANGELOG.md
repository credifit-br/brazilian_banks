# Release Changelog

## [0.5.2]

* feat: Add CI/CD

## [0.5.1]

* fix: add inputFormatters on BankBranchTextFormField and BankAccountTextFormField

## [0.5.0]

* feat: Not allow account and branch with only zeros

## [0.4.3]

* feat: Remove P and X validations for Bradesco and Banco do Brasil

## [0.4.2]

* fix: downgrade dart sdk version

## [0.4.1]

* Update: Flutter 2.10.0
* Fix: Fill in the account field with X or P only in field referring to digit

## [0.4.0]

* Add: widget for the validation of branch and account
* Add: input formatter for branch and account
* Fix: input formatter issues
* Fix: do not allow typing letters when the banks are Itaú or CEF
* Fix: regular expression to disallow anything that doesn't have a letter or number

## [0.4.0-dev-0.0.3] - 2021-12-13

* Fix: input formatter issues

## [0.4.0-dev-0.0.2] - 2021-12-13

* Fix: do not allow typing letters when the banks are Itaú or CEF
* Fix: regular expression to disallow anything that doesn't have a letter or number

## [0.4.0-dev-0.0.1] - 2021-12-10

* Fix: input formatter issues

## [0.4.0-dev] - 2021-12-08

* Add: widget for the validation of branch and account
* Add: input formatter for branch and account

## [0.3.3] - 2021-05-13

* Fix: return of CEF account without account type prefix

## [0.3.3-dev] - 2021-05-13

* Fix: return of CEF account without account type prefix

## [0.3.2] - 2021-05-13

* Fix: rename savings for saving due to compatibility

## [0.3.1] - 2021-05-13

* Fix: export bank_account_model

## [0.3.0] - 2021-05-13

* Support CEF (Caixa Econômica Federal) account
* Refactor bank account model

## [0.2.1] - 2021-04-14

* Fix errorMessage initialization
* Fix Itau account return

## [0.2.0] - 2021-04-13

* Support Bradesco and Itau accounts

## [0.1.1] - 2021-04-12

* Fix documentation

## [0.1.0] - 2021-04-12

* Add null-safety support
* Add digit validation for "Banco do Brasil"
* Improve README file

## [0.0.1] - 2021-04-12

* Work in progress.
