import 'package:flutter/material.dart';
import 'package:learn/widgets/new_transaction.dart';
import 'package:learn/widgets/transaction_list.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '01',
      title: 'Buy new Shoes',
      amount: 99.123,
      createdAt: DateTime.now(),
    ),
    Transaction(
      id: '02',
      title: 'Grocery',
      amount: 3.123,
      createdAt: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _userTransactions.add(
        Transaction(
          id: DateTime.now().toString(),
          title: title,
          amount: amount,
          createdAt: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          _addNewTransaction,
        ),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}
