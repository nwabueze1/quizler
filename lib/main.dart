import 'package:flutter/material.dart';
import 'package:quizler/ScoreKeeper.dart';
import 'package:quizler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
ScoreKeeper scoreKeeper = ScoreKeeper();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Quizler(),
    );
  }
}

class Quizler extends StatefulWidget {
  const Quizler({Key? key}) : super(key: key);

  @override
  State<Quizler> createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
  void nextQuestion(bool answer) {
    scoreKeeper.updateScores(quizBrain.isAnswerCorrect(answer) ? true : false);
    setState(() {
      quizBrain.nextQuestion();
    });
  }

  void showAlert(BuildContext context) {
    scoreKeeper.reset();
    setState(() {
      quizBrain.reset();
    });
    Alert(
        context: context,
        title: 'Finished the Question',
        desc: 'You have finished answering the questions, Kudos.',
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.red,
            child: const Text(
              "Reset",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    quizBrain.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ElevatedButton(
                onPressed: () => quizBrain.hasNextQuestion
                    ? nextQuestion(true)
                    : showAlert(context),
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                ),
                child: const Text('True'),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => quizBrain.hasNextQuestion
                    ? nextQuestion(false)
                    : showAlert(context),
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.red)),
                child: const Text('False'),
              ),
            )),
            Row(
              children: scoreKeeper.scores,
            )
          ],
        ),
      )),
    );
    ;
  }
}
