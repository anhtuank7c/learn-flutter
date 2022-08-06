import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  const NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitForm() {
    final enterredTitle = titleController.text;
    final enterredAmount = double.tryParse(amountController.text) ?? 0;
    if (enterredTitle.isEmpty || enterredAmount <= 0) {
      return;
    }
    widget.addTransaction(
      enterredTitle,
      enterredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            key: const Key('titleInput'),
            controller: titleController,
            autofocus: true,
            onSubmitted: (_) => submitForm(),
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            key: const Key('amountInput'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitForm(),
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
          TextButton(
            key: const Key('addTractionBtn'),
            onPressed: submitForm,
            child: const Text('Add transaction'),
          )
        ],
      ),
    );
  }
}
