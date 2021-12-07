// ignore_for_file: public_member_api_docs

import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/services/bank_branch_validation_service.dart';
import 'package:brazilian_banks/src/widgets/branch_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BankBranchTextFormField extends StatelessWidget {
  final int bankCode;
  final String invalidInputsMenssage;
  final String incorrectAccountDigitMenssage;

  final TextEditingController controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;

  BankBranchTextFormField({
    required this.controller,
    required this.bankCode,
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
      inputFormatters: [BranchInputFormatter(bankCode: bankCode)],
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
      validator: validator ?? _validateBranchNumber,
    );
  }

  String? _validateBranchNumber(String? text) {
    if (text == null || text.isEmpty) {
      return invalidInputsMenssage;
    } else if (bankCode == 001 || bankCode == 237) {
      final response = BankBranchValidationService().validateBranchNumber(
        bankBranchModel: BankBranchModel(
          bankCode: bankCode,
          branchNumber: text,
        ),
      );
      return response.isValid! ? null : _invalidValueMessage(response.digit);
    }
  }

  // ignore: avoid_field_initializers_in_const_classes
  final _replaceArgRegex = RegExp('{}');

  String _invalidValueMessage(String? digit) =>
      incorrectAccountDigitMenssage.replaceFirst(_replaceArgRegex, digit ?? "");
}
