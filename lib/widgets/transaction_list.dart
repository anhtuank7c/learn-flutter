import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({
    required this.transactions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          final transaction = transactions[index];
          return Card(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.purple,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    width: 68,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 5),
                    child: Text(
                      transaction.amount.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('yyyy/MM/dd hh:mm:ss')
                            .format(transaction.createdAt),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
