import 'package:flutter/material.dart';
import 'package:note_bit/const.dart';
import 'package:note_bit/models/question_papers.dart';

class PdfCard extends StatelessWidget {
  const PdfCard({super.key, required this.questionPapers});

  final QuestionPapers questionPapers;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/pdf.png",
          fit: BoxFit.cover,
        ),
        Text(
          questionPapers.subject![0],
          style: constFonts,
        )
      ],
    );
  }
}
