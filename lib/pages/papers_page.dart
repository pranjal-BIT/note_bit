import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_bit/const.dart';
import 'package:note_bit/models/question_papers.dart';
import 'package:note_bit/widgets/pdf_card.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PapersPage extends StatefulWidget {
  const PapersPage({super.key});

  @override
  State<PapersPage> createState() => _PapersPageState();
}

class _PapersPageState extends State<PapersPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("lib/assets/question_papers.json"),
        builder: (context, snapshot) {
          var subjectName = jsonDecode(snapshot.data.toString());
          
          if (subjectName == null) {
            return Center(
              child: CircularProgressIndicator(color: Colors.grey[500]),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                var subjectUrl = subjectName["QuestionPapers"][index]["Url"];
                return Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      child: ListTile(
                        
                        onTap: () => launchUrl(Uri.parse(subjectUrl)),
                        leading: Image.asset('lib/assets/pdf_mini.png'),
                        title: Text(
                          subjectName["QuestionPapers"][index]["Subject"],
                          style: constFonts,
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Text(
                          subjectName["QuestionPapers"][index]["Year"],
                          style: constFonts,
                          textAlign: TextAlign.start,
                        ),
                        trailing: Icon(
                          Icons.download,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: subjectName["QuestionPapers"].length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[500],
                  indent: 24,
                  endIndent: 24,
                  height: 50,
                );
              },
            );
          }
        });
  }
}

// Text(
//                   subjectName["QuestionPapers"][index]["Subject"],
//                   style: constFonts,
//                   textAlign: TextAlign.center,
//                 );

//