import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class PersonalInfo {
  String name;
  String course;
  String average;
  List<CourseUnit> ucs;

  //'https://pastebin.com/raw/3U5b0cUj'

  PersonalInfo(this.name, this.course, this.average, this.ucs);

  static Future<PersonalInfo> getFromLink(String link) async {
    final file = await http.get(link);
    final document = parse(file.body);

    final name = document.querySelector('.estudante-info-nome').text;
    final course = document.querySelector('.estudante-lista-curso-nome').text;
    final average = document.querySelector('.caixa').querySelectorAll('td')[1].text;
    final ucs = getCourseUnits(document);
    return PersonalInfo(name, course, average, ucs);
  }

  @override
    String toString() {
      return '$name\n$course\n$average\n${ucs.toString()}';
    }

}

class CourseUnit {
  String year;
  String semester;
  String code;
  String name;
  String ects;
  String grade;
  bool approved;
  
  CourseUnit(this.year, this.semester, this.code, this.name, this.ects, this.grade, this.approved);

  @override
    String toString() {
      return '$year - $semester - $code - $name - $ects - $grade - $approved\n';
    }

}

List<CourseUnit> getCourseUnits(Document document) {
  final gradesBox = document.querySelector('.caixa');
  final List<Element> rows = gradesBox.querySelector('#tabelapercurso').querySelectorAll('.i, .p');
  List<CourseUnit> ucs = parseUCs(rows);
  return ucs;
} 


List<CourseUnit> parseUCs(List<Element> rows) {
  List<CourseUnit> ucs = List<CourseUnit>();
  for (var row in rows) {
    final children = row.children;
    final year = children[0].text;
    final semester = children[1].text[0];
    final code = children[2].firstChild.text;
    final name = children[3].firstChild.text;
    final ects =  children[5].text;
    final approved = row.querySelectorAll('.aprovado').length > 0? true: false;
    var grade;
    if (approved) {
      final List<Element> grades = row.querySelectorAll('.n.aprovado');
      grade = grades.last.text;
    }
    ucs.add(CourseUnit(year, semester, code, name, ects, grade, approved));
  } 
  return ucs;
}

void main() async{
  final inst = await PersonalInfo.getFromLink('https://pastebin.com/raw/3U5b0cUj');
  print(inst.toString());
  
}