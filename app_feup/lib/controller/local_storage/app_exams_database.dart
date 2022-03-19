import 'dart:async';
import 'package:uni/controller/local_storage/app_database.dart';
import 'package:uni/model/entities/exam.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';

/// Manages the app's Exams database.
/// 
/// This database stores information about the user's exams.
/// See the [Exam] class to see what data is stored in this database.
class AppExamsDatabase extends AppDatabase {

  var months = {
    'Janeiro': '01',
    'Fevereiro': '02',
    'Março': '03',
    'Abril': '04',
    'Maio': '05',
    'Junho': '06',
    'Julho': '07',
    'Agosto': '08',
    'Setembro': '09',
    'Outubro': '10',
    'Novembro': '11',
    'Dezembro': '12'
  };

  static final _createScript =
  '''CREATE TABLE exams(subject TEXT, begin TEXT, end TEXT,
          rooms TEXT, day TEXT, examType TEXT, weekDay TEXT, month TEXT, year TEXT) ''';

  AppExamsDatabase()
      : super(
              'exams.db',
              [
              _createScript,
              ]);


  /// Replaces all of the data in this database with [exams].
  saveNewExams(List<Exam> exams) async {
    await deleteExams();
    await _insertExams(exams);
  }

  /// Returns a list containing all of the exams stored in this database.
  Future<List<Exam>> exams() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('exams');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Exam.secConstructor(
          maps[i]['subject'],
          DateTime.parse(maps[i]['year'] +'-' + months[maps[i]['month']] +'-' +maps[i]['day']+' '+maps[i]['begin']),
          DateTime.parse(maps[i]['year'] +'-' + months[maps[i]['month']] +'-' +maps[i]['day']+' '+maps[i]['end']),
          maps[i]['rooms'],
          maps[i]['examType'],
          maps[i]['weekDay']);
    });}


  /// Adds all items from [exams] to this database.
  /// 
  /// If a row with the same data is present, it will be replaced.
  Future<void> _insertExams(List<Exam> exams) async {
    for (Exam exam in exams) {
      await insertInDatabase(
        'exams',
        exam.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  /// Deletes all of the data stored in this database.
  Future<void> deleteExams() async {
    // Get a reference to the database
    final Database db = await this.getDatabase();

    await db.delete('exams');
  }

}
