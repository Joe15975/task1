
import 'package:test1/domain/entities/branch.dart';
import 'package:test1/domain/repository/branch_crud_repository.dart';
import 'package:test1/domain/use-cases/base_usecase.dart';

class CreateBranchUC implements FutureBaseUseCase{

  final Branch branch;
  final BranchCRUDRepository branchCRUDRepository = BranchCRUDRepository();

  CreateBranchUC({required this.branch});

  @override
  Future execute() async {
    await branchCRUDRepository.createBranch(branch);
  }

}