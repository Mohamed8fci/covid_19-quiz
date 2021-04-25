import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore,this.resetHandler);

  String get resultPhrase{
    String resultText;

    if(resultScore<16){
      resultText = 'دور برد عادي';
    }else if(resultScore<24){
      resultText = "تحتاج للراحة المنزلية من الارهاق والتعب";
    }else{
      resultText = "تحتاج الذهاب للمستشفي و العزل المنزلي واتباع بروتوكول وزارة الصحة";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(resultPhrase
          ,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Center(child: RaisedButton(child: Text('اعادة الاختبار؟'),textColor:  Colors.purple, onPressed: resetHandler,))
      ],
    ),
    );
  }
}
