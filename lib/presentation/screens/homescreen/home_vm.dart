import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/domain/use-cases/delete_branch_uc.dart';
import 'package:test1/presentation/base/basevm.dart';

import '../../../app/router_helper.dart';
import '../../../domain/entities/branch.dart';
import '../../../domain/use-cases/get_braches.dart';

class HomeVM extends BaseVM {


  void editeBranch(BuildContext context, Branch branch){
    context.pushNamed(
      Routes.addBranch.name,
      extra: branch
    ).then((value) {
      getBranches();
    });
  }

  Future<bool> deleteBranch(Branch branch) async {
    return await DeleteBranchUC(branch: branch).execute();
  }

  List<Branch> _branches = [];
  List<Branch> get branches => _branches;
  set branches(List<Branch> value) {
    _branches = value;
    notifyListeners();
  }

  Future<void> init() async {
    getBranches();
  }

  Future<void> getBranches() async {
    branches = await GetBranchesUC().execute();
    notifyListeners();
  }

}