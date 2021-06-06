import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> _transactions = [
    Transaction(
        id: 'tx1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 'tx2', title: 'Portable SSD', amount: 106.55, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactions.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(10),
                width: 80,
                alignment: Alignment.center,
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.purple),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    DateFormat.yMMMEd().format(tx.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
