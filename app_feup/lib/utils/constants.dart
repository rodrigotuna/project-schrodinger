library Constants;

import 'package:uni/model/entities/exam.dart';

const navPersonalArea = 'Área Pessoal';
const navSchedule = 'Horário';
const navExams = 'Mapa de Exames';
const navStops = 'Paragens';
const navAbout = 'Sobre';
const navBugReport = 'Bugs e Sugestões';
const navLogOut = 'Terminar sessão';


 
List<Exam> exams = [
  Exam('09:00-12:00', 'SOPE', 'B119, B107, B205', '2019-09-11', 'EN', 'Quarta'),
  Exam('09:00-12:00', 'SOPE', 'B119, B107, B205', '2019-09-25', 'ER', 'Quarta'),
  Exam('14:00-15:00', 'FPRO', 'B104, B207, B119', '2019-09-11', 'EN', 'Quarta'),
  Exam('14:00-15:00', 'FPRO', 'B104, B207, B119', '2019-09-25', 'ER', 'Quarta'),
  Exam('11:00-13:00', 'AEDA', 'B104, B207, B119', '2019-09-10', 'EN', 'Terça'),
  Exam('11:00-13:00', 'AEDA', 'B104, B207, B119', '2019-09-24', 'ER', 'Terça'),
  // ignore: lines_longer_than_80_chars
  Exam('11:00-13:00', 'MNUM', 'B104, B207, B119', '2019-09-09', 'EN', 'Segunda'),
  // ignore: lines_longer_than_80_chars
  Exam('11:00-13:00', 'MNUM', 'B104, B207, B119', '2019-09-23', 'ER', 'Segunda'),
];
