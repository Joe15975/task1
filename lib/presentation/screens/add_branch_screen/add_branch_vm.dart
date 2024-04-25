
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:test1/domain/entities/branch.dart';
import 'package:test1/domain/use-cases/create_branch_uc.dart';
import 'package:test1/presentation/base/basevm.dart';

import '../../../domain/use-cases/update_branch_uc.dart';
import '../../base/providers.dart';

class AddBranchVM extends BaseVM implements _AddPersonUI {


  @override
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  TextEditingController addressController = TextEditingController();

  @override
  TextEditingController arabicDescriptionController = TextEditingController();

  @override
  TextEditingController arabicNameController = TextEditingController();

  @override
  TextEditingController branchController = TextEditingController();

  @override
  TextEditingController customNoController = TextEditingController();

  @override
  TextEditingController englishDescriptionController = TextEditingController();

  @override
  TextEditingController englishNameController = TextEditingController();

  @override
  TextEditingController notesController = TextEditingController();

  Branch? editBranch;

  Future<void> init(Branch? branch) async {
    editBranch = branch;



    if (editBranch == null){
      customNoController.text = (DateTime
          .now()
          .millisecondsSinceEpoch ~/ 1015).toString();

      branchController.text = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      arabicNameController.text = '';
      arabicDescriptionController.text = '';
      englishNameController.text = '';
      englishDescriptionController.text = '';
      notesController.text = '';
      addressController.text = '';
    }else {
      branchController.text = editBranch!.branch.toString();
      customNoController.text = editBranch!.customNo.toString();
      arabicNameController.text = editBranch!.arabicName;
      arabicDescriptionController.text = editBranch!.arabicDescription;
      englishNameController.text = editBranch!.englishName;
      englishDescriptionController.text = editBranch!.englishDescription;
      notesController.text = editBranch!.note;
      addressController.text = editBranch!.address;
    }
    notifyListeners();

}


  Future<void> save() async {
    if(!formKey.currentState!.validate()){
      return;
    }

    final branch = Branch(
        branch: int.tryParse(branchController.text.trim()) ?? 0,
        customNo: int.tryParse(customNoController.text.trim()) ?? 0,
        arabicName: arabicNameController.text.trim(),
        arabicDescription: arabicDescriptionController.text.trim(),
        englishName: englishNameController.text.trim(),
        englishDescription: englishDescriptionController.text.trim(),
        note: notesController.text.trim(),
        address: addressController.text.trim()
    );

    if (editBranch != null) {
      await UpdateBranchUC(branch: branch).execute();
    } else {
      await CreateBranchUC(branch: branch).execute();
    }

  }

  void nextPage(WidgetRef ref) {
    final homeProvider = ref.read(ProviderVM.homeVM);
    final List<Branch> branches = homeProvider.branches;
    int index = homeProvider.getBranchIndexByBranchId(int.parse(branchController.text));

    if (index == branches.length - 1) {
      init(null);
    } else {

      int indexToGo = index + 1;

      if (branches.length > indexToGo) {
        init(branches[indexToGo]);
      }else {
        init(null);
      }

    }
  }

  void previousPage(WidgetRef ref) {
    final homeProvider = ref.read(ProviderVM.homeVM);
    final List<Branch> branches = homeProvider.branches;
    int index = homeProvider.getBranchIndexByBranchId(int.parse(branchController.text));

    if (index == 0) {
      init(null);
    } else {

      int indexToGo = index - 1;

      if (indexToGo >= 0) {
        init(branches[indexToGo]);
      } else {
        init(branches.last);
      }

    }
  }

  void firstPage(WidgetRef ref) {
    final homeProvider = ref.read(ProviderVM.homeVM);
    final List<Branch> branches = homeProvider.branches;
    init(branches.first);
  }

  void lastPage(WidgetRef ref) {
    final homeProvider = ref.read(ProviderVM.homeVM);
    final List<Branch> branches = homeProvider.branches;
    init(branches.last);
  }

}
abstract class _AddPersonUI{
  late TextEditingController branchController;
  late TextEditingController customNoController;
  late TextEditingController arabicNameController;
  late TextEditingController arabicDescriptionController;
  late TextEditingController englishNameController;
  late TextEditingController englishDescriptionController;
  late TextEditingController notesController;
  late TextEditingController addressController;


  late GlobalKey<FormState> formKey;

}