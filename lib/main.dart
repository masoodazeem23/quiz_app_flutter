import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/question.dart';

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

  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    )
  ];

  List<Question> questions = [
  Question('You can lead a cow down stairs but not up stairs.', false),
  Question('Approximately one quarter of human bones are in the feet.', true),
  Question('A slugs\'s blood is green.', true)
  ];


  int questionNumber = 0;

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
                  questions[questionNumber].questionText,
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
                // The user picked true.
                bool correctAnswer = questions[questionNumber].questionAnswer;
                if(correctAnswer == true){
                  print('user got it right');
                }
                else{
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
                print('Button Pressed: True');
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

                // The user picked true.
                bool correctAnswer = questions[questionNumber].questionAnswer;
                if(correctAnswer == false){
                  print('user got it right');
                }
                else{
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
                print('Button Pressed: True');
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

