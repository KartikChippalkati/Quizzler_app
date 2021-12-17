import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'question.dart';
import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  //const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyApp(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "The Game Of Questions!!!",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> ScoreKeeper = [];

  //Question q1 = Question('is tajmahal is in delhi?',false);

  // List<Question> _QuestionBank = [
  //Question('is tajmahal is in delhi?',false),
  // Question('is redfort is in delhi?',true),
  //];

  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(userClickedAnswer) {
    setState(() {
      //whereever after one action or after one click of a button , if any code  updates , then that code must be put inside the setState(){  }.  Her after every click(  onPressed(){  }  ) the question number and as well as the scoreKeeper updates , so that's why we keep both of them inside the setState()
      if ((quizBrain.getQuestionAnswer()) == userClickedAnswer) {
        ScoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
          size: 40.0,
        ));
      } else {
        ScoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
          size: 40.0,
        ));
      }

      //  while (QuestionNumber < 3) {
      // print(QuestionNumber);
      quizBrain.nextQuestion();
      // print(QuestionNumber);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Questions myQuestions = Questions();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ), // For Text
        Expanded(
          //flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                "True",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),

              //  if( Answers[QuestionNumber] == true){
//this statement should not be written here bcz after pressing the button we will check the answer is correct or not,so we have to write this code inside the  onPressed(
              //},

              // quizBrain.QuestionBank[QuestionNumber].questionAnswer = true;     //anyone can change the code and manipulate your app.So we have to make our code private and encapsulate it.In DART we can make the code private by putting the underscore behind the variable _variable

              onPressed: () {
                checkAnswer(true);
              }, // this onPressed is very much important , if u don't write this FlatButton will not work
            ),
          ),
        ), // For True Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                "False",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              }, // this onPressed is very much important , if u don't write this FlatButton will not work
            ),
          ),
        ), //For False Button
        Expanded(
          // here "Expanded" is of no use bcz it is going out of screen.So i have to fix it
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ScoreKeeper,
            ),
          ),
        ) // For Row of Score Keeper
      ],
    );
  }
}

// I have completed this project on my own
//I have just seen the video upto Checking users answers (video No - 91)
