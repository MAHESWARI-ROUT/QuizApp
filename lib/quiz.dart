import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/starting_screen.dart';
import 'package:quiz_app/data.dart/questions.dart';
import 'package:quiz_app/result_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers=[];
  var activeScreen = 'starting_screen';
  /*@override
 void initState(){
    activeScreen =  StartScreen(switchScreen);
    super.initState();
  }*/
  void switchScreen() {
    setState(() {
      activeScreen = 'question_page';
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {
        //selectedAnswers=[];

        activeScreen='result_screen';
      });
    }
      
  }
  void reStartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen='question_screen';
    });
  }

  @override
  Widget build(context) {
   Widget screenWidget = StartScreen(switchScreen) ;
   if(activeScreen == 'question_page') {
    screenWidget =  QuestionScreen(onSelectAnswer:chooseAnswer);

   }
   if(activeScreen=='result_screen'){
    screenWidget= ResultScreen(chosenAnswer: selectedAnswers,onRestart:reStartQuiz);
   }
   
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(223, 58, 12, 110),
                Color.fromARGB(229, 100, 36, 165),
                Color.fromARGB(221, 152, 80, 172)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          /*activeScreen == 'starting_screen'
              ? StartScreen(switchScreen)
              : const QuestionScreen(),*/
        ),
      ),
    );
  }
}
