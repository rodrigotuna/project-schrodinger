import 'package:flutter/material.dart';
import 'package:uni/model/entities/exam.dart';

class ExamView extends StatelessWidget {
  final Exam exam;

  ExamView(this.exam, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text('Your exam code goes here!');
}
