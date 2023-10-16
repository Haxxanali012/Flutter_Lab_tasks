import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/expense.dart';
import '../models/income.dart';
import '../utils/utils.dart';
import 'dart:math' as math;
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

// Expense Chart Works

class _ChartScreenState extends State<ChartScreen> {
  // late List<Chart> _expense = [];
  List<Color> colorList = [
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.brown,
    Colors.black,
    Colors.greenAccent,
    Colors.green,
    Colors.yellow,
    Colors.deepOrangeAccent,
    Colors.lime,
    Colors.red,
    Colors.grey,
    Colors.pinkAccent,
    Colors.pink,
    // Colors.transparent,
    Colors.indigo,
    Colors.amber,
    Colors.redAccent,
    Colors.purpleAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.tealAccent,
    Colors.greenAccent,
    Colors.lightGreenAccent,
    Colors.limeAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Charts"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Income",
                style: Utils.ts1(context),
              ),
            ),
            FutureBuilder(
                future: getIncomeList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: [
                        Container(
                          child: SfCircularChart(
                            series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<Income, String>(
                                  // dataSource: expenseChartData,
                                  dataSource: snapshot.data,
                                  pointColorMapper: (Income data, _) =>
                                      data.color,
                                  xValueMapper: (Income data, _) =>
                                      data.username,
                                  yValueMapper: (Income data, _) =>
                                      data.amount),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 2,
                                  color: snapshot.data[0].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[0].username),
                                // Text(snapshot.data["userName"]),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 2,
                                  color: snapshot.data[1].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[1].username),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 2,
                                  color: snapshot.data[2].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[2].username),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 2,
                                  color: snapshot.data[3].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[3].username),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("Some Error going on.");
                  }
                  return CircularProgressIndicator();
                }),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Expense",
                style: Utils.ts1(context),
              ),
            ),
            FutureBuilder(
                future: getExpenseList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // if(snapshot.data.length){}
                    return Row(
                          children: [
                            Container(
                              child: SfCircularChart(
                                series: <CircularSeries>[
                                  // TODO: Exception caught when users less than 4. chrt not working < 4
                                  // Render pie chart
                                  PieSeries<Expense, String>(
                                      // dataSource: expenseChartData,
                                      dataSource: snapshot.data,
                                      pointColorMapper: (Expense data, _) =>
                                          data.color,
                                      xValueMapper: (Expense data, _) =>
                                          data.username,
                                      yValueMapper: (Expense data, _) =>
                                          data.amount),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 2,
                                      color: snapshot.data[0].color ??
                                          Colors.transparent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(snapshot.data[0].username ?? " "),
                                    // Text(snapshot.data["userName"]),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 2,
                                      color: snapshot.data[1].color ??
                                          Colors.transparent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(snapshot.data[1].username ?? " "),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 2,
                                      color: snapshot.data[2].color ??
                                          Colors.transparent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(snapshot.data[2].username ?? " "),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 2,
                                      color: snapshot.data[3].color ??
                                          Colors.transparent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(snapshot.data[3].username ?? " "),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ],
                        ) ??
                        Text("Not Enough dt");
                  }
                  if (snapshot.hasError) {
                    return Text("Some Error going on.");
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }

  Future getExpenseList() async {
    late List<Expense> _expense = [];
    late List<Expense> _expenseChrt = [];
    Set<String> users = Set();
    CollectionReference fireStore =
        FirebaseFirestore.instance.collection("budgetTree");
    await fireStore.get().then(
      (res) {
        res.docChanges.forEach(
          (change) {
            if (int.parse(change.doc['amount']) < 0) {
              _expense.add(
                Expense(
                  change.doc["userName"],
                  double.parse(change.doc["amount"]),
                  Colors.pink,
                ),
              );
              users.add(change.doc["userName"]);
            }
          },
        );
      },
      onError: (e) => print("Error completing: $e"),
    );

    users.forEach((element) {
      _expenseChrt.add(Expense(
        element,
        0,
        colorList.elementAt(
          (math.Random().nextInt(colorList.length)),
        ),
      ));
    });

    for (var exp in _expense) {
      for (var expCh in _expenseChrt) {
        if (exp.username == expCh.username) {
          expCh.amount += exp.amount;
        }
      }
    }

    _expenseChrt.sortReversed((a, b) => b.amount.compareTo(a.amount));

    _expense = [];
    if (_expenseChrt.length > 3) {
      for (var i = 0; i < _expenseChrt.length; i++) {
        if (i > 3) {
          _expenseChrt.elementAt(3).amount += _expenseChrt.elementAt(i).amount;
          _expenseChrt.elementAt(3).username = 'Others';
          if (i == (_expenseChrt.length - 1))
            _expense.insert(3, _expenseChrt.elementAt(3));
        } else {
          _expense.add(_expenseChrt.elementAt(i));
        }
      }
    }
    _expenseChrt = [];
    return _expense;
  }

  Future getIncomeList() async {
    late List<Income> _income = [];
    late List<Income> _incomeChrt = [];
    Set<String> users = Set();
    CollectionReference fireStore =
        FirebaseFirestore.instance.collection("budgetTree");
    await fireStore.get().then(
      (res) {
        res.docChanges.forEach(
          (change) {
            if (int.parse(change.doc['amount']) > 0) {
              _income.add(
                Income(
                  change.doc["userName"],
                  double.parse(change.doc["amount"]),
                  Colors.pink,
                ),
              );
              users.add(change.doc["userName"]);
            }
          },
        );
      },
      onError: (e) => print("Error completing: $e"),
    );

    users.forEach((element) {
      _incomeChrt.add(Income(
        element,
        0,
        colorList.elementAt(
          (math.Random().nextInt(colorList.length)),
        ),
      ));
    });

    for (var inc in _income) {
      for (var incCh in _incomeChrt) {
        if (inc.username == incCh.username) {
          incCh.amount += inc.amount;
        }
      }
    }

    _incomeChrt.sort((a, b) => b.amount.compareTo(a.amount));

// FOr Income
    // if(_expenseChrt.length > 3){
    //   for(var i = 0; i < _expenseChrt.length; i++){
    //     if (i > 3){
    //       _expenseChrt.elementAt(3).amount += _expenseChrt.elementAt(i).amount;
    //       _expenseChrt.elementAt(3).username = 'Others';
    //       _expenseChrt.insert(i, new Expense("", 0, Colors.pinkAccent));
    //     }
    //   }
    // }

    _income = [];
    if (_incomeChrt.length > 3) {
      for (var i = 0; i < _incomeChrt.length; i++) {
        if (i > 3) {
          _incomeChrt.elementAt(3).amount += _incomeChrt.elementAt(i).amount;
          _incomeChrt.elementAt(3).username = 'Others';
          if (i == (_incomeChrt.length - 1))
            _income.insert(3, _incomeChrt.elementAt(3));
        } else {
          _income.add(_incomeChrt.elementAt(i));
        }
      }
    }
    _incomeChrt = [];
    return _income;
  }
}
