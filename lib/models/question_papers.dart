class QuestionPapersData {
  List<QuestionPapers>? questionPapers;

  QuestionPapersData({this.questionPapers});

  QuestionPapersData.fromJson(Map<String, dynamic> json) {
    if (json['QuestionPapers'] != null) {
      questionPapers = <QuestionPapers>[];
      json['QuestionPapers'].forEach((v) {
        questionPapers!.add(new QuestionPapers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questionPapers != null) {
      data['QuestionPapers'] =
          this.questionPapers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionPapers {
  String? subject;
  int? year;
  int? semester;
  String? url;

  QuestionPapers({this.subject, this.year, this.semester, this.url});

  QuestionPapers.fromJson(Map<String, dynamic> json) {
    subject = json['Subject'];
    year = json['Year'];
    semester = json['Semester'];
    url = json['Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Subject'] = this.subject;
    data['Year'] = this.year;
    data['Semester'] = this.semester;
    data['Url'] = this.url;
    return data;
  }
}
