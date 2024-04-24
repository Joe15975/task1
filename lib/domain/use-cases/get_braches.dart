
import 'package:test1/domain/repository/branch_crud_repository.dart';

import '../entities/branch.dart';
import 'base_usecase.dart';

class GetBranchesUC implements FutureBaseUseCase<List<Branch>> {
  BranchCRUDRepository repository = BranchCRUDRepository();


  @override
  Future<List<Branch>> execute() async {
    return await repository.retrieveBranches();
  }
}