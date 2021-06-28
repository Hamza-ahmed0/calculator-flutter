import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  var result = "";

  Widget btn(var textt) {
    return Container(
      height: 60,
      width: 80,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              result = result + textt;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.blueGrey;
                return null; // Use the component's default.
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.black))),
          ),
          child: Text(
            textt,
            style: TextStyle(fontSize: 25),
          )),
    );
  }

  Widget bin(var textt) {
    return (Container(
        height: 60,
        width: 80,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                result = result + textt;
              });
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.black))),
                backgroundColor: MaterialStateProperty.all(Colors.cyanAccent)),
            child: Text(
              textt,
              style: TextStyle(fontSize: 25),
            ))));
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression e = p.parse(result);
    ContextModel c = ContextModel();
    double eval = e.evaluate(EvaluationType.REAL, c);

    setState(() {
      result = eval.toString();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 400,
                height: 150,
                margin: EdgeInsets.only(top:20.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(18.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    )
                    
                    ),
                child: 
                Align(
                  alignment: Alignment.centerRight,

                 child: 
                Text(result,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white))),),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bin("1"),
                      bin("2"),
                      bin("3"),
                      btn("/"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bin("4"),
                      bin("5"),
                      bin("6"),
                      btn("+"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bin("7"),
                      bin("8"),
                      bin("9"),
                      btn("-"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        child: ElevatedButton(
                            onPressed: clearr,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.black))),
                            ),
                            child: Text(
                              "Clear",
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                      bin("0"),
                      btn("*"),
                      Container(
                          height: 60,
                          width: 80,
                          child: ElevatedButton(
                              onPressed: output,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                        side: BorderSide(color: Colors.black))),
                              ),
                              child: Text(
                                "=",
                                style: TextStyle(fontSize: 25),
                              )))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
