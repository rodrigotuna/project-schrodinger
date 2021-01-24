import 'package:flutter/material.dart';
import 'package:uni/model/entities/exam.dart';

class HomePageView extends StatelessWidget {
  final List<Exam> exams;

  const HomePageView(this.exams, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ListView(children: this.buildExams(context));

  List<Widget> buildExams(BuildContext context) {
    //TODO: Your code should be here
    return [];
  }
}
