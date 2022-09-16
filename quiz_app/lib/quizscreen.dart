import 'package:flutter/material.dart';
import './model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name('26th march bangladesh become indepandent?', true),
    Question.name('16th march bangladesh become victory?', false),
    Question.name('there are 54 district in bd', false),
    Question.name('sheikh hasina is the prime minister of bd', true),
    Question.name('padma shetu is the second largest bridge in bd', false),
    Question.name('kazi Nazrul islam is the national poet', true),
    Question.name('1757 nabab siraz become died', true),
    Question.name('ziaur rahman is the K force sector commander', false),
    Question.name('16 december is the victory day of Bangladesh', true),
    Question.name('Is India fucked up Bangladesh economoy', true),
    Question.name('Ruppur Power plant is in kustia', false),
    Question.name('shimul loves samiwon akter munmun', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'ZoZo Quiz APP',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SECTION 1
            Center(
              child: Image.asset(
                "images/flag.png",
                width: 350,
                height: 250,
              ),
            ),

            // SECTION 2
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(17.0),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  child: Center(
                      child: Text(
                    questionBank[_currentQuestionIndex].questionText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ))),
            ),

            // SECTION 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => _goBackword(),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    )),
                ElevatedButton(
                    onPressed: () => _doSomething(true),
                    child: const Text(
                      'TRUE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    )),
                ElevatedButton(
                    onPressed: () => _doSomething(false),
                    child: const Text(
                      'FLAE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    )),
                ElevatedButton(
                    onPressed: () => _goForword(),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    )),
              ],
            ),

            // SECTION 4
            Spacer(),
          ],
        ),
      ),
    );
  }

  _doSomething(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].istrue) {
      //
      //debugPrint('Correct');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Correct ANSWER'),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
        ),
      );
      _updateQuestion();
    } else {
      //debugPrint('inCorrect!');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Incorrect ANSWER'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      ));
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _goForword() {
    _updateQuestion();
  }

  _goBackword() {
    setState(() {
      debugPrint('$_currentQuestionIndex');
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
