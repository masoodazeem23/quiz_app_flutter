import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       backgroundColor: Colors.grey.shade900,
       body: SafeArea(
           child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 10.0),
             child: QuizPage(),
           )
       ),
     ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickedAnswer){
    // The user picked true.
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if(quizBrain.isFinished()){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        }
        else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                ),
              ),
            )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // Set the background color
                foregroundColor: Colors.white, // Set the text color
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Optional: Padding
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0, // Set the font size
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // Set the background color
                foregroundColor: Colors.white, // Set the text color
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Optional: Padding
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0, // Set the font size
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )

      ],
    );
  }
}

