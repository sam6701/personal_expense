import 'chart_bars.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bars.dart';

class MyChart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  MyChart(this.recentTransaction);
  List<Map<String, dynamic>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = /*selectdate.subtract(*/ DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      //print(DateFormat.E().format(weekDay));
      //print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get maxspending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      double sum1 = (item['amount']) as double;
      return sum + sum1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groupTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupTransactionValues.map((data) {
          return ChartBar(
              (data['day']).toString(),
              (data['amount']) as double,
              maxspending == 0.0
                  ? 0.0
                  : ((data['amount']) as double) /
                      maxspending); //Text('${data['day']}:${data['amount']}');
        }).toList(),
      ),
    );
  }
}
