import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var widthBtn = 85.0;
  var heightBtn = 85.0;

  var textSize = 30.0;
  var fontWeight1 = FontWeight.w500;
  var symbolColor1 = Colors.orangeAccent;
  var symbolColor2 = Colors.grey;
  var btnTextColor1 = Colors.white;
  var allBtnColor = Color.fromRGBO(59, 57, 57, 1.0);

  var resultController = TextEditingController();
  var inputController = TextEditingController();
  var _input = "";
  var _output = "";

  void _onPressed(String btnText) {
    setState(() {
      if (btnText == "C") {
        _input = "";
      } else if (btnText == "DEL") {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (btnText == "=") {
        _output = _evaluateExpression();
      } else {
        _input += btnText;
      }

      inputController.text = _input;
      resultController.text = _output;
    });
  }

  String _evaluateExpression() {
    try {
      // Create an expression parser
      Parser p = Parser();
      // Parse the input string
      Expression exp = p.parse(_input);
      // Create an evaluator
      ContextModel cm = ContextModel();
      // Evaluate the expression
      double result = exp.evaluate(EvaluationType.REAL, cm);
      // Return the result as a string
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 20),
            child: TextField(
              controller: resultController,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 20),
            child: TextField(
              controller: inputController,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 35)),
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                      onPressed: () => _onPressed('C'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: symbolColor2,
                      ),
                      child: Text(
                        'C',
                        style: TextStyle(
                            fontSize: textSize,
                            fontWeight: fontWeight1,
                            color: btnTextColor1),
                      ),
                    )),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('DEL'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: symbolColor2,
                        ),
                        child: Text('+/-',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('%'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: symbolColor2,
                        ),
                        child: Text('%',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('/'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: symbolColor1,
                        ),
                        child: Text('/',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('7'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('7',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('8'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('8',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('9'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('9',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('*'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: symbolColor1,
                        ),
                        child: Text('x',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('4'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('4',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('5'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('5',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('6'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('6',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('-'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: symbolColor1,
                        ),
                        child: Text('-',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('1'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('1',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('2'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('2',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('3'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('3',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('+'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: symbolColor1,
                        ),
                        child: Text('+',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('0'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: allBtnColor,
                            alignment: Alignment.centerLeft),
                        child: Text('0',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('.'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: allBtnColor,
                        ),
                        child: Text('.',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
                SizedBox(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.1,
                    child: ElevatedButton(
                        onPressed: () => _onPressed('='),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: symbolColor1,
                        ),
                        child: Text('=',
                            style: TextStyle(
                                fontSize: textSize,
                                fontWeight: fontWeight1,
                                color: btnTextColor1)))),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
