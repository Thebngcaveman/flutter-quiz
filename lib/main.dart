import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';
import 'questions.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyQuiz());
}
class MyQuiz extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        )
      )
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int sumScore = 0;
  bool cheatedAttempt = false;
  void checkAnswer(bool pickedAnswer){
    bool correct = quizBrain.getAnswer();
    setState(() {
    if(correct == pickedAnswer){
      sumScore++;
      scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
    }else{
      scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
    }
      quizBrain.nextQuestion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FlatButton(
            textColor: Colors.white,
            color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("RESET"),
             ),
            onPressed: (){
              setState(() {
                cheatedAttempt = false;
                sumScore = 0;
                scoreKeeper = [];
                quizBrain.reset();
              });
            }
        ),
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
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if(cheatedAttempt){
                  Alert(
                    context: context,
                    title: "The test is finished",
                    desc: "Click reset at the top.",
                  ).show();
                }
                else {
                  checkAnswer(true);
                  if (quizBrain.isFinished()) {
                    cheatedAttempt = true;
                    Alert(
                      context: context,
                      type: AlertType.info,
                      title: "Congratulations !!!",
                      desc: "You have finished our quiz with $sumScore point(s).",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "RESET",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              cheatedAttempt = false;
                              sumScore = 0;
                              scoreKeeper = [];
                              quizBrain.reset();
                            });
                            Navigator.pop(context);
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color : Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                  if(cheatedAttempt){
                      Alert(
                      context: context,
                      title: "The test is finished",
                      desc: "Click reset at the top",
                      ).show();
                  }
                else {
                    checkAnswer(false);
                    if (quizBrain.isFinished()) {
                      cheatedAttempt = true;
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Congratulations !!!",
                        desc: "You have finished our quiz with $sumScore point(s).",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "RESET",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                cheatedAttempt = false;
                                sumScore = 0;
                                scoreKeeper = [];
                                quizBrain.reset();
                              });
                              Navigator.pop(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }
                  }
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


















