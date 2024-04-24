
import '../entities/branch.dart';
import '../repository/branch_crud_repository.dart';
import 'base_usecase.dart';

class DeleteBranchUC implements FutureBaseUseCase<bool> {
  BranchCRUDRepository repository = BranchCRUDRepository();

  final Branch branch;

  DeleteBranchUC({required this.branch});

  @override
  Future<bool> execute() async {
    return await repository.deleteBranch(branch);
  }
}