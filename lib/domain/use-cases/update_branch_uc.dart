
import 'package:test1/domain/entities/branch.dart';

import '../repository/branch_crud_repository.dart';
import 'base_usecase.dart';

class UpdateBranchUC implements FutureBaseUseCase<bool> {
  BranchCRUDRepository repository = BranchCRUDRepository();

  final Branch branch;

  UpdateBranchUC({required this.branch});

  @override
  Future<bool> execute() async {
    return await repository.updateBranch(branch);
  }
}