import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/presentation/screens/add_branch_screen/add_branch_landscape_view.dart';
import 'package:test1/presentation/screens/add_branch_screen/add_branch_portrait_view.dart';

import 'add_branch_vm.dart';

class AddBranchScreen extends StatelessWidget {
  final ChangeNotifierProvider<AddBranchVM> cnProvider;

  const AddBranchScreen({
    super.key,
    required this.cnProvider,
  });

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      return AddBranchLandscapeView(
        cnProvider: cnProvider,
      );
    } else {
      return AddBranchPortraitView(
        cnProvider: cnProvider,
      );
    }
  }
}
