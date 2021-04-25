import 'package:flutter/material.dart';
import 'package:quiz/result.dart';
import './quiz.dart';
import './result.dart';

void main(){
runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
 }

class _QuizAppState extends State{

  final _questions = const[
    {'questionText': 'ماهي درجة شعورك بالحمي؟',
      'answers': [{'text': 'قوية جدا','score' : 8},
        {'text' : 'قوية','score':6} ,
        {'text':'بسيطة','score':4},
        {'text':'عادية','score':2}],
    },

  {'questionText': 'ما هي درحة شعورك بالتعب في جسدك؟',
  'answers':[{'text':'قوي جدا','score':8},
    {'text':'قوي','score':6},
    {'text':'بسيط','score':4},
    {'text':'عادي','score':2}],},

    {'questionText': 'ما هي درحة شعورك بالكحة؟',
      'answers':[{'text':'قوية جدا','score':8},
        {'text':'قوية','score':6},
        {'text':'بسيطة','score':4},
        {'text':'عادية','score':2}],},

    {'questionText': 'ما هي درجة سيلان الانف؟',
      'answers': [{'text':'قوي جدا','score':8},
        {'text':'قوي','score':6},
        {'text':'بسيط','score':4},
        {'text':'عادي','score':2}],
    },

    {'questionText': 'ما هي درحة حاسة التذوق؟',
      'answers':[{'text':'ضعيفة جدا','score':8},
        {'text':'ضعيفة','score':6},
        {'text':'في بعضة الاكلات ضعيفة','score':4},
        {'text':'عادية','score':2}],},

    {'questionText': 'ما هي درجة الصداع؟',
      'answers':[{'text':'قوي جدا','score':8},
        {'text':'قوي','score':6},
        {'text':'بسيط','score':4},
        {'text':'عادي','score':2}],
    }, // question = []     not working if question is constant
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex +1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('we have more question');
    }else{
      print("no more question");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('أختبار فيرس كورونا'),
          backgroundColor: Colors.black,
        ),
        body: _questionIndex < _questions.length
            ?Quiz(answerQuestion: _answerQuestion,questionIndex: _questionIndex,questions: _questions,)
        : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
