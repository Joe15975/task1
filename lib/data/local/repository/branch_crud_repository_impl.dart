
import 'package:flutter/foundation.dart';
import 'package:test1/app/consts.dart';
import 'package:test1/data/local/data_source/branch_database.dart';
import 'package:test1/domain/entities/branch.dart';
import 'package:test1/domain/repository/branch_crud_repository.dart';

class BranchCRUDRepositoryImpl implements BranchCRUDRepository {
  @override
  Future<bool> createBranch(Branch branch) async {
    bool result = false;

    final db = BranchDatabaseSource.database!;

    try {
      await db.insert(Consts.tableNames.branch, branch.toJson());
    } catch (e, s) {
      if (kDebugMode){
        debugPrintStack(stackTrace: s, label: e.toString());
      }
    }

    return result;
  }

  @override
  Future<bool> deleteBranch(Branch branch) async {
    bool result = false;

    final db = BranchDatabaseSource.database!;

    try {
      await db.delete(
        Consts.tableNames.branch,
        where: '${BranchFields.branch.name} = ?',
        whereArgs: [branch.branch],
      );
    } catch (e, s) {
      if (kDebugMode){
        debugPrintStack(stackTrace: s, label: e.toString());
      }
    }

    return result;
  }

  @override
  Future<List<Branch>> retrieveBranches() async {
    List<Branch> branches = [];

    final querySnaps = await BranchDatabaseSource.database!.query(Consts.tableNames.branch);

    for (var querySnap in querySnaps) {
      branches.add(Branch.fromJson(querySnap));
    }

    return branches;
  }

  @override
  Future<bool> updateBranch(Branch branch) async {
    bool result = false;

    final db = BranchDatabaseSource.database!;

    try {
      await db.update(
        Consts.tableNames.branch,
        branch.toJson(),
        where: '${BranchFields.branch.name} = ?',
        whereArgs: [branch.branch],
      );
    } catch (e, s) {
      if (kDebugMode){
        debugPrintStack(stackTrace: s, label: e.toString());
      }
    }

    return result;
  }

}