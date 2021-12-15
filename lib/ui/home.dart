import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double _billamt = 0.0;
  int _person = 1;
  int _tip = 0;

  @override
  Widget build(BuildContext context) {
    // final screenheight = (context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bill Calculator"),
          backgroundColor: Colors.amberAccent.shade200.withOpacity(0.5),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(13),
            children: [
              Center(
                child: Container(
                  width: 550,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent.shade200.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TotalAmount per person",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$" +
                            (((_billamt * (1 + (_tip / 100))) / _person)
                                .toStringAsFixed(2)),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  width: 550,
                  height: 250,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.blueGrey.shade700,
                          style: BorderStyle.none)),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        style: TextStyle(
                          color: Colors.amber.shade700,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          prefixText: 'Bill Amount: ',
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.amber.shade700,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber.shade700)),
                        ),
                        onChanged: (String val) {
                          try {
                            setState(() {
                              _billamt = double.parse(val);
                            });
                            // ignore: non_constant_identifier_names
                          } catch (Exception) {
                            _billamt = 0.0;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Split",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (_person > 1) {
                                    setState(() {
                                      _person--;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.amberAccent.shade200
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Text(
                                _person.toString(),
                                style: TextStyle(
                                  color: Colors.amber.shade700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (true) {
                                    setState(() {
                                      _person++;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.amberAccent.shade200
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tip",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$" + (_billamt * (_tip / 100)).toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.amber.shade700,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "$_tip %",
                            style: TextStyle(
                              color: Colors.amber.shade700,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Slider(
                              min: 0.0,
                              max: 100.0,
                              divisions: 10,
                              activeColor: Colors.amber.shade700,
                              inactiveColor: Colors.blueGrey.shade300,
                              value: _tip.toDouble(),
                              onChanged: (double newval) {
                                setState(() {
                                  _tip = newval.toInt();
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
