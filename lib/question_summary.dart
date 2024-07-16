import 'package:flutter/material.dart';
//import 'package:quiz_app/question_summary.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  Container(
                    
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: data['user_answer']==data['corect_answer']?Colors.green:Color.fromARGB(255, 245, 158, 152),
                    ),
                    
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),fontSize: 15,
                        ),
                      ),
                    
                  ),const SizedBox(width:20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (data['question'] as String),
                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          (data['user_answer'] as String),
                          style:  TextStyle(
                              color: data['user_answer']==data['corect_answer']?Colors.green:Color.fromARGB(255, 231, 139, 132),),
                        ),
                        Text(
                          (data['corect_answer'] as String),
                          style: const TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
