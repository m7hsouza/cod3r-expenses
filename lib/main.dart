import 'package:flutter/material.dart';

import '../components/transaction_user.dart';

void main(List<String> args) {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _appBar = AppBar(
    centerTitle: true,
    title: const Text('Despesas Pessoais'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              elevation: 5,
              child: Text('Grafico'),
            ),
            TransactionUser()
          ],
        ),
      ),
    );
  }
}
