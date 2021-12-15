import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  final void Function(String title, double value) onSubmit;

  TransactionForm({required this.onSubmit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Titulo',
                floatingLabelStyle: TextStyle(color: Colors.amber[700]),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber.shade700),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: r'Valor (R$)',
                floatingLabelStyle: TextStyle(color: Colors.amber[700]),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber.shade700),
                ),
              ),
            ),
            //
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  'NOVA TRANSAÇÃO',
                  style: TextStyle(color: Colors.amber[700]),
                ),
                onPressed: () {
                  final title = _titleController.text;
                  final value = double.tryParse(_valueController.text) ?? 0;

                  onSubmit(title, value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
