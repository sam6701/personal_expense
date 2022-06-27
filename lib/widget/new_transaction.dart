import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);
  // ignore: non_constant_identifier_names
  //State<NewTransaction> CreateState() => _NewTransactionState();

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final workcontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  late DateTime _selectedDate; //= DateTime.now();
  bool isDate = false;
  void summitData() {
    if (amountcontroller.text.isEmpty) {
      return;
    }
    final workcontrol = workcontroller.text;
    final amountcontrol = double.parse(amountcontroller.text);
    if (workcontrol.isEmpty || amountcontrol <= 0) {
      return;
    }
    widget.addtx(workcontrol, amountcontrol, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        isDate = true;
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'work'),
              controller: workcontroller,
              onSubmitted: (_) => summitData(),
              /*onChanged: (val) {
                        workinput = val;
                      },*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => summitData(),
              /*onChanged: (val) {
                        amountinput = val;
                      },*/
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(isDate == false
                      ? 'No Date Choosen'
                      : DateFormat.yMd().format(_selectedDate)),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                    textColor: Colors.orangeAccent,
                  ),
                ],
              ),
            ),
            RaisedButton(
                child: Text('Add Transiction'),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: summitData

                //print(workcontroller.text);
                //print(amountcontroller.text);
                //print(workinput);
                //print(amountinput);

                )
          ],
        ),
      ),
    );
  }
}
