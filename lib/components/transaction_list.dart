import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          elevation: 5,
          child: Row(children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.amber.shade700,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'R\$ ${transaction.value.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.amber.shade700,
                ),
              ),
            ),
//

            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                transaction.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
//

              Text(
                DateFormat('d MMM y').format(transaction.date),
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[500],
                ),
              ),
            ])
          ]),
        );
      }).toList(),
    );
  }
}
