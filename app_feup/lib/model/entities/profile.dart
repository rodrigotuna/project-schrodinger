import 'dart:convert';

import 'package:tuple/tuple.dart';

import 'course.dart';

class Profile {
  final String name;
  final String email;
  List<Course> courses;
  final String printBalance;
  final String feesBalance;
  final String feesLimit;
  String facultyAbbrev;

  Profile(
      {this.name = '',
      this.email = '',
      this.courses,
      this.printBalance = '',
      this.feesBalance = '',
      this.facultyAbbrev = '',
      this.feesLimit = ''});

  static Profile fromResponse(dynamic response) {
    final responseBody = json.decode(response.body);
    final List<Course> courses = <Course>[];

    print('PROFILE JSON');
    print(responseBody);
    String facultyAbbrev;
    for (var c in responseBody['cursos']) {
      final Course course = Course.fromJson(c);
      courses.add(course);
      facultyAbbrev = course.abbreviation;
    }
    return Profile(
        name: responseBody['nome'],
        email: responseBody['email'],
        facultyAbbrev: facultyAbbrev,
        courses: courses);
  }

  List<Tuple2<String, String>> keymapValues() {
    return [Tuple2('name', this.name), Tuple2('email', this.email)];
  }
}
