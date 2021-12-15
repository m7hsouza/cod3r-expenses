import 'dart:math';

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(id: '01', title: 'Acadêmia', value: 50, date: DateTime.now()),
    Transaction(id: '02', title: 'Faculdade', value: 259, date: DateTime.now()),
    Transaction(id: '03', title: 'Cinema', value: 100, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(
          onSubmit: _addTransaction,
        ),
      ],
    );
  }
}
