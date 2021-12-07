import 'package:brazilian_banks/brazilian_banks.dart';
import 'package:flutter/material.dart';

class BranchAccountTextFormFields extends StatefulWidget {
  const BranchAccountTextFormFields({Key? key}) : super(key: key);

  @override
  _TextFormsPageState createState() => _TextFormsPageState();
}

class _TextFormsPageState extends State<BranchAccountTextFormFields> {
  final _formKey = GlobalKey<FormState>();

  final _branchTextController = TextEditingController();
  final _accountTextController = TextEditingController();
  final _bankTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BranchAccountTextFormFields'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(label: Text("Banco")),
                  controller: _bankTextController,
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setState(() {
                    _branchTextController.text = '';
                    _accountTextController.text = '';
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BankBranchTextFormField(
                  decoration: const InputDecoration(label: Text("Agência")),
                  bankCode: int.tryParse(_bankTextController.text) ?? 000,
                  controller: _branchTextController,
                  invalidInputsMenssage: 'Informe valores válidos',
                  incorrectAccountDigitMenssage:
                      'Digito da conta errado, não seria {}?',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BankAccountTextFormField(
                  decoration: const InputDecoration(label: Text("Conta")),
                  bankCode: int.tryParse(_bankTextController.text) ?? 000,
                  accountType: AccountType.checking,
                  controller: _accountTextController,
                  branchNumber: _branchTextController.text,
                  invalidInputsMenssage: 'Informe valores válidos',
                  incorrectAccountDigitMenssage:
                      'Digito da conta errado, não seria {}?',
                ),
              ),
              ElevatedButton(
                onPressed: () => _formKey.currentState?.validate(),
                child: const Text(
                  'Validar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
