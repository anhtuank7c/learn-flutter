import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              key: const Key('titleInput'),
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextField(
              key: const Key('amountInput'),
              controller: amountController,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
            ),
            TextButton(
              key: const Key('addTractionBtn'),
              onPressed: () => addTransaction(
                titleController.text,
                double.tryParse(amountController.text),
              ),
              child: const Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
