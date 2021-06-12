import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _submitTx;

  NewTransaction(this._submitTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void selectDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
  }

  void submitData() {
    if(amountController.text.isEmpty){
      return;
    }
    final txTitle = titleController.text;
    final txAmount = double.parse(amountController.text);

    if (txTitle.isEmpty || txAmount <= 0) {
      return;
    }
    widget._submitTx(txTitle, txAmount, selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // ios safe show numeric keyboard
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child:
                          Text(DateFormat.yMMMEd().format(selectedDate)),
                  ),
                  TextButton(
                      onPressed: () {
                        selectDatePicker();
                      },
                      child: Text('Change date'))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
