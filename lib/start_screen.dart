import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen( this.startQuiz, {super.key});

  final void Function() startQuiz;

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    shadowColor: Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 32),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(75, 255, 255, 255),
            ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.quiz_outlined,
                color: Colors.white54,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Flutter 雑学クイズ!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white30),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.play_arrow_rounded),
              onPressed: startQuiz,
              style: outlineButtonStyle,
              label: const Text('クイズをはじめる!!'))
        ],
      ),
    );
  }
}
