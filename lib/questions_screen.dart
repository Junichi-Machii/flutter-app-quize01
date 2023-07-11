import 'package:flutter/material.dart';
import 'package:flutter_quizapp01/answer_button.dart';
import 'package:flutter_quizapp01/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer});


  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final curentQuestions = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'クイズです！',
              style: GoogleFonts.yuseiMagic(
                fontSize: 24,
                color: Colors.white60,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              curentQuestions.text,
              style:  GoogleFonts.saira(
                fontSize: 16,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...curentQuestions.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: (){
                  answerQuestion(answer);
                },);
              
            })
          ],
        ),
      ),
    );
  }
}
