
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../app/consts.dart';
import '../../../domain/entities/branch.dart';


abstract class BranchDatabaseSource {

  factory BranchDatabaseSource() => _BranchDatabase();

  static Database? get database => _BranchDatabase.database;

  Future<void> initializeDB();
  Future<bool> createTable();
  Future<bool> closeDatabase();
  Future<bool> deleteTable();
  Future<bool> deleteDatabase();
}

class _BranchDatabase implements BranchDatabaseSource {

  static Database? database;

  @override
  Future<void> initializeDB() async {

    final dbPath = await getDatabasesPath();

    final path = join(dbPath, '${Consts.dbNames.branch}.db');

    try {
      database = await openDatabase(
        path,
        version: 1,
      );

      if (! await checkTableExists(database!, Consts.tableNames.branch)) {
        createTable();
      }

    } catch (e, s) {
      if (kDebugMode){
        debugPrintStack(stackTrace: s, label: e.toString());
      }
    }
  }

  @override
  Future<bool> createTable() async {
    bool result = false;

    try {
      await database!.execute('''
          CREATE TABLE ${Consts.tableNames.branch} (
              ${BranchFields.branch.name} INTEGER PRIMARY KEY,
              ${BranchFields.customNo.name} INTEGER NOT NULL,
              ${BranchFields.arabicName.name} TEXT NOT NULL,
              ${BranchFields.arabicDescription.name} TEXT NOT NULL,
              ${BranchFields.englishName.name} TEXT NOT NULL,
              ${BranchFields.englishDescription.name} TEXT NOT NULL,
              ${BranchFields.note.name} TEXT NOT NULL,
              ${BranchFields.address.name} TEXT NOT NULL
            )
            ''');
      result = true;
    } catch (e, s) {
      if (kDebugMode){
        debugPrintStack(stackTrace: s, label: e.toString());
      }
    }

    return result;
  }

  @override
  Future<bool> deleteDatabase() {
    // TODO: implement deleteDatabase
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTable() {
    // TODO: implement deleteTable
    throw UnimplementedError();
  }

  @override
  Future<bool> closeDatabase() {
    // TODO: implement closeDatabase
    throw UnimplementedError();
  }

  Future<bool> checkTableExists(Database database, String branch) async {
    try{
      int? count = Sqflite
          .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM $branch'));

      return (count ?? 0) > 0;
    } catch (e, s) {
      if (kDebugMode) {
        print('Could find table');
      }
      return false;
    }
  }

}
