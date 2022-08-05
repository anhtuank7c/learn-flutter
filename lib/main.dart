import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Transaction> transactions = [
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
    Transaction(
      id: '03',
      title: 'Drink',
      amount: 3.6,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.amber,
            height: 100,
            width: double.infinity,
            child: Text('Header'),
          ),
          ...transactions
              .map(
                (tx) => Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(5),
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
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            tx.amount.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                              tx.title,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat('yyyy/MM/dd hh:mm:ss')
                                  .format(tx.createdAt),
                              style: TextStyle(
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
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
