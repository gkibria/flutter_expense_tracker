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
                return SingleTransaction(transactions: _transactions, index: index,);
              },
              itemCount: _transactions.length,
            ),
    );
  }
}

class SingleTransaction extends StatelessWidget {
  const SingleTransaction({
    Key? key,
    required List<Transaction> transactions,
    required this.index
  }) : _transactions = transactions, super(key: key);

  final List<Transaction> _transactions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2)),
            padding: EdgeInsets.all(10),
            width: 80,
            alignment: Alignment.center,
            child: Text(
              '\$${_transactions[index].amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _transactions[index].title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                DateFormat.yMMMEd()
                    .format(_transactions[index].date),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
