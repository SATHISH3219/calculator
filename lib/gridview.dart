import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Calculators();
  }
}

class Calculators extends StatefulWidget {
  const Calculators({super.key});

  @override
  State<Calculators> createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(23)),
            height: 120,
            width: 390,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              coustomoutlinbutton("9"),
              coustomoutlinbutton("8"),
              coustomoutlinbutton("7"),
              coustomoutlinbutton("C"),
            ],
          ),
          Row(
            children: <Widget>[
              coustomoutlinbutton("6"),
              coustomoutlinbutton("5"),
              coustomoutlinbutton("4"),
              coustomoutlinbutton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              coustomoutlinbutton("3"),
              coustomoutlinbutton("2"),
              coustomoutlinbutton("1"),
              coustomoutlinbutton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              coustomoutlinbutton("/"),
              coustomoutlinbutton("0"),
              coustomoutlinbutton("*"),
              coustomoutlinbutton("="),
            ],
          ),
        ],
      ),
    );
  }

  Expanded coustomoutlinbutton(String val) => Expanded(
      child: OutlinedButton(
          onPressed: () => btnclicked(val),
          child: Text(
            val,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
              side: const BorderSide(
                color: Color.fromARGB(98, 0, 0, 0),
                width: 2.5,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              fixedSize: const Size(400, 90),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255))));

  double first = 0;
  double second = 0;
  String opp = "";
  String res = "";
  String text = "";
  void btnclicked(String btntxt) {
    if (btntxt == "C") {
      res = "";
      text = "";
    } else if (btntxt == "+" ||
        btntxt == "-" ||
        btntxt == "/" ||
        btntxt == "*") {
      first = double.parse(text);
      opp = btntxt;
      res = "0";
    } else if (btntxt == "=") {
      second = double.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
      if (opp == "*") {
        res = (first * second).toString();
      }
    } else {
      res = int.parse(text + btntxt).toString();
    }
    setState(() {
      text = res;
    });
  }
}
