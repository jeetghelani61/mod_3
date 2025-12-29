import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _firstNumber = '';
  String _secondNumber = '';
  String _operation = '';
  bool _isOperationSelected = false;

  void _onNumberPressed(String number) {
    setState(() {
      if (_display == '0' || _isOperationSelected) {
        _display = number;
        _isOperationSelected = false;
      } else {
        _display += number;
      }
      
      if (_operation.isEmpty) {
        _firstNumber = _display;
      } else {
        _secondNumber = _display;
      }
    });
  }

  void _onOperationPressed(String op) {
    setState(() {
      _operation = op;
      _isOperationSelected = true;
      _firstNumber = _display;
    });
  }

  void _calculate() {
    double first = double.tryParse(_firstNumber) ?? 0;
    double second = double.tryParse(_secondNumber) ?? 0;
    double result = 0;

    switch (_operation) {
      case '+':
        result = first + second;
        break;
      case '-':
        result = first - second;
        break;
      case '×':
        result = first * second;
        break;
      case '÷':
        result = second != 0 ? first / second : 0;
        break;
    }

    setState(() {
      _display = result.toStringAsFixed(result % 1 == 0 ? 0 : 2);
      _firstNumber = _display;
      _secondNumber = '';
      _operation = '';
      _isOperationSelected = false;
    });
  }

  void _clear() {
    setState(() {
      _display = '0';
      _firstNumber = '';
      _secondNumber = '';
      _operation = '';
      _isOperationSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          // Display
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _display,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: EdgeInsets.all(8),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                // First Row
                ElevatedButton(
                  onPressed: _clear,
                  child: Text('C', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('±', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('%', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onOperationPressed('÷'),
                  child: Text('÷', style: TextStyle(fontSize: 24)),
                ),
                // Second Row
                ElevatedButton(
                  onPressed: () => _onNumberPressed('7'),
                  child: Text('7', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onNumberPressed('8'),
                  child: Text('8', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onNumberPressed('9'),
                  child: Text('9', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onOperationPressed('×'),
                  child: Text('×', style: TextStyle(fontSize: 24)),
                ),
                // Third Row
                ElevatedButton(
                  onPressed: () => _onNumberPressed('4'),
                  child: Text('4', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onNumberPressed('5'),
                  child: Text('5', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onNumberPressed('6'),
                  child: Text('6', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onOperationPressed('-'),
                  child: Text('-', style: TextStyle(fontSize: 24)),
                ),
                // Fourth Row
                ElevatedButton(
                  onPressed: () => _onNumberPressed('1'),
                  child: Text('1', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onNumberPressed('2'),
                  child: Text('2', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onNumberPressed('3'),
                  child: Text('3', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onOperationPressed('+'),
                  child: Text('+', style: TextStyle(fontSize: 24)),
                ),
                // Fifth Row
                ElevatedButton(
                  onPressed: () => _onNumberPressed('0'),
                  child: Text('0', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _onNumberPressed('.'),
                  child: Text('.', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: _calculate,
                  child: Text('=', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
