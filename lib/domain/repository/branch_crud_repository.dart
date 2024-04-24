import 'package:test1/domain/entities/branch.dart';

import '../../data/local/repository/branch_crud_repository_impl.dart';


abstract class BranchCRUDRepository {
  factory BranchCRUDRepository() => BranchCRUDRepositoryImpl();
  Future<bool> createBranch(Branch branch);
  Future<bool> updateBranch(Branch branch);
  Future<bool> deleteBranch(Branch branch);
  Future<List<Branch>> retrieveBranches();
}