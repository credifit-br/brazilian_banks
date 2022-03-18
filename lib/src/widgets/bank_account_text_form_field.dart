import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/services/bank_account_validation_service.dart';
import 'package:brazilian_banks/src/utils/account_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// widget to help account validation
class BankAccountTextFormField extends StatelessWidget {
  /// @var [bankCode] required for validation of some banks
  final int bankCode;

  /// @var [branchNumber] required for validation of some banks
  final String branchNumber;

  /// @var [accountType] required for validation of some banks
  final AccountType accountType;

  /// @var [invalidInputsMenssage] custom error message when account
  /// number is null or empty
  final String invalidInputsMenssage;

  /// @var [incorrectAccountDigitMenssage] custom error message when account
  /// number is not valid
  final String incorrectAccountDigitMenssage;

  /// TextFormField parameter
  final TextEditingController controller;

  /// TextFormField parameter
  final String? initialValue;

  /// TextFormField parameter
  final FocusNode? focusNode;

  /// TextFormField parameter
  final InputDecoration? decoration;

  /// TextFormField parameter
  final TextInputType? keyboardType;

  /// TextFormField parameter
  final TextCapitalization textCapitalization;

  /// TextFormField parameter
  final TextInputAction? textInputAction;

  /// TextFormField parameter
  final TextStyle? style;

  /// TextFormField parameter
  final StrutStyle? strutStyle;

  /// TextFormField parameter
  final TextDirection? textDirection;

  /// TextFormField parameter
  final TextAlign textAlign;

  /// TextFormField parameter
  final TextAlignVertical? textAlignVertical;

  /// TextFormField parameter
  final bool autofocus;

  /// TextFormField parameter
  final bool readOnly;

  /// TextFormField parameter
  final ToolbarOptions? toolbarOptions;

  /// TextFormField parameter
  final bool? showCursor;

  /// TextFormField parameter
  final String obscuringCharacter;

  /// TextFormField parameter
  final bool obscureText;

  /// TextFormField parameter
  final bool autocorrect;

  /// TextFormField parameter
  final SmartDashesType? smartDashesType;

  /// TextFormField parameter
  final SmartQuotesType? smartQuotesType;

  /// TextFormField parameter
  final bool enableSuggestions;

  /// TextFormField parameter
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// TextFormField parameter
  final int? maxLines;

  /// TextFormField parameter
  final int? minLines;

  /// TextFormField parameter
  final bool expands;

  /// TextFormField parameter
  final int? maxLength;

  /// TextFormField parameter
  final ValueChanged<String>? onChanged;

  /// TextFormField parameter
  final GestureTapCallback? onTap;

  /// TextFormField parameter
  final VoidCallback? onEditingComplete;

  /// TextFormField parameter
  final ValueChanged<String>? onFieldSubmitted;

  /// TextFormField parameter
  final FormFieldSetter<String>? onSaved;

  /// TextFormField parameter
  final FormFieldValidator<String>? validator;

  /// TextFormField parameter
  final bool? enabled;

  /// TextFormField parameter
  final double cursorWidth;

  /// TextFormField parameter
  final double? cursorHeight;

  /// TextFormField parameter
  final Radius? cursorRadius;

  /// TextFormField parameter
  final Color? cursorColor;

  /// TextFormField parameter
  final Brightness? keyboardAppearance;

  /// TextFormField parameter
  final EdgeInsets scrollPadding;

  /// TextFormField parameter
  final bool enableInteractiveSelection;

  /// TextFormField parameter
  final TextSelectionControls? selectionControls;

  /// TextFormField parameter
  final InputCounterWidgetBuilder? buildCounter;

  /// TextFormField parameter
  final ScrollPhysics? scrollPhysics;

  /// TextFormField parameter
  final Iterable<String>? autofillHints;

  /// TextFormField parameter
  final AutovalidateMode? autovalidateMode;

  /// TextFormField parameter
  final ScrollController? scrollController;

  /// TextFormField parameter
  final String? restorationId;

  /// TextFormField parameter
  final bool enableIMEPersonalizedLearning;

  /// TextFormField parameter
  final bool notAllowAccountWithOnlyZeros;

  /// @construct [BankAccountTextFormField]
  BankAccountTextFormField({
    required this.controller,
    required this.bankCode,
    required this.accountType,
    required this.branchNumber,
    required this.incorrectAccountDigitMenssage,
    required this.invalidInputsMenssage,
    Key? key,
    this.focusNode,
    this.enableIMEPersonalizedLearning = true,
    this.decoration = const InputDecoration(),
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.expands = false,
    this.cursorWidth = 2.0,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.characters,
    this.keyboardType = TextInputType.visiblePassword,
    this.initialValue,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlignVertical,
    this.toolbarOptions,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.enabled,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.notAllowAccountWithOnlyZeros = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      autocorrect: autocorrect,
      autofillHints: autofillHints,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      buildCounter: buildCounter,
      controller: controller,
      cursorColor: cursorColor,
      cursorRadius: cursorRadius,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      decoration: decoration,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      enableInteractiveSelection: enableInteractiveSelection,
      enableSuggestions: enableSuggestions,
      enabled: enabled,
      expands: expands,
      focusNode: focusNode,
      initialValue: initialValue,
      inputFormatters: [
        AccountInputFormatter(bankCode: bankCode, accountType: accountType)
      ],
      keyboardAppearance: keyboardAppearance,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly,
      restorationId: restorationId,
      scrollController: scrollController,
      scrollPadding: scrollPadding,
      scrollPhysics: scrollPhysics,
      selectionControls: selectionControls,
      showCursor: showCursor,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      strutStyle: strutStyle,
      style: style,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      textInputAction: textInputAction,
      toolbarOptions: toolbarOptions,
      validator: validator ?? _validateAccountNumber,
    );
  }

  String? _validateAccountNumber(String? text) {
    if (text == null || text.isEmpty) {
      return invalidInputsMenssage;
    }
    if (notAllowAccountWithOnlyZeros && _notAllowAccountWithOnlyZeros(text)) {
      return invalidInputsMenssage;
    }
    final response = BankAccountValidationService().validateAccountNumber(
      bankAccountModel: BankAccountModel(
        accountNumberWithDigit: text,
        accountType: accountType,
        bankCode: bankCode,
        branchNumber: branchNumber,
      ),
    );

    if (response.isValid != null) {
      return response.isValid! ? null : _invalidValueMessage(response.digit);
    }
    return null;
  }

  // ignore: avoid_field_initializers_in_const_classes
  final _replaceArgRegex = RegExp('{}');

  String _invalidValueMessage(String? digit) =>
      incorrectAccountDigitMenssage.replaceFirst(_replaceArgRegex, digit ?? "");

  bool _notAllowAccountWithOnlyZeros(String text) {
    var value =
        text.replaceAll("-", "").replaceAll(".", "").replaceAll("0", "");

    return value.isEmpty;
  }
}
