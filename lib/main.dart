import 'dart:math';

import 'package:cod3r_expenses/components/chart_widget.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main(List<String> args) {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber.shade700,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.amber.shade700,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
      id: '00',
      title: 'Acadêmia',
      value: 400,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: '01',
      title: 'Lanche',
      value: 50,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      id: '011',
      title: 'Jogos',
      value: 200,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      id: '02',
      title: 'Lanche',
      value: 25,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Transaction(
      id: '03',
      title: 'Cinema',
      value: 150,
      date: DateTime.now().subtract(const Duration(days: 6)),
    ),
    Transaction(
      id: '04',
      title: 'Lanche',
      value: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: '05',
      title: 'Uber',
      value: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: '06',
      title: 'Facudade',
      value: 250,
      date: DateTime.now(),
    ),
    Transaction(
      id: '07',
      title: 'Internet',
      value: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: '08',
      title: 'Conta de agua',
      value: 250,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    final compareDate = DateTime.now().subtract(const Duration(days: 7));

    return _transactions.where((e) => e.date.isAfter(compareDate)).toList();
  }

  void _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.insert(0, newTransaction);
    });
  }

  _removeTransaction(String id) {
    _transactions.removeWhere((element) => element.id == id);
    setState(() {});
  }

  void _showTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TransactionForm(onSubmit: _addTransaction),
    );
  }

  final _appBar = AppBar(
    centerTitle: true,
    title: const Text('Despesas Pessoais'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _transactions.isEmpty
          ? const Center(
              child: Text('Nenhuma transação cadastrada'),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ChartWidget(_recentTransactions),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      TransactionList(_transactions,
                          onRemove: _removeTransaction),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
