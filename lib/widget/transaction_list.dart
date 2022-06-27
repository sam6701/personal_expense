import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/rendering/box.dart';

class transation_list extends StatelessWidget {
  final List<Transaction> transactionsm;
  final Function deleteTx;
  transation_list(this.transactionsm, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        /*children: transactionsm.map((tx) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
                '₹' + tx.amount.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(tx.work,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red)),
                Text(
                  DateFormat().format(tx.date),
                  style: TextStyle(color: Colors.orange),
                )
              ],
            ),
            /*Container(
              
              child: Text('sum'),
              
            )*/
            /*floatingActionButton:FloatingActionButton( 
                child:Icon(Icons.delete),
                color: Colors.red,
                onPressed: () =>deleteTx(tx.id), 
              ),*/
          ],
        ));
      }).toList(),*/
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orangeAccent,
                  child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text(
                        '₹' + '${transactionsm[index].amount}',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                title: Text(transactionsm[index].work,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red)),
                subtitle:
                    Text(DateFormat.yMMMMd().format(transactionsm[index].date)),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => deleteTx(transactionsm[index].id)),
              ),
            );
          },
          itemCount: transactionsm.length,
        ));
  }
}
