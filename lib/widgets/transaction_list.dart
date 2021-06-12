import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(children: [
              Text(
                'No Transaction yet!',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ))
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return SingleTransaction(transactions: _transactions, index: index);
              },
              itemCount: _transactions.length,
            ),
    );
  }
}

class SingleTransaction extends StatelessWidget {
  const SingleTransaction(
      {Key? key, required List<Transaction> transactions, required this.index})
      : _transactions = transactions,
        super(key: key);

  final List<Transaction> _transactions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 32,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
                child: Text(
              '\$${_transactions[index].amount.toStringAsFixed(2)}',
            )),
          ),
        ),
        title: Text(
          _transactions[index].title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).primaryColor),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(_transactions[index].date)
        ),
      ),
    );
  }
}
