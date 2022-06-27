import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widget/transaction_list.dart';
import './widget/new_transaction.dart';
import './widget/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  final List<Transaction> Transactions = [];
  // late String workinput;
  // late String amountinput;
  final workcontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final List<Transaction> _usertransaction = [
    // Transaction(id: 't1', work: 'shoes', amount: 150, date: DateTime.now()),
    // Transaction(id: 't2', work: 'toy', amount: 200, date: DateTime.now()),
  ];
  List<Transaction> get recentTransaction {
    return _usertransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(String txwork, double txamount, DateTime selectDate) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        work: txwork,
        amount: txamount,
        date: selectDate);

    setState(() {
      _usertransaction.add(newtx);
    });
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          // onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deletetransaction(String id) {
    setState(() {
      _usertransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 192, 115),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Personal App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyChart(recentTransaction),
              transation_list(_usertransaction, _deletetransaction),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add),
          onPressed: () => _startAddTransaction(context)),
    );
  }
}
