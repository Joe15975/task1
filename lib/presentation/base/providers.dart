
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/domain/entities/branch.dart';
import 'package:test1/presentation/screens/add_branch_screen/add_branch_vm.dart';
import 'package:test1/presentation/screens/homescreen/home_vm.dart';


class ProviderVM{

  static final homeVM = ChangeNotifierProvider<HomeVM>((ref) {
    return HomeVM()..init();
  });

  ChangeNotifierProvider<AddBranchVM> addBranchCN(Branch? branch)
  => ChangeNotifierProvider((ref) => AddBranchVM()..init(branch));
}