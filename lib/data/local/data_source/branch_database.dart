
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as DesktopSQLite;
import 'package:sqflite/sqflite.dart' as SQFLite;

import '../../../app/consts.dart';
import '../../../domain/entities/branch.dart';


abstract class BranchDatabaseSource {

  factory BranchDatabaseSource() => _BranchDatabase();

  static SQFLite.Database? get database => _BranchDatabase.database;

  Future<void> initializeDB();
  Future<bool> createTable();
  Future<bool> closeDatabase();
  Future<bool> deleteTable();
  Future<bool> deleteDatabase();
}

class _BranchDatabase implements BranchDatabaseSource {

  static SQFLite.Database? database;

  @override
  Future<void> initializeDB() async {


    String appDocDir = join((await getApplicationDocumentsDirectory()).path, 'databases', );



    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {

      await _openDBDesktop(appDocDir);

    } else {
      await _openDBMobile(appDocDir);
    }


  }

  Future<void> _openDBDesktop(String dir) async {
    DesktopSQLite.sqfliteFfiInit();
    DesktopSQLite.databaseFactory = DesktopSQLite.databaseFactoryFfi;
    final context = Context(style: Style.windows);

    final path = context.join(dir, 'test1','${Consts.dbNames.branch}.db');

    try {
      database = await DesktopSQLite.openDatabase(
        path,
        // version: 1,
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

  Future<void> _openDBMobile(String dir) async {

    final path = join(dir, '${Consts.dbNames.branch}.db');

    try {
      database = await SQFLite.openDatabase(
        path,
        // version: 1,
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

  Future<bool> checkTableExists(SQFLite.Database database, String branch) async {
    try{
      // int? count = Sqflite
      //     .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM $branch'));

      int? count = (await database.query(branch)).length;

      return (count ?? 0) >= 0;
    } catch (e, s) {
      if (kDebugMode) {
        print('Could find table');
      }
      return false;
    }
  }

}
